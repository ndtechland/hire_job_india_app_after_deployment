import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/profile.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../controllers/user_profile_controller/user_profile_controller.dart';
import '../../../controllers/user_profile_update_controller/user_profile_update_controller.dart';
import '../../../models/city_model.dart';
import '../../../models/state_model.dart';
import '../../../widget/elevated_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //final _getprofilee; // Assume this is your profile model instance

  final ProfileController _getprofilee = Get.put(ProfileController());

  UserProfileUodateController _userProfileUodateController =
      Get.put(UserProfileUodateController());
  final ProfileController _profileController = Get.find();

  final TextEditingController _nameController = TextEditingController(
      // text: _getprofilee.getprofileModel.response.fullName
      );
  final TextEditingController _emailController = TextEditingController(
      //text: "kpw5@gmail.com"
      );
  final TextEditingController _mobileNumbercontroller = TextEditingController(
      //text: "12345"
      );
  final TextEditingController _dateofbirthController = TextEditingController(
      // text: "0444333333"
      );
  final TextEditingController _experienceController = TextEditingController(
      //  text: "22"
      );
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _currentctcController = TextEditingController();
  final TextEditingController _expactedctcController = TextEditingController();

  final TextEditingController _addressController = TextEditingController(
      //text: "delllhhiii"
      );
  final TextEditingController _pincodeController = TextEditingController(
      //text: "343322"
      );
  final TextEditingController _cvFilePathController = TextEditingController();
  final TextEditingController _profileFilePathController =
      TextEditingController();

  Uint8List? _cvFileContent;
  Uint8List? _cvFileContent2;

  @override
  void initState() {
    super.initState();
    if (_getprofilee.getprofileModel != null) {
      _nameController.text = _getprofilee.getprofileModel!.response!.fullName!;
      _emailController.text = _getprofilee.getprofileModel!.response!.emailId!;
      _mobileNumbercontroller.text =
          _getprofilee.getprofileModel!.response!.mobileNumber.toString();
      _dateOfBirthController.text = formatDateOfBirth(
          _getprofilee.getprofileModel!.response!.dateofbirth.toString());
      _experienceController.text =
          _getprofilee.getprofileModel!.response!.experience!;
      _currentctcController.text =
          _getprofilee.getprofileModel!.response!.currentCtc!.toString();
      _expactedctcController.text =
          _getprofilee.getprofileModel!.response!.expectedCtc!.toString();
      _addressController.text =
          _getprofilee.getprofileModel!.response!.address!;
      _pincodeController.text =
          _getprofilee.getprofileModel!.response!.pincode.toString();
    }
  }

  String formatDateOfBirth(String dateOfBirthString) {
    try {
      DateFormat inputFormat = DateFormat("dd/MM/yyyy");
      DateTime dateOfBirth = inputFormat.parse(dateOfBirthString);
      DateFormat outputFormat = DateFormat("dd-MM-yyyy");
      return outputFormat.format(dateOfBirth);
    } catch (e) {
      try {
        DateFormat inputFormat = DateFormat("yyyy-MM-dd");
        DateTime dateOfBirth = inputFormat.parse(dateOfBirthString);
        DateFormat outputFormat = DateFormat("dd-MM-yyyy");
        return outputFormat.format(dateOfBirth);
      } catch (e) {
        print('Error parsing date: $e');
        return dateOfBirthString;
      }
    }
  }

  Future<void> _checkAndRequestPermissions(BuildContext context) async {
    // Check if storage permission is granted
    if (await Permission.storage.request().isGranted) {
      // Permission is already granted, proceed with file selection
      _selectCVFile(context);
    } else {
      // Permission is not granted, request it
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted, proceed with file selection
        _selectCVFile(context);
      } else if (status.isDenied) {
        // Permission denied with 'never ask again' enabled, open app settings
        print('Permission denied with never ask again');
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Permissions Required'),
            content: Text(
                'Please grant storage permission in app settings to continue using this feature.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings(); // Opens app settings page
                },
              ),
            ],
          ),
        );
      } else {
        // Permission denied, show a message
        print('Permission denied');
        Fluttertoast.showToast(
          msg: "Storage permission is required to access files.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  // Future<void> _checkAndRequestPermissions(context) async {
  //   if (await Permission.storage.request().isGranted) {
  //     _selectCVFile(context);
  //   } else {
  //     await Permission.storage.request();
  //     if (await Permission.storage.isGranted) {
  //       _selectCVFile(context);
  //     } else {
  //       print('Storage permission is required to access files.');
  //     }
  //   }
  // }

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

  Future<void> _checkAndRequestPermissions2(BuildContext context) async {
    // Check if storage permission is granted
    if (await Permission.storage.request().isGranted) {
      // Permission is already granted, proceed with file selection
      _selectCVFile2(context);
    } else {
      // Permission is not granted, request it
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted, proceed with file selection
        _selectCVFile2(context);
      } else if (status.isDenied) {
        // Permission denied with 'never ask again' enabled, open app settings
        print('Permission denied with never ask again');
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Permissions Required'),
            content: Text(
                'Please grant storage permission in app settings to continue using this feature.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings(); // Opens app settings page
                },
              ),
            ],
          ),
        );
      } else {
        // Permission denied, show a message
        print('Permission denied');
        Fluttertoast.showToast(
          msg: "Storage permission is required to access files.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  // Future<void> _checkAndRequestPermissions2(context) async {
  //   if (await Permission.storage.request().isGranted) {
  //     _selectCVFile2(context);
  //   } else {
  //     await Permission.storage.request();
  //     if (await Permission.storage.isGranted) {
  //       _selectCVFile2(context);
  //     } else {
  //       print('Storage permission is required to access files.');
  //     }
  //   }
  // }

  Future<void> _selectCVFile2(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
        withData: true, // Ensure the file picker reads the file data
      );
      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        print('Selected file: ${file.name}, path: ${file.path}');

        if (file.size! <= 10 * 1024 * 1024) {
          // Check if file size is less than or equal to 10MB
          if (file.bytes != null) {
            _profileFilePathController.text = file.name;
            _cvFileContent2 = file.bytes!;
            print('File size: ${_cvFileContent2!.length} bytes');
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

  // static const String id = 'Profile';

  //GetProfileModel? getprofileModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///todo: date formate in datetime......
    String formatDateOfBirth(String dateOfBirthString) {
      // Try parsing with the first format
      try {
        DateFormat inputFormat = DateFormat("dd/MM/yyyy");
        DateTime dateOfBirth = inputFormat.parse(dateOfBirthString);
        DateFormat outputFormat = DateFormat("dd-MM-yyyy");
        return outputFormat.format(dateOfBirth);
      } catch (e) {
        // If the first format fails, try the second format
        try {
          DateFormat inputFormat = DateFormat("yyyy-MM-dd");
          DateTime dateOfBirth = inputFormat.parse(dateOfBirthString);
          DateFormat outputFormat = DateFormat("dd-MM-yyyy");
          return outputFormat.format(dateOfBirth);
        } catch (e) {
          // If both formats fail, return the original string or handle the error
          print('Error parsing date: $e');
          return dateOfBirthString;
        }
      }
    }

    ///
    String imageUrl2 =
        // "${FixedText.apiurl2}$
        "${_getprofilee.getprofileModel?.response?.profileImage}";
    print("imageUrl1");
    print(imageUrl2);
    return Scaffold(
      // drawer: NavBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   title: const Text('Profile'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Obx(
        () => (_getprofilee.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _userProfileUodateController.userprifileFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            blackHeadingSmall(
                                'Basic Informations'.toUpperCase()),
                            GestureDetector(
                                onTap: () async {
                                  await _profileController.profileApi();
                                  _profileController.update();
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: appcolorText('View'))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.name,
                              controller: _nameController,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter Name';
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                labelText: 'Name',
                                suffixIcon: Icon(
                                  Icons.person,
                                  size: 23,
                                  color: Colors.black12,
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: appColor),
                                ),
                              ),
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     const SizedBox(height: 10),
                            //     greyTextSmall('Gender'),
                            //     const SizedBox(height: 8),
                            //     Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         _buildSelect('Male', 1),
                            //         _buildSelect('Female', 2),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,

                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                controller: _mobileNumbercontroller,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter Mobile no.';
                                //   }
                                // Regular expression for exactly 10 digits
                                //  mobileRegex = RegExp(r'^[0-9]{10}$');
                                // if (!mobileRegex.hasMatch(value)) {
                                //   return 'Mobile number should be exactly 10 digits long';
                                // }
                                //return null;

                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.phone,
                                    size: 23,
                                    color: Colors.black12,
                                  ),
                                  labelText: "Phone Number",
                                  hintStyle: (TextStyle(
                                    fontSize: 13,
                                  )),
                                  labelStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                readOnly: true,
                                controller: _dateOfBirthController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter DOB';
                                  }
                                  return null;
                                },
                                onTap: () {
                                  //chooseDate();
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    size: 23,
                                    color: Colors.black12,
                                  ),
                                  labelText: "Date Of Birth",
                                  hintStyle: (TextStyle(
                                    fontSize: 13,
                                  )),
                                  labelStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.email,
                                    size: 23,
                                    color: Colors.black12,
                                  ),
                                  labelText: "Email",
                                  hintStyle: (TextStyle(
                                    fontSize: 13,
                                  )),
                                  labelStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            blackHeadingSmall('Location'.toUpperCase()),
                            GestureDetector(
                                onTap: () async {
                                  await _profileController.profileApi();
                                  _profileController.update();
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: appcolorText('View'))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Obx(
                                () => DropdownButtonFormField<StateModelss>(
                                    value: _userProfileUodateController
                                        .selectedState.value,
                                    decoration: InputDecoration(
                                      labelText: 'State',
                                      suffixIcon: Icon(
                                        Icons.place,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                    ),
                                    hint: Text(
                                      //"State",
                                      _getprofilee.getprofileModel!.response!
                                              .stateName ??
                                          "",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    items: _userProfileUodateController.states
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
                                    // validator: (value) =>
                                    //     value == null ? 'Select States' : null,
                                    onChanged: (StateModelss? newValue) {
                                      _userProfileUodateController
                                          .selectedState.value = newValue!;
                                      _userProfileUodateController
                                          .selectedCity.value = null;
                                    }),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Obx(
                                () => DropdownButtonFormField<CityModell>(
                                    value: _userProfileUodateController
                                        .selectedCity.value,
                                    decoration: InputDecoration(
                                      labelText: 'City',
                                      suffixIcon: Icon(
                                        Icons.location_city,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      // suffixIcon: Icon(
                                      //   Icons.place_outlined,
                                      //   size: 23,
                                      //   color: Colors.black12,
                                      // ),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                    ),
                                    hint: Text(
                                      //"City",
                                      _getprofilee.getprofileModel!.response!
                                              .cityName ??
                                          "",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    items: _userProfileUodateController.cities
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
                                      _userProfileUodateController.refresh();
                                    },
                                    // validator: (value) =>
                                    //     value == null ? 'Select City' : null,
                                    onChanged: (CityModell? newValue) {
                                      _userProfileUodateController
                                          .selectedCity.value = newValue!;
                                    }),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                controller: _addressController,
                                decoration: InputDecoration(
                                  labelText: "Address",
                                  suffixIcon: Icon(
                                    Icons.web,
                                    size: 23,
                                    color: Colors.black12,
                                  ),
                                  hintStyle: (TextStyle(
                                    fontSize: 13,
                                  )),
                                  labelStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                controller: _pincodeController,
                                decoration: InputDecoration(
                                  labelText: "Pin Code",
                                  suffixIcon: Icon(
                                    Icons.pin,
                                    size: 23,
                                    color: Colors.black12,
                                  ),
                                  hintStyle: (TextStyle(
                                    fontSize: 13,
                                  )),
                                  labelStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            blackHeadingSmall('Others'.toUpperCase()),
                            GestureDetector(
                                onTap: () async {
                                  await _profileController.profileApi();
                                  _profileController.update();
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: appcolorText('View'))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
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
                                      color: Colors.black54, fontSize: 15),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                controller: _currentctcController,
                                decoration: InputDecoration(
                                  labelText: "Current CTC",
                                  suffixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 23,
                                    color: Colors.black12,
                                  ),
                                  hintStyle: (TextStyle(
                                    fontSize: 13,
                                  )),
                                  labelStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: TextFormField(
                                controller: _expactedctcController,
                                decoration: InputDecoration(
                                  labelText: "Expected CTC",
                                  suffixIcon: Icon(
                                    Icons.currency_rupee,
                                    size: 23,
                                    color: Colors.black12,
                                  ),
                                  hintStyle: (TextStyle(
                                    fontSize: 13,
                                  )),
                                  labelStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              ),
                            ),
                            //textFieldNo('High School Degree'),
                            // textFieldNo('Higher Secondary Education'),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 16, vertical: 16),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       blackHeadingSmall('Skills'.toUpperCase()),
                      //       GestureDetector(
                      //           onTap: () {}, child: appcolorText('Edit'))
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: double.infinity,
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 16, horizontal: 16),
                      //   margin: const EdgeInsets.symmetric(
                      //       vertical: 0, horizontal: 16),
                      //   decoration: const BoxDecoration(
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black12,
                      //         blurRadius: 20.0,
                      //       ),
                      //     ],
                      //     borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      //   ),
                      //   child: Wrap(
                      //     children: [
                      //       _buildSkils('Flutter'),
                      //       _buildSkils('React'),
                      //       _buildSkils('Kotlin'),
                      //       _buildSkils('.Net'),
                      //       _buildSkils('Java'),
                      //       _buildSkils('Python'),
                      //       _buildSkils('PHP'),
                      //     ],
                      //   ),
                      // ),
                      ///cv....
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            blackHeadingSmall('My Resume'.toUpperCase()),
                            GestureDetector(
                                onTap: () async {
                                  await _profileController.profileApi();
                                  _profileController.update();
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: appcolorText('View'))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                        child: Row(
                          children: [
                            // Expanded widget to ensure the TextField takes the remaining width
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please select your cv';
                                //   }
                                //   return null;
                                // },
                                controller: _cvFilePathController,
                                decoration:
                                    InputDecoration(labelText: 'CV File'),
                                enabled: false,
                              ),
                            ),
                            SizedBox(width: 10),

                            // Add some spacing between the TextField and the Button
                            Container(
                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                onPressed: () => _selectCVFile(context),
                                // _checkAndRequestPermissions(
                                // context), // Use a lambda function
                                style: ElevatedButton.styleFrom(
                                  primary: appColor, // Button color
                                  onPrimary: Colors.white, // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
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
                      ),

                      ///profile....
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            blackHeadingSmall('Profile Image'.toUpperCase()),
                            GestureDetector(
                                onTap: () async {
                                  await _profileController.profileApi();
                                  _profileController.update();
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: appcolorText('View'))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 06),
                        child: Row(
                          children: [
                            // Expanded widget to ensure the TextField takes the remaining width
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please select your cv';
                                //   }
                                //   return null;
                                // },
                                controller: _profileFilePathController,
                                decoration:
                                    InputDecoration(labelText: 'Profile Image'),
                                enabled: false,
                              ),
                            ),
                            SizedBox(width: 10),

                            // Add some spacing between the TextField and the Button
                            Container(
                              width: 80,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                onPressed: () => _selectCVFile2(context),
                                // _checkAndRequestPermissions2(
                                // context), // Use a lambda function
                                style: ElevatedButton.styleFrom(
                                  primary: appColor, // Button color
                                  onPrimary: Colors.white, // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded corners
                                  ),
                                ),
                                child: Text(
                                  'Profile\n Image',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 40),

                      MyElevatedButton(
                        onPressed: () {
                          // Ensure date is formatted correctly
                          String formattedDateOfBirth =
                              formatDateOfBirth(_dateOfBirthController.text);

                          // Use null-aware operators to handle potential null values
                          String stateId = _userProfileUodateController
                                  .selectedState.value?.id
                                  .toString() ??
                              _getprofilee.getprofileModel?.response?.stateid
                                  ?.toString() ??
                              "2";
                          String cityId = _userProfileUodateController
                                  .selectedCity.value?.id
                                  .toString() ??
                              _getprofilee.getprofileModel?.response?.cityid
                                  ?.toString() ??
                              "158";

                          // Here you can send `_aadharImages` to your backend API
                          // Make sure to handle the list of Uint8List in your backend
                          // For example:
                          // sendAadharFilesToServer(_aadharImages);
                          ///
                          // if (_employeeloginController.loginFormKey2.currentState
                          //     ?.validate() ??
                          //     false) {
                          //   _employeeloginController.checkemployeeLogin();
                          // }
                          ///selectedState.value?.id.toString() ??
                          ///   _doctorProfileControllers.doctorProfile?.stateMasterId,
                          ///   _getprofilee
                          ///
                          // Retrieve current CV file content and CV file name from the current profile data
                          // Uint8List? currentCVFileContent = _getprofilee.getprofileModel?.response?.cvFileContent ?? Uint8List(0);
                          // String currentCVFileName = _getprofilee.getprofileModel?.response?.resumeFilePath ?? '';
                          //
                          // Uint8List? currentCVFileContent = _getprofilee
                          //     .getprofileModel?.response?.cvFileContent;
                          // String currentCVFileName = _getprofilee
                          //         .getprofileModel?.response?.resumeFilePath ??
                          //     '';
                          // Set the CV file content and CV file name if available
                          //_cvFileContent = currentCVFileContent;
                          //_cvFilePathController.text = currentCVFileName;

                          _userProfileUodateController.updateUseerrProfile(
                            fullName: _nameController.text,
                            emailID: _emailController.text,
                            mobileNumber: _mobileNumbercontroller.text,
                            experience: _experienceController.text,
                            stateId: stateId,
                            //_userProfileUodateController.selectedState.value!.id.toString() ? "1",
                            // ??
                            // _getprofilee.getprofileModel!.response!.stateid
                            //     .toString(),
                            cityId: cityId,
                            // _userProfileUodateController
                            //     .selectedCity.value!.id
                            //     .toString(),
                            dateofbirth: formattedDateOfBirth,
                            //_dateOfBirthController.text,
                            address: _addressController.text,
                            pincode: _pincodeController.text,
                            currentCTC: _currentctcController.text,
                            expectedCTC: _expactedctcController.text,

                            cvFileContent: _cvFileContent!, // Pass file content
                            CVFileName: _cvFilePathController.text,
                            cvFileContent2:
                                _cvFileContent2!, // Pass file content
                            ProfileImage: _profileFilePathController
                                .text, // Pass PAN file name
                          );
                          // await Future.delayed(Duration(seconds: 3));

                          ///Clear dropdown value
                          //_profileController.selectedState.value = null;
                          // _profileController.selectedCity.value = null;
                        },
                        text: Text('Update'),
                        height: 40,
                        width: 200,
                      ),

                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 16, horizontal: 16),
                      //   margin: const EdgeInsets.symmetric(
                      //       vertical: 0, horizontal: 16),
                      //   decoration: const BoxDecoration(
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black12,
                      //         blurRadius: 20.0,
                      //       ),
                      //     ],
                      //     borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Image.asset('lib/assets/images/c3.png',
                      //           width: 40, height: 40, color: Colors.black38),
                      //       const SizedBox(width: 10),
                      //       Expanded(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             boldText('Kumar Prince CV'),
                      //             greyTextSmall('lib/Updated on 20 Jan 2024')
                      //           ],
                      //         ),
                      //       ),
                      //       const Icon(Icons.more_vert,
                      //           size: 18, color: Colors.black38)
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // Widget _buildBody() {
  //   return SingleChildScrollView(
  //       child: Column(
  //     children: [
  //       _buildHeader(),
  //       const SizedBox(height: 8),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             blackHeadingSmall('Basic Informations'.toUpperCase()),
  //             GestureDetector(onTap: () {}, child: appcolorText('Edit'))
  //           ],
  //         ),
  //       ),
  //       Container(
  //           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 blurRadius: 20.0,
  //               ),
  //             ],
  //             borderRadius: BorderRadius.all(Radius.circular(6.0)),
  //           ),
  //           child: Column(
  //             children: [
  //               TextFormField(
  //                 keyboardType: TextInputType.name,
  //                 controller: _nameController,
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Please enter Name';
  //                   }
  //                   return null;
  //                 },
  //                 decoration: InputDecoration(
  //                   labelText: 'Name',
  //                   suffixIcon: Icon(
  //                     Icons.person,
  //                     size: 23,
  //                     color: Colors.black12,
  //                   ),
  //                   labelStyle:
  //                       const TextStyle(color: Colors.black54, fontSize: 15),
  //                   focusedBorder: const UnderlineInputBorder(
  //                     borderSide: BorderSide(color: appColor),
  //                   ),
  //                 ),
  //               ),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const SizedBox(height: 10),
  //                   greyTextSmall('Gender'),
  //                   const SizedBox(height: 8),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       _buildSelect('Male', 1),
  //                       _buildSelect('Female', 2),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const SizedBox(height: 20),
  //                   greyTextSmall('Date of Birth'),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                           child: DropdownButton<String>(
  //                         value: dropdownValueDay,
  //                         icon: const Icon(Icons.arrow_drop_down),
  //                         style: const TextStyle(color: Colors.black87),
  //                         onChanged: (String? newValue) {
  //                           // setState(() {
  //                           //   dropdownValueDay = newValue!;
  //                           // });
  //                         },
  //                         items: <String>['1', '2', '3', '4']
  //                             .map<DropdownMenuItem<String>>((String value) {
  //                           return DropdownMenuItem<String>(
  //                             value: value,
  //                             child: Text(value),
  //                           );
  //                         }).toList(),
  //                       )),
  //                       const SizedBox(width: 10),
  //                       Expanded(
  //                         child: DropdownButton<String>(
  //                           value: dropdownValueMonth,
  //                           onChanged: (String? newValue) {
  //                             // setState(() {
  //                             //   dropdownValueMonth = newValue!;
  //                             // });
  //                           },
  //                           items: <String>[
  //                             'January',
  //                             'February',
  //                             'March',
  //                             'April',
  //                             'May',
  //                             'June',
  //                             'July',
  //                             'August',
  //                             'September',
  //                             'October',
  //                             'November',
  //                             'December'
  //                           ].map<DropdownMenuItem<String>>((String value) {
  //                             return DropdownMenuItem<String>(
  //                               value: value,
  //                               child: Text(
  //                                 value.toUpperCase(),
  //                                 style: TextStyle(fontSize: 11),
  //                               ), // Capitalize the text here
  //                             );
  //                           }).toList(),
  //                         ),
  //                       ),
  //                       const SizedBox(width: 10),
  //                       Expanded(
  //                           child: DropdownButton<String>(
  //                         value: dropdownValueYear,
  //                         icon: const Icon(Icons.arrow_drop_down),
  //                         style: const TextStyle(color: Colors.black87),
  //                         onChanged: (String? newValue) {
  //                           // setState(() {
  //                           //   dropdownValueYear = newValue!;
  //                           // });
  //                         },
  //                         items: <String>[
  //                           '1990',
  //                           '1991',
  //                           '1992',
  //                           '1993',
  //                           '1994',
  //                           '1995',
  //                           '1996',
  //                           '1997'
  //                         ].map<DropdownMenuItem<String>>((String value) {
  //                           return DropdownMenuItem<String>(
  //                             value: value,
  //                             child: Text(value),
  //                           );
  //                         }).toList(),
  //                       )),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               textFieldNo('Phone Number'),
  //               textFieldNo('Email Address'),
  //               const SizedBox(height: 10),
  //             ],
  //           )),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             blackHeadingSmall('Location'.toUpperCase()),
  //             GestureDetector(onTap: () {}, child: appcolorText('Edit'))
  //           ],
  //         ),
  //       ),
  //       Container(
  //           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 blurRadius: 20.0,
  //               ),
  //             ],
  //             borderRadius: BorderRadius.all(Radius.circular(6.0)),
  //           ),
  //           child: Column(
  //             children: [
  //               textFieldNo('Home Address'),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const SizedBox(height: 20),
  //                   Row(
  //                     children: [
  //                       Expanded(child: greyTextSmall('Country')),
  //                       const SizedBox(width: 10),
  //                       Expanded(child: greyTextSmall('Zip Code'))
  //                     ],
  //                   ),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                           child: DropdownButton<String>(
  //                         value: dropdownValueCountry,
  //                         icon: const Icon(Icons.arrow_drop_down),
  //                         style: const TextStyle(color: Colors.black87),
  //                         onChanged: (String? newValue) {
  //                           // setState(() {
  //                           //   dropdownValueCountry = newValue!;
  //                           // });
  //                         },
  //                         items: <String>[
  //                           'India',
  //                           'Nepal',
  //                           'Bhutan',
  //                           'USA',
  //                           'Russia',
  //                           'Canada'
  //                         ].map<DropdownMenuItem<String>>((String value) {
  //                           return DropdownMenuItem<String>(
  //                             value: value,
  //                             child: Text(value),
  //                           );
  //                         }).toList(),
  //                       )),
  //                       const SizedBox(width: 10),
  //                       Expanded(
  //                           child: DropdownButton<String>(
  //                         value: dropdownValueZip,
  //                         icon: const Icon(Icons.arrow_drop_down),
  //                         style: const TextStyle(color: Colors.black87),
  //                         onChanged: (String? newValue) {
  //                           // setState(() {
  //                           //   dropdownValueZip = newValue!;
  //                           // });
  //                         },
  //                         items: <String>[
  //                           '110096',
  //                           '110094',
  //                           '445005',
  //                           '452322'
  //                         ].map<DropdownMenuItem<String>>((String value) {
  //                           return DropdownMenuItem<String>(
  //                             value: value,
  //                             child: Text(value),
  //                           );
  //                         }).toList(),
  //                       )),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 10),
  //             ],
  //           )),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             blackHeadingSmall('Education'.toUpperCase()),
  //             GestureDetector(onTap: () {}, child: appcolorText('Edit'))
  //           ],
  //         ),
  //       ),
  //       Container(
  //           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 blurRadius: 20.0,
  //               ),
  //             ],
  //             borderRadius: BorderRadius.all(Radius.circular(6.0)),
  //           ),
  //           child: Column(
  //             children: [
  //               textFieldNo('Collage'),
  //               textFieldNo('High School Degree'),
  //               textFieldNo('Higher Secondary Education'),
  //               const SizedBox(height: 10),
  //             ],
  //           )),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             blackHeadingSmall('Skills'.toUpperCase()),
  //             GestureDetector(onTap: () {}, child: appcolorText('Edit'))
  //           ],
  //         ),
  //       ),
  //       Container(
  //           width: double.infinity,
  //           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  //           margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 blurRadius: 20.0,
  //               ),
  //             ],
  //             borderRadius: BorderRadius.all(Radius.circular(6.0)),
  //           ),
  //           child: Wrap(
  //             children: [
  //               _buildSkils('Flutter'),
  //               _buildSkils('React'),
  //               _buildSkils('Kotlin'),
  //               _buildSkils('.Net'),
  //               _buildSkils('Java'),
  //               _buildSkils('Python'),
  //               _buildSkils('PHP'),
  //             ],
  //           )),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             blackHeadingSmall('My Resume'.toUpperCase()),
  //             GestureDetector(onTap: () {}, child: appcolorText('Edit'))
  //           ],
  //         ),
  //       ),
  //       Container(
  //           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  //           margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 blurRadius: 20.0,
  //               ),
  //             ],
  //             borderRadius: BorderRadius.all(Radius.circular(6.0)),
  //           ),
  //           child: Row(
  //             children: [
  //               Image.asset('lib/assets/images/c3.png',
  //                   width: 40, height: 40, color: Colors.black38),
  //               const SizedBox(width: 10),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     boldText('Kumar Prince CV'),
  //                     greyTextSmall('lib/Updated on 20 Jan 2024')
  //                   ],
  //                 ),
  //               ),
  //               const Icon(Icons.more_vert, size: 18, color: Colors.black38)
  //             ],
  //           )),
  //       const SizedBox(height: 20)
  //     ],
  //   ));
  // }
  ///

  Widget _buildHeader() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[appColor2, appColor]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white)),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'medium',
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 40)
              ],
            ),
            // const CircleAvatar(
            //   backgroundImage: AssetImage('lib/assets/images/p2.jpg'),
            //   radius: 40,
            // ),
            // const SizedBox(height: 8),
            // const Text(
            //   'Kavi Singh',
            //   style: TextStyle(
            //       fontSize: 18, fontFamily: 'medium', color: Colors.white),
            // ),
            // const SizedBox(height: 8),
            // const Text(
            //   'kavi@princeltd.com',
            //   style: TextStyle(fontSize: 14, color: Colors.white),
            // ),
            // const SizedBox(height: 10),
            // SizedBox(
            //   width: 120,
            //   child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //           primary: backgroundColor,
            //           shadowColor: Colors.black38,
            //           onPrimary: Colors.black,
            //           elevation: 0,
            //           shape: (RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(6),
            //           )),
            //           padding: const EdgeInsets.all(0)),
            //       child: greyTextSmall('My Resume'.toUpperCase())),
            // ),
          ],
        ));
  }

  // Widget _buildSelect(title, id) {
  //   return GestureDetector(
  //     onTap: () {
  //       // setState(() {
  //       //   selectID = id;
  //       // });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
  //       margin: const EdgeInsets.symmetric(vertical: 4),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.black12),
  //         color: selectID == id ? appColor : Colors.transparent,
  //         borderRadius: const BorderRadius.all(Radius.circular(50.0)),
  //       ),
  //       child: Text(title,
  //           style: TextStyle(
  //               fontFamily: 'medium',
  //               fontSize: 14,
  //               color: selectID == id ? Colors.white : Colors.black54)),
  //     ),
  //   );
  // }

  Widget _buildSkils(val) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[appColor2, appColor]),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: btnText(val),
    );
  }
}
