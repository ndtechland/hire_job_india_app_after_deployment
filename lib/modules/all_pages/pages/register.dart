import 'package:flutter/material.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/home.dart';
import 'package:hirejobindia/modules/all_pages/pages/login.dart';
import 'package:hirejobindia/widget/elevated_button.dart';
import 'package:hirejobindia/widget/text_btn.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';

  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: _buildHeader(),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SingleChildScrollView(child: _buildLoginDetail()),
    );
  }

  Widget _buildHeader() {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appColor,
            appColor2,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logoImg(),
            const Text(
              'Welcome to Hire Job India',
              style: TextStyle(
                  color: Colors.white, fontSize: 26, fontFamily: 'medium'),
            ),
          ],
        ));
  }

  Widget _buildLoginDetail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
            )
          ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                textField('Username', Icons.person_outline),
                textField('Email Address', Icons.mail_outline),
                textField('Password', Icons.remove_red_eye),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextButton(
                        onPressed: () {},
                        text: 'Already have an account?',
                        colors: appColor),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          MyElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              text: const Icon(Icons.arrow_forward),
              height: 40,
              width: 40),
          Container(
            padding: const EdgeInsets.all(24),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Column(
                //   children: [
                //     imageButton('lib/assets/images/google.png',
                //         'Login with Google', Colors.red),
                //     imageButton('lib/assets/images/linkedin.png',
                //         'Login with Linkedin', linkedinColor),
                //   ],
                // ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blackText('Dont have an account?'),
                    MyTextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
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
    );
  }

  imageButton(image, name, color) {
    return Container(
        width: double.infinity,
        height: 46,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 8),
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
