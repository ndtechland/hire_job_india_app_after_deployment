import 'package:flutter/material.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/login.dart';

class Welcome extends StatefulWidget {
  static const String id = 'Welcome';

  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Sign in With Us'),
        titleSpacing: 0,
        // actions: [
        //   MyTextButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => const Login()));
        //       },
        //       text: 'Log in',
        //       colors: Colors.white)
        // ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[logoColor, logoColor]),
          ),
        ),
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'lib/assets/logo/hirelogo108.jpg',

            // 'lib/assets/logo/hirelogo.png',
            //'lib/assets/images/job.png',
            width: 190,
            height: 150,
          ),
          Image.asset(
            'lib/assets/images/s2.jpg',
            width: double.infinity,
            height: 300,
          ),
          _buildBottom()
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                // imageButton('lib/assets/images/google.png', 'Login with Google',
                //     Colors.red),
                imageButton(
                    //'lib/assets/images/linkedin.png',

                    'Login with US',
                    //linkedinColor
                    logoColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  imageButton(
      //image,
      name,
      color) {
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
                      fontFamily: 'bold', fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   margin: const EdgeInsets.symmetric(horizontal: 3),
            //   decoration: const BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.all(Radius.circular(8))),
            //   // child: Image.asset(
            //   //   image,
            //   //   width: 24,
            //   //   height: 24,
            //   // ),
            // ),
          ],
        ));
  }
}
