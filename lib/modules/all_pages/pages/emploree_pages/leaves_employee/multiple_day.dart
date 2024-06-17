import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:intl/intl.dart';

import '../../../../../controllers/employeee_controllersss/apply_leave_controller/apply_controllerss.dart';
import '../../../../../models/employee_model/apply_leave_model_dropdown.dart';
import '../../../../../widget/elevated_button.dart';

enum Gender { male, female, other }

class MultipleDayLeavePage extends StatelessWidget {
  // final RegistrationController _profileController =
  //     Get.put(RegistrationController());

  final LeaveApplyController _leaveApplyController =
      Get.put(LeaveApplyController());

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
  final TextEditingController _startleavedateController =
      TextEditingController();
  final TextEditingController _endleavedateController = TextEditingController();

  final TextEditingController _reasonController = TextEditingController(
      //text: "delllhhiii"
      );

  var selectedDate = DateTime.now().obs;
  var selectedDate2 = DateTime.now().obs;

  chooseDate() async {
    DateTime today = DateTime.now();
    DateTime lastDate = DateTime(2050);

    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: today,
      firstDate: today, // Set firstDate to today to disable past dates
      lastDate: lastDate,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select Start Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
    );

    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      _startleavedateController
        ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: _startleavedateController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }

  chooseDate2() async {
    DateTime today = DateTime.now();
    DateTime lastDate = DateTime(2050);

    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: today,
      firstDate: today, // Set firstDate to today to disable past dates
      lastDate: lastDate,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select Start Date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
    );

    if (newpickedDate != null) {
      selectedDate2.value = newpickedDate;
      _endleavedateController
        ..text = DateFormat('yyyy-MM-d').format(selectedDate2.value).toString()
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: _endleavedateController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
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
                () => _leaveApplyController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    //child:
                    : Form(
                        key: _leaveApplyController.leaveapplysignupKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SingleChildScrollView(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 0.1, vertical: 5),
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
                                    ///todo: catagary...
                                    Obx(() => DropdownButtonFormField<
                                            GetLeaveTypeList>(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          iconEnabledColor: appColor,
                                          hint: Text(
                                            'Leave Category',
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          value: _leaveApplyController
                                              .selectedCatDropdown.value,
                                          decoration: InputDecoration(
                                            labelText: 'Select Leave Category',
                                            suffixIcon: Obx(() =>
                                                _leaveApplyController
                                                        .isLoading.value
                                                    ? CircularProgressIndicator()
                                                    : TextButton(
                                                        clipBehavior: Clip.none,
                                                        onPressed:
                                                            _leaveApplyController!
                                                                .getCatLeavecatApi,
                                                        child: Icon(
                                                          Icons.refresh,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      )),
                                            // Icon(
                                            //   Icons.refresh,
                                            //   size: 23,
                                            //   color: Colors.black12,
                                            // ),
                                            labelStyle: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: appColor),
                                            ),
                                          ),
                                          validator: (value) => value == null
                                              ? 'Please Select Leave category'
                                              : null,
                                          onChanged: (newValue) {
                                            _leaveApplyController
                                                .selectedCatDropdown
                                                .value = newValue;
                                          },
                                          items: _leaveApplyController
                                              .leaveCategory
                                              .map((category) {
                                            return DropdownMenuItem<
                                                GetLeaveTypeList>(
                                              value: category,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    category.leavetype ??
                                                        'Unknown',
                                                    style: TextStyle(
                                                        // fontSize:
                                                        //     size.height * 0.02,
                                                        // color: logoColor,
                                                        //  fontWeight:
                                                        //      FontWeight.bold
                                                        ),
                                                  ), // Displaying Leave Type
                                                  SizedBox(
                                                      width: size.width * 0.4),
                                                  Text(
                                                    "${category.leaveValue != null ? category.leaveValue.toString() : 'Unknown'}  Left",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.02,
                                                        color: appColor,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ), // Displaying Leave Value
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        )),

                                    ///todo: type 1 start....

                                    Obx(() =>
                                        DropdownButtonFormField<GetLeaveList>(
                                          //menuMaxHeight: 10,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          iconEnabledColor: appColor,
                                          hint: Text(
                                            'Leave Type start',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          value: _leaveApplyController
                                              .selectedtypedropdown.value,
                                          decoration: InputDecoration(
                                            labelText: 'Leave Type For Start',
                                            suffixIcon: Obx(() =>
                                                _leaveApplyController
                                                        .isLoading.value
                                                    ? CircularProgressIndicator()
                                                    : TextButton(
                                                        clipBehavior: Clip.none,
                                                        onPressed:
                                                            _leaveApplyController!
                                                                .getLeavetypeApi,
                                                        child: Icon(
                                                          Icons.refresh,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      )),
                                            // Icon(
                                            //   Icons.refresh,
                                            //   size: 23,
                                            //   color: Colors.black12,
                                            // ),
                                            labelStyle: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: appColor),
                                            ),
                                          ),
                                          validator: (value) => value == null
                                              ? 'Please Select Start Leave Type'
                                              : null,
                                          onChanged: (newValue) {
                                            _leaveApplyController
                                                .selectedtypedropdown
                                                .value = newValue;
                                          },
                                          items: _leaveApplyController.leaveType
                                              .map((type) {
                                            return DropdownMenuItem<
                                                GetLeaveList>(
                                              value: type,
                                              child: Text(type.typeofleave ??
                                                  'Unknown'),
                                            );
                                          }).toList(),
                                        )),

                                    ///todo: type 2 end....

                                    Obx(() =>
                                        DropdownButtonFormField<GetLeaveList>(
                                          hint: Text(
                                            'Leave Type For End',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          iconEnabledColor: appColor,
                                          value: _leaveApplyController
                                              .selectedtypeenddropdown.value,
                                          decoration: InputDecoration(
                                            labelText: 'Leave Type For End',
                                            suffixIcon: Obx(() =>
                                                _leaveApplyController
                                                        .isLoading.value
                                                    ? CircularProgressIndicator()
                                                    : TextButton(
                                                        clipBehavior: Clip.none,
                                                        onPressed:
                                                            _leaveApplyController!
                                                                .getLeavetypeEndApi,
                                                        child: Icon(
                                                          Icons.refresh,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                      )),
                                            // Icon(
                                            //   Icons.refresh,
                                            //   size: 23,
                                            //   color: Colors.black12,
                                            // ),
                                            labelStyle: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: appColor),
                                            ),
                                          ),
                                          validator: (value) => value == null
                                              ? 'Please Select End Leave Type'
                                              : null,
                                          onChanged: (newValue) {
                                            _leaveApplyController
                                                .selectedtypeenddropdown
                                                .value = newValue;
                                          },
                                          items: _leaveApplyController
                                              .leaveTypeend
                                              .map((type) {
                                            return DropdownMenuItem<
                                                GetLeaveList>(
                                              value: type,
                                              child: Text(type.typeofleave ??
                                                  'Unknown'),
                                            );
                                          }).toList(),
                                        )),

                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),

                                    // TextField(
                                    //   controller: _genderNameController,
                                    //   decoration: InputDecoration(labelText: 'Gender Name'),
                                    // ),

                                    TextFormField(
                                      textAlign: TextAlign.left,
                                      controller: _startleavedateController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Start Date';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        chooseDate();
                                      },
                                      cursorColor: appColor,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Leave Start Date',
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
                                      textAlign: TextAlign.left,
                                      controller: _endleavedateController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter End Date';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        chooseDate2();
                                      },
                                      cursorColor: appColor,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Leave End Date',
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
                                      controller: _reasonController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Reason';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Reason',
                                        suffixIcon: Icon(
                                          Icons.note,
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

                                    SizedBox(height: 40),

                                    // MyElevatedButton(
                                    //     onPressed: () async {
                                    //       if (_leaveApplyController
                                    //               .leaveapplysignupKey
                                    //               .currentState
                                    //               ?.validate() ??
                                    //           false) {
                                    //         if (_leaveApplyController
                                    //                 .selectedCatDropdown
                                    //                 .value!
                                    //                 .id !=
                                    //             null) {
                                    //           _leaveApplyController.applyLeave(
                                    //             catagoryId:
                                    //                 _leaveApplyController
                                    //                     .selectedCatDropdown
                                    //                     .value!
                                    //                     .id
                                    //                     .toString(),
                                    //             Type1Id: _leaveApplyController
                                    //                 .selectedtypedropdown
                                    //                 .value!
                                    //                 .id
                                    //                 .toString(),
                                    //
                                    //             Type2Id: _leaveApplyController
                                    //                 .selectedtypeenddropdown
                                    //                 .value!
                                    //                 .id
                                    //                 .toString(),
                                    //             startDate:
                                    //                 _startleavedateController
                                    //                     .text,
                                    //             endDate: _endleavedateController
                                    //                 .text,
                                    //             Reason: _reasonController.text,
                                    //
                                    //             // Pass file name
                                    //           );
                                    //           // await Future.delayed(Duration(seconds: 3));
                                    //
                                    //           ///Clear dropdown value
                                    //           //_profileController.selectedState.value = null;
                                    //           // _profileController.selectedCity.value = null;
                                    //         } else {
                                    //           print('Please select a CV file');
                                    //         }
                                    //       }
                                    //
                                    //       // Navigator.push(
                                    //       //     context, MaterialPageRoute(builder: (context) => Home()));
                                    //     },
                                    //     text: const Icon(Icons.arrow_forward),
                                    //     height: 40,
                                    //     width: 40),

                                    const SizedBox(height: 0),
                                    MyElevatedButton(
                                      onPressed: () async {
                                        if (_leaveApplyController
                                                .leaveapplysignupKey
                                                .currentState
                                                ?.validate() ??
                                            false) {
                                          if (_leaveApplyController
                                                  .selectedCatDropdown
                                                  .value!
                                                  .id !=
                                              null) {
                                            _leaveApplyController.applyLeave(
                                              typeOfLeaveId:
                                                  _leaveApplyController
                                                      .selectedCatDropdown
                                                      .value!
                                                      .id
                                                      .toString(),
                                              startLeaveId:
                                                  _leaveApplyController
                                                      .selectedtypedropdown
                                                      .value!
                                                      .id
                                                      .toString(),

                                              endeaveId: _leaveApplyController
                                                  .selectedtypeenddropdown
                                                  .value!
                                                  .id
                                                  .toString(),
                                              startDate:
                                                  _startleavedateController
                                                      .text,
                                              endDate:
                                                  _endleavedateController.text,
                                              reason: _reasonController.text,

                                              // Pass file name
                                            );
                                            // await Future.delayed(Duration(seconds: 3));

                                            ///Clear dropdown value
                                            //_profileController.selectedState.value = null;
                                            // _profileController.selectedCity.value = null;
                                          } else {
                                            print('Please select a CV file');
                                          }
                                        }
                                      },
                                      text: Text('Apply'),
                                      height: 40,
                                      width: 200,
                                    ),
                                    const SizedBox(height: 44),
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
        automaticallyImplyLeading: true,
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
            logoColor,
            logoColor,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 12,
            ),
            logoImg(),
            // const Text(
            //   'Welcome to Hire Job India',
            //   style: TextStyle(
            //       color: Colors.white, fontSize: 16, fontFamily: 'medium'),
            // ),
            Text(
              'Apply Your Leave',
              style: TextStyle(
                  color: Colors.white,
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
