import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/forgot_password.dart';
import 'package:hirejobindia/modules/all_pages/pages/registration_test.dart';
import 'package:hirejobindia/widget/elevated_button.dart';
import 'package:hirejobindia/widget/text_btn.dart';

import '../../../controllers/login_controllers/login_controllersss.dart';
import '../../../controllers/registrationss/registration_controller.dart';

class Login2 extends StatelessWidget {
  static const String id = 'Login';
  Login2({Key? key}) : super(key: key);

  LoginController _loginController = Get.put(LoginController());
  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Obx(
                () => _loginController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    //child:
                    : Form(
                        key: _loginController.loginFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: SingleChildScrollView(
                          child: Center(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 4),
                                    child: Column(
                                      children: [
                                        textField2(
                                          hint: 'Username',
                                          suffixIcon: Icons.person_outline,
                                          controller: _loginController
                                              .usernameController1,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter username';
                                            }
                                            return null;
                                          },
                                          // prefixIcon: Icons.person, // Optional
                                        ),
                                        textField2(
                                          hint: 'Password',
                                          suffixIcon: Icons.lock,
                                          controller: _loginController
                                              .passwordController1,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter Your Password';
                                            }
                                            return null;
                                          },
                                          //prefixIcon: Icons.lock, // Optional
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            MyTextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ForgotPassword(),
                                                  ),
                                                );
                                              },
                                              text: 'Forgot Password',
                                              colors: appColor,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                      ],
                                    ),
                                  ),
                                  MyElevatedButton(
                                    onPressed: () {
                                      if (_loginController
                                              .loginFormKey.currentState
                                              ?.validate() ??
                                          false) {
                                        _loginController.checkLogin();

                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => Home(),
                                        //   ),
                                        // );
                                      }
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => Home(),
                                      //   ),
                                      // );
                                    },
                                    text: const Icon(Icons.arrow_forward),
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(height: 34),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 24),
                                    height: 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            blackText("Don't have an account?"),
                                            MyTextButton(
                                              onPressed: () async {
                                                _registrationController
                                                    .getStatepi();
                                                _registrationController
                                                    .onInit();
                                                _registrationController
                                                    .selectedState.value = null;
                                                await Future.delayed(Duration(
                                                    milliseconds: 800));
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegistrationPage()
                                                      //const
                                                      //Register(),
                                                      ),
                                                );
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
                        ),
                      ),
              ),
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(200),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          appColor,
                          appColor2,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        logoImg(),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontFamily: 'medium',
                          ),
                        ),
                      ],
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

  imageButton(image, name, color) {
    return Container(
        width: double.infinity,
        height: 46,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontFamily: 'medium', fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image.asset(
                image,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ));
  }

  logoImg() {
    return Image.asset(
      'lib/assets/logo/hirelogo11.png',
      // 'lib/assets/images/job.png',
      //color: Colors.white,
      width: 120,
      height: 100,
    );
  }
}
