import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../controllers/registrationss/registration_controller.dart';
import '../../../models/city_model.dart';
import '../../../models/state_model.dart';
import '../../../widget/elevated_button.dart';
import '../../../widget/text_btn.dart';
import 'login.dart';

enum Gender { male, female, other }

class RegistrationPage extends StatelessWidget {
  final RegistrationController _profileController =
      Get.put(RegistrationController());

  final TextEditingController _nameController = TextEditingController(
      //  text: "kptt1"
      );
  final TextEditingController _emailController = TextEditingController(
      //text: "kpw5@gmail.com"
      );
  final TextEditingController _passwordController = TextEditingController(
      //text: "12345"
      );
  final TextEditingController _mobileNumberController = TextEditingController(
      // text: "0444333333"
      );
  final TextEditingController _experienceController = TextEditingController(
      //  text: "22"
      );
  final TextEditingController _stateIdController = TextEditingController();
  final TextEditingController _cityIdController = TextEditingController();
  final TextEditingController _genderNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController(
      //text: "delllhhiii"
      );
  final TextEditingController _pincodeController = TextEditingController(
      //text: "343322"
      );
  final TextEditingController _cvFilePathController = TextEditingController();

  Uint8List? _cvFileContent;
  Gender? _selectedGender = Gender.male;

  Future<void> _checkAndRequestPermissions(context) async {
    if (await Permission.storage.request().isGranted) {
      _selectCVFile(context);
    } else {
      await Permission.storage.request();
      if (await Permission.storage.isGranted) {
        _selectCVFile(context);
      } else {
        print('Storage permission is required to access files.');
      }
    }
  }

  Future<void> _selectCVFile(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: true, // Ensure the file picker reads the file data
      );
      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        print('Selected file: ${file.name}, path: ${file.path}');

        if (file.size! <= 10 * 1024 * 1024) {
          // Check if file size is less than or equal to 10MB
          if (file.bytes != null) {
            _cvFilePathController.text = file.name;
            _cvFileContent = file.bytes!;
            print('File size: ${_cvFileContent!.length} bytes');
          } else {
            print('Failed to read file content: File bytes are null');
          }
        } else {
          Fluttertoast.showToast(
              msg: "Selected file exceeds 10MB limit",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        print('No file selected');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  var selectedDate = DateTime.now().obs;

  chooseDate() async {
    DateTime today = DateTime.now();
    DateTime firstDate = DateTime(today.year - 14, today.month, today.day);
    DateTime lastDate = DateTime(1900);

    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: firstDate,
      firstDate: DateTime(1900),
      lastDate: firstDate,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      _dateOfBirthController
        ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateOfBirthController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  ///

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            bool isPortrait = constraints.maxHeight > constraints.maxWidth;

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: _buildAppBar(),
              body: Obx(
                () => _profileController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    //child:
                    : Form(
                        key: _profileController.signupFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SingleChildScrollView(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 0.1, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20.0,
                                    )
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller: _nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Name';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Name',
                                        suffixIcon: Icon(
                                          Icons.person,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Email';
                                        }
                                        // Regular expression for email validation
                                        final emailRegex = RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        suffixIcon: Icon(
                                          Icons.email,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Password';
                                        }
                                        if (value.length < 5) {
                                          return 'Password must be at least 5 characters long';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        suffixIcon: Icon(
                                          Icons.lock,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10)
                                      ],
                                      //maxLength: 10,
                                      controller: _mobileNumberController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Mobile no.';
                                        }
                                        // Regular expression for exactly 10 digits
                                        final mobileRegex =
                                            RegExp(r'^[0-9]{10}$');
                                        if (!mobileRegex.hasMatch(value)) {
                                          return 'Mobile number should be exactly 10 digits long';
                                        }
                                        return null;
                                      },

                                      decoration: InputDecoration(
                                        labelText: 'Mobile Number',
                                        suffixIcon: Icon(
                                          Icons.phone_android_outlined,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _experienceController,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(2)
                                      ],
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Experience';
                                        }
                                        // Convert the value to an integer
                                        final experience = int.tryParse(value);
                                        if (experience == null) {
                                          return 'Invalid experience value';
                                        }
                                        if (experience < 0 || experience > 50) {
                                          return 'Experience should be between 0 and 50 years';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Experience (in Year)',
                                        suffixIcon: Icon(
                                          Icons.account_box,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),

                                    Obx(
                                      () => DropdownButtonFormField<
                                              StateModelss>(
                                          value: _profileController
                                              .selectedState.value,
                                          decoration: InputDecoration(
                                            labelText: 'State',
                                            suffixIcon: Icon(
                                              Icons.place_outlined,
                                              size: 23,
                                              color: Colors.black12,
                                            ),
                                            labelStyle: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: appColor),
                                            ),
                                          ),
                                          hint: Text('Select State'),
                                          items: _profileController.states
                                              .map((StateModelss items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items.sName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: size.height * 0.015,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          validator: (value) => value == null
                                              ? 'Select State'
                                              : null,
                                          onChanged: (StateModelss? newValue) {
                                            _profileController.selectedState
                                                .value = newValue!;
                                            _profileController
                                                .selectedCity.value = null;
                                          }),
                                    ),

                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),

                                    Obx(
                                      () => DropdownButtonFormField<CityModell>(
                                          value: _profileController
                                              .selectedCity.value,
                                          decoration: InputDecoration(
                                            labelText: 'City',
                                            suffixIcon: Icon(
                                              Icons.place_outlined,
                                              size: 23,
                                              color: Colors.black12,
                                            ),
                                            labelStyle: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: appColor),
                                            ),
                                          ),
                                          hint: Text('Select City'),
                                          items: _profileController.cities
                                              .map((CityModell items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items.cityName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: size.height * 0.015,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onTap: () {
                                            _profileController.refresh();
                                          },
                                          validator: (value) => value == null
                                              ? 'Select City'
                                              : null,
                                          onChanged: (CityModell? newValue) {
                                            _profileController
                                                .selectedCity.value = newValue!;
                                          }),
                                    ),

                                    // TextField(
                                    //   controller: _stateIdController,
                                    //   decoration: InputDecoration(labelText: 'State ID'),
                                    // ),
                                    // TextField(
                                    //   controller: _cityIdController,
                                    //   decoration: InputDecoration(labelText: 'City ID'),
                                    // ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Choose Gender',
                                        style: TextStyle(
                                          fontSize: size.height * 0.016,

                                          /// fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),

                                    InkWell(
                                      onTap: () => _profileController
                                          .selectedGender.value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Obx(
                                              () => RadioListTile(
                                                title: Text(
                                                  'Male',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.014,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                visualDensity: VisualDensity(
                                                  horizontal: VisualDensity
                                                      .minimumDensity,
                                                  vertical: VisualDensity
                                                      .minimumDensity,
                                                ),

                                                // title: Text("Male"),
                                                value:
                                                    //_nurseBooking1Controller.selectedshift.value,
                                                    "Male",
                                                groupValue: _profileController
                                                    .selectedGender.value,
                                                onChanged: (value) {
                                                  _profileController
                                                      .onChangeShifts(value!);
                                                  // setState(() {
                                                  //   gender = value.toString();
                                                  // });
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Obx(
                                              () => RadioListTile(
                                                title: Text(
                                                  'Female',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.014,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                visualDensity: VisualDensity(
                                                  horizontal: VisualDensity
                                                      .minimumDensity,
                                                  vertical: VisualDensity
                                                      .minimumDensity,
                                                ),
                                                // title: Text("Male"),
                                                value:
                                                    //_nurseBooking1Controller.selectedshift.value,
                                                    "Female",
                                                groupValue: _profileController
                                                    .selectedGender.value,
                                                onChanged: (value) {
                                                  _profileController
                                                      .onChangeShifts(value!);
                                                  // setState(() {
                                                  //   gender = value.toString();
                                                  // });
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Obx(
                                              () => RadioListTile(
                                                title: Text(
                                                  'Other',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.014,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                visualDensity: VisualDensity(
                                                  horizontal: VisualDensity
                                                      .minimumDensity,
                                                  vertical: VisualDensity
                                                      .minimumDensity,
                                                ),
                                                // title: Text("Male"),
                                                value:
                                                    //_nurseBooking1Controller.selectedshift.value,
                                                    "Other",
                                                groupValue: _profileController
                                                    .selectedGender.value,
                                                onChanged: (value) {
                                                  _profileController
                                                      .onChangeShifts(value!);
                                                  // setState(() {
                                                  //   gender = value.toString();
                                                  // });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),

                                    // TextField(
                                    //   controller: _genderNameController,
                                    //   decoration: InputDecoration(labelText: 'Gender Name'),
                                    // ),

                                    TextFormField(
                                      textAlign: TextAlign.left,
                                      controller: _dateOfBirthController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter DOB';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        chooseDate();
                                      },
                                      cursorColor: appColor,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Date of Birth',
                                        suffixIcon: Icon(
                                          Icons.calendar_today,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _addressController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Address';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Address',
                                        suffixIcon: Icon(
                                          Icons.pin_drop_outlined,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _pincodeController,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(6)
                                      ],
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Pincode';
                                        } else if (value.length != 6) {
                                          return 'Pincode should be exactly 6 digits long';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Pincode',
                                        suffixIcon: Icon(
                                          Icons.pin,
                                          size: 23,
                                          color: Colors.black12,
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        // Expanded widget to ensure the TextField takes the remaining width
                                        Expanded(
                                          child: TextFormField(
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please select your CV';
                                              }
                                              return null;
                                            },
                                            controller: _cvFilePathController,
                                            decoration: InputDecoration(
                                                labelText: 'CV File'),
                                            enabled: false,
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                10), // Add some spacing between the TextField and the Button
                                        Container(
                                          width: 80,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                _checkAndRequestPermissions(
                                                    context), // Use a lambda function
                                            style: ElevatedButton.styleFrom(
                                              primary: appColor, // Button color
                                              onPrimary:
                                                  Colors.white, // Text color
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10), // Rounded corners
                                              ),
                                            ),
                                            child: Text(
                                              'Upload\n     CV',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),

                                    MyElevatedButton(
                                        onPressed: () async {
                                          if (_profileController
                                                  .signupFormKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            if (_cvFileContent != null) {
                                              _profileController.createProfile(
                                                fullName: _nameController.text,
                                                emailID: _emailController.text,
                                                password:
                                                    _passwordController.text,
                                                mobileNumber:
                                                    _mobileNumberController
                                                        .text,
                                                experience:
                                                    _experienceController.text,
                                                stateId: _profileController
                                                    .selectedState.value!.id
                                                    .toString(),
                                                cityId: _profileController
                                                    .selectedCity.value!.id
                                                    .toString(),
                                                genderName: _profileController
                                                    .selectedGender.value,
                                                dateOfBirth:
                                                    _dateOfBirthController.text,
                                                address:
                                                    _addressController.text,
                                                pincode:
                                                    _pincodeController.text,
                                                cvFileContent:
                                                    _cvFileContent!, // Pass file content
                                                cvFileName:
                                                    _cvFilePathController
                                                        .text, // Pass file name
                                              );
                                              // await Future.delayed(Duration(seconds: 3));

                                              ///Clear dropdown value
                                              //_profileController.selectedState.value = null;
                                              // _profileController.selectedCity.value = null;
                                            } else {
                                              print('Please select a CV file');
                                            }
                                          }

                                          // Navigator.push(
                                          //     context, MaterialPageRoute(builder: (context) => Home()));
                                        },
                                        text: const Icon(Icons.arrow_forward),
                                        height: 40,
                                        width: 40),
                                    Container(
                                      padding: const EdgeInsets.all(24),
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // Column(
                                          //   children: [
                                          //     imageButton('lib/assets/images/google.png',
                                          //         'Login with Google', Colors.red),
                                          //     imageButton('lib/assets/images/linkedin.png',
                                          //         'Login with Linkedin', linkedinColor),
                                          //   ],
                                          // ),
                                          const SizedBox(height: 0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              blackText(
                                                  'Already have an account?'),
                                              MyTextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Login()));
                                                  },
                                                  colors: appColor,
                                                  text: "Sign in")
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: _buildHeader(),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
        width: double.infinity,
        height: 200,
        //MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appColor,
            appColor2,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 12,
            ),
            logoImg(),
            const Text(
              'Welcome to Hire Job India',
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'medium'),
            ),
            Text(
              'SIGNUP With US.',
              style: TextStyle(
                  color: Colors.indigo.shade900,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'medium'),
            ),
          ],
        ));
  }

  logoImg() {
    return Image.asset(
      'lib/assets/logo/hirelogo11.png',
      // 'lib/assets/images/job.png',
      //color: Colors.white,
      width: 100,
      height: 80,
    );
  }
}
