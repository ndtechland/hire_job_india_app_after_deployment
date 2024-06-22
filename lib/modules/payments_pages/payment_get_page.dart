import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/payments_pages/payment_screen_ui.dart';
import 'package:hirejobindia/widget/elevated_button.dart';

import '../../../components/responsive_text.dart';
import '../../constants/static_text.dart';
import '../../controllers/employeee_controllersss/payment_get_controller/payment_get_controller.dart';

class GetPaymentPage extends StatefulWidget {
  GetPaymentPage({Key? key}) : super(key: key);

  @override
  State<GetPaymentPage> createState() => _GetPaymentPageState();
}

class _GetPaymentPageState extends State<GetPaymentPage> {
  final PaymentEmployeeController _paymentEmployeeController = Get.find();

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
                () => (_paymentEmployeeController.isLoading.value)
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            //height: size.height * 0.0,
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
                                  height: size.height * 0.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white, // Change color here
                                  ),
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      responsiveContainer(
                                        heightPortrait:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        widthPortrait:
                                            MediaQuery.of(context).size.width *
                                                0.99,
                                        heightLandscape:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        widthLandscape:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            responsiveText(
                                              context: context,
                                              text: "Your Due Amount:    ",
                                              fontSizePortrait: 12,
                                              fontSizeLandscape: 12,
                                              //color: Colors.white,
                                            ),
                                            responsiveText(
                                              context: context,
                                              text:
                                                  "${FixedText.symbol}${_paymentEmployeeController.getPaymentModel?.data?.toInt() ?? '00'}",
                                              fontSizePortrait: 15,
                                              fontSizeLandscape: 15,
                                              color: logoColor,
                                            ),
                                          ],
                                        ),
                                        context: context,
                                      ),
                                      SizedBox(
                                        height: 29,
                                      ),
                                      // Text(
                                      //     "Your ${_paymentEmployeeController.getPaymentModel?.data?.toInt()}"),
                                      MyElevatedButton(
                                        onPressed: () {
                                          Get.to(PaymentScreen());
                                        },
                                        text: Text('Pay  Now'),
                                        height: 40,
                                        width: 200,
                                      ),

                                      Spacer(),
                                    ],
                                  ),
                                  //buildUserLoginForm()),
                                )
                              ],
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
                  //automaticallyImplyLeading: false,
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
                              text: 'Do Your Payment',
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

  // Widget buildUserLoginForm() {
  //   return Padding(
  //     padding: const EdgeInsets.all(24.0),
  //     child: Obx(
  //       () => _changepassuserController.isLoading.value
  //           ? Center(child: CircularProgressIndicator())
  //           : Form(
  //               key: _changepassuserController.changepasswordFormKey,
  //               autovalidateMode: AutovalidateMode.onUserInteraction,
  //               child: Column(
  //                 children: [
  //                   PasswordTextField(
  //                     hint: 'Old Password',
  //                     //suffixIcon: Icons.lock,
  //                     controller: _changepassuserController.passwordController1,
  //                     validator: (value) {
  //                       if (value == null || value.isEmpty) {
  //                         return 'Please enter your Old password';
  //                       }
  //                       return null;
  //                     },
  //                     focusNode: _userFocusNode, // Assign FocusNode
  //                   ),
  //                   PasswordTextField(
  //                     hint: 'Password',
  //                     //suffixIcon: Icons.lock,
  //                     controller: _changepassuserController.passwordController2,
  //                     validator: (value) {
  //                       if (value == null || value.isEmpty) {
  //                         return 'Please enter your password';
  //                       }
  //                       return null;
  //                     },
  //                     focusNode: _userFocusNode2, // Assign FocusNode
  //                   ),
  //                   PasswordTextField(
  //                     hint: 'Confirm Password',
  //                     //suffixIcon: Icons.lock,
  //                     controller: _changepassuserController.passwordController3,
  //                     validator: (value) {
  //                       if (value == null || value.isEmpty) {
  //                         return 'Re enter your password';
  //                       }
  //                       if (value !=
  //                           _changepassuserController
  //                               .passwordController2.text) {
  //                         return 'Passwords do not match';
  //                       }
  //                       return null;
  //                     },
  //                     focusNode: _userFocusNode3, // Assign FocusNode
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       // MyTextButton(
  //                       //   onPressed: () {
  //                       //     Get.to(ForgotPassword());
  //                       //   },
  //                       //   text: 'Forgot Password',
  //                       //   colors: appColor,
  //                       // ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 34),
  //                   MyElevatedButton(
  //                     onPressed: () {
  //                       if (_changepassuserController
  //                               .changepasswordFormKey.currentState
  //                               ?.validate() ??
  //                           false) {
  //                         _changepassuserController
  //                             .checkPasswordchange(context);
  //                       }
  //                     },
  //                     text: Text('Update'),
  //                     height: 40,
  //                     width: 200,
  //                   ),
  //                   const SizedBox(height: 14),
  //                 ],
  //               ),
  //             ),
  //     ),
  //   );
  // }

  logoImg() {
    return Image.asset(
      'lib/assets/logo/hirelogo11.png',
      width: 120,
      height: 90,
    );
  }
}
