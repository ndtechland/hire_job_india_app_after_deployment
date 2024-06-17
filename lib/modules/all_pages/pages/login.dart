import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/forgot_password.dart';
import 'package:hirejobindia/modules/all_pages/pages/registration_test.dart';
import 'package:hirejobindia/widget/elevated_button.dart';
import 'package:hirejobindia/widget/text_btn.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/employeee_controllersss/employee_login_controllers/employee_login_controllers.dart';
import '../../../controllers/login_controllers/login_controllersss.dart';
import '../../../controllers/registrationss/registration_controller.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = Get.put(LoginController());

  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  final EmployeeLoginController _employeeloginController =
      Get.put(EmployeeLoginController());

  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _userFocusNode2 = FocusNode();

  // FocusNode for User login
  final FocusNode _employeeFocusNode = FocusNode();
  final FocusNode _employeeFocusNode2 = FocusNode();

  // FocusNode for Employee login
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Obx(
                () => (_loginController.isLoading.value ||
                        _employeeloginController.isLoading.value)
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Center(
                          child: DefaultTabController(
                            length: 2,
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 20.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white, // Change color here
                                    ),
                                    child: TabBar(
                                      labelColor:
                                          Colors.white, // Selected text color
                                      unselectedLabelColor: Colors.grey,
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: appColor, // Change color here
                                      ),
                                      labelStyle: TextStyle(
                                          color: Colors
                                              .white), // Change selected text color to white
                                      unselectedLabelStyle: TextStyle(
                                          color: Colors
                                              .grey), // Unselected text color
                                      tabs: [
                                        Tab(text: "User"),
                                        Tab(text: "Employee"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 400, // Adjust as necessary
                                    child: TabBarView(
                                      children: [
                                        buildUserLoginForm(),
                                        buildEmployeeLoginForm(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                    MediaQuery.of(context).size.width >
                            MediaQuery.of(context).size.height
                        ? MediaQuery.of(context).size.height *
                            0.35 // Landscape mode
                        : MediaQuery.of(context).size.height *
                            0.2), // Portrait mode
                child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: logoColor,
                  flexibleSpace: responsiveContainer(
                    heightLandscape: size.height * 0.49,
                    heightPortrait: size.height * 0.29,
                    color: logoColor,
                    context: context,
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          logoImg(),
                          responsiveText(
                              text: 'Login With US!',
                              fontSizeLandscape: 19,
                              fontSizePortrait: 20,
                              color: Colors.white,
                              context: context),
                        ],
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

  Widget buildUserLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Obx(
        () => _loginController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _loginController.loginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    textField2(
                      hint: 'Username',
                      suffixIcon: Icons.person_outline,
                      controller: _loginController.usernameController1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      focusNode: _userFocusNode, // Assign FocusNode
                    ),
                    PasswordTextField(
                      hint: 'Password',
                      //suffixIcon: Icons.lock,
                      controller: _loginController.passwordController1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      focusNode: _userFocusNode2, // Assign FocusNode
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyTextButton(
                          onPressed: () {
                            Get.to(ForgotPassword());
                          },
                          text: 'Forgot Password',
                          colors: appColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    MyElevatedButton(
                      onPressed: () {
                        if (_loginController.loginFormKey.currentState
                                ?.validate() ??
                            false) {
                          _loginController.checkLogin();
                        }
                      },
                      text: Text('Login'),
                      height: 40,
                      width: 200,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 24),
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              blackText("Don't have an account?"),
                              MyTextButton(
                                onPressed: () async {
                                  _registrationController.getStatepi();
                                  _registrationController.onInit();
                                  _registrationController.selectedState.value =
                                      null;
                                  await Future.delayed(
                                      Duration(milliseconds: 800));
                                  Get.to(RegistrationPage());
                                },
                                colors: appColor,
                                text: "Sign up",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildEmployeeLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Obx(
        () => _employeeloginController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _employeeloginController.loginFormKey2,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    textField2(
                      hint: 'Employee ID',
                      suffixIcon: Icons.person_outline,
                      controller: _employeeloginController.usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Employee ID';
                        }
                        return null;
                      },
                      focusNode: _employeeFocusNode, // Assign FocusNode
                    ),
                    PasswordTextField(
                      hint: 'Password',
                      //suffixIcon: Icons.lock,
                      controller: _employeeloginController.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      focusNode: _employeeFocusNode2, // Assign FocusNode
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyTextButton(
                          onPressed: () {
                            Get.to(ForgotPassword());
                          },
                          text: 'Forgot Password',
                          colors: appColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    MyElevatedButton(
                      onPressed: () {
                        if (_employeeloginController.loginFormKey2.currentState
                                ?.validate() ??
                            false) {
                          _employeeloginController.checkemployeeLogin();
                        }
                      },
                      text: Text('E-Login'),
                      height: 40,
                      width: 200,
                    ),
                    const SizedBox(height: 34),
                  ],
                ),
              ),
      ),
    );
  }

  logoImg() {
    return Image.asset(
      'lib/assets/logo/hirelogo11.png',
      width: 120,
      height: 90,
    );
  }
}
