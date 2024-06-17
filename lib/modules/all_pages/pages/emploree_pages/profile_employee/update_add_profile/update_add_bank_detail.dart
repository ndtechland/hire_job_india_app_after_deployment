import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../controllers/employee_controller/profile_controller/profile_info_employee_controller.dart';
import '../../../../../../controllers/employeee_controllersss/employee_edit_profile_controller/update_bank_employee.dart';
import '../../../../../../widget/elevated_button.dart';

class BankDetailUpdateEmployeeProfile extends StatefulWidget {
  @override
  _BankDetailUpdateEmployeeProfileState createState() =>
      _BankDetailUpdateEmployeeProfileState();
}

class _BankDetailUpdateEmployeeProfileState
    extends State<BankDetailUpdateEmployeeProfile> {
  final ProfileEmployeeController _getprofileebnk =
      Get.put(ProfileEmployeeController());
  final BankEmployeeUodateController _bankEmployeeUodateController =
      Get.put(BankEmployeeUodateController());

  final TextEditingController _acholdernameController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();

  final TextEditingController _deductioncycleController =
      TextEditingController();
  final TextEditingController _employeecontrobutionController =
      TextEditingController();

  final TextEditingController _accnumberController = TextEditingController();
  final TextEditingController _reenteracnoNumberController =
      TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _acounttypeController = TextEditingController();
  final TextEditingController _epfnumnberController = TextEditingController();
  final TextEditingController _nominiNameController = TextEditingController();
  final TextEditingController _cvFilePathController = TextEditingController();

  Uint8List? _cvFileContent;

  @override
  void dispose() {
    _acholdernameController.dispose();
    _bankController.dispose();
    _accnumberController.dispose();
    _reenteracnoNumberController.dispose();
    _ifscController.dispose();
    _acounttypeController.dispose();
    _epfnumnberController.dispose();
    _nominiNameController.dispose();
    _cvFilePathController.dispose();
    super.dispose();
  }

  Future<void> _checkAndRequestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      _selectCVFile();
    } else {
      await Permission.storage.request();
      if (await Permission.storage.isGranted) {
        _selectCVFile();
      } else {
        print('Storage permission is required to access files.');
      }
    }
  }

  Future<void> _selectCVFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        print('Selected file: ${file.name}, path: ${file.path}');

        if (file.size! <= 10 * 1024 * 1024) {
          if (file.bytes != null) {
            setState(() {
              _cvFilePathController.text = file.name;
              _cvFileContent = file.bytes!;
            });
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: Obx(
        () => (_getprofileebnk.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _bankEmployeeUodateController.bankemployeeFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            blackHeadingSmall('Bank Information'.toUpperCase()),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 0),
                        child: Column(
                          children: [
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: TextFormField(
                                      controller: _acholdernameController,
                                      decoration: InputDecoration(
                                        labelText: "A/C Holder Name",
                                        hintStyle: TextStyle(fontSize: 13),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: TextFormField(
                                      controller: _bankController,
                                      decoration: InputDecoration(
                                        labelText: "Bank Name",
                                        hintStyle: TextStyle(fontSize: 13),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: TextFormField(
                                      controller: _accnumberController,
                                      decoration: InputDecoration(
                                        labelText: "Account Number",
                                        hintStyle: TextStyle(fontSize: 13),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: TextFormField(
                                      controller: _reenteracnoNumberController,
                                      decoration: InputDecoration(
                                        labelText: "Re-Enter A/C No.",
                                        hintStyle: TextStyle(fontSize: 13),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: TextFormField(
                                      controller: _ifscController,
                                      decoration: InputDecoration(
                                        labelText: "IFSC Code",
                                        hintStyle: TextStyle(fontSize: 13),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Account Type",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade500,
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: InkWell(
                                      onTap: () => _bankEmployeeUodateController
                                          .selectedGender.value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Obx(
                                              () => RadioListTile(
                                                title: Text(
                                                  'Current',
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
                                                    "1",
                                                groupValue:
                                                    _bankEmployeeUodateController
                                                        .selectedGender.value,
                                                onChanged: (value) {
                                                  _bankEmployeeUodateController
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
                                                  'Saving',
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
                                                    "2",
                                                groupValue:
                                                    _bankEmployeeUodateController
                                                        .selectedGender.value,
                                                onChanged: (value) {
                                                  _bankEmployeeUodateController
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
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 1),
                                    child: TextFormField(
                                      controller: _epfnumnberController,
                                      decoration: InputDecoration(
                                        labelText: "EPF Number",
                                        hintStyle: TextStyle(fontSize: 13),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: TextFormField(
                                      controller: _nominiNameController,
                                      decoration: InputDecoration(
                                        labelText: "Nominee",
                                        hintStyle: TextStyle(fontSize: 13),
                                        labelStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: appColor),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please select your Check';
                                              }
                                              return null;
                                            },
                                            controller: _cvFilePathController,
                                            decoration: InputDecoration(
                                                labelText: 'Check File'),
                                            enabled: false,
                                          ),
                                        ),
                                        SizedBox(width: 10),
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
                                                _checkAndRequestPermissions(),
                                            style: ElevatedButton.styleFrom(
                                              primary: appColor,
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text(
                                              'Upload\n Check',
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
                                  const SizedBox(height: 24),
                                  MyElevatedButton(
                                    onPressed: () {
                                      if (_bankEmployeeUodateController
                                              .bankemployeeFormKey.currentState
                                              ?.validate() ??
                                          false) {
                                        if (_cvFileContent != null) {
                                          _bankEmployeeUodateController
                                              .updateBankProfile(
                                            accountHolderName:
                                                _acholdernameController.text,
                                            bankname:
                                                _acholdernameController.text,
                                            accountNumber:
                                                _accnumberController.text,
                                            reEnterAccountNumber:
                                                _reenteracnoNumberController
                                                    .text,
                                            ifsc: _ifscController.text,
                                            epfNumber:
                                                _epfnumnberController.text,
                                            deductionCycle:
                                                _deductioncycleController.text,
                                            employeeContributionRate:
                                                _employeecontrobutionController
                                                    .text,
                                            //_deduc
                                            nominee: _nominiNameController.text,
                                            accountTypeId:
                                                _bankEmployeeUodateController
                                                    .selectedGender.value,
                                            cvFileContent: _cvFileContent!,
                                            Chequebase64:
                                                _cvFilePathController.text,
                                          );
                                        } else {
                                          print('Please select a check file');
                                        }
                                      }
                                    },
                                    text: Text('Update'),
                                    height: 40,
                                    width: 200,
                                  ),
                                  const SizedBox(height: 34),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
