import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirejobindia/modules/all_pages/pages/emploree_pages/profile_employee/personal_info_employee.dart';

import '../../../../../components/styles.dart';
import '../../../../../constants/app_colorss/app_colorss.dart';
import 'bank_profile_info.dart';
import 'basic_info_profile.dart';

//import '../../constants/reusable_appbar/reusable_appbar.dart';

class EmployeeProfile extends StatelessWidget {
  EmployeeProfile({Key? key}) : super(key: key);

  // NavBarController _navcontroller =
  // Get.put(NavBarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        // _navcontroller.tabIndex(0);
        //Get.to(BottomNavBar());
        // Perform custom back button handling here
        // For example, navigate to a different page
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
        // Return true to prevent default back button behavior or false to allow it.
        return false;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.th1whtbackgrd,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('Profile Details'),
            centerTitle: true,
            titleSpacing: 0,
            // actions: [
            //   IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
            // ],
            flexibleSpace: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[logoColor, logoColor]),
              ),
            ),
            elevation: 0,
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: size.height * 0.05,
                  color: AppColors.th1wht2,
                  child: TabBar(
                    labelColor: Colors.white, // Selected text color
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: appColor, // Change color here
                    ),
                    labelStyle: TextStyle(
                        color: Colors
                            .white), // Change selected text color to white
                    unselectedLabelStyle: TextStyle(color: Colors.grey),
                    tabs: [
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40, // Adjust the height for unselected tabs
                          child: Text(
                            'Personal',
                            style: GoogleFonts.nunitoSans(
                              fontSize: size.height * 0.019,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40, // Adjust the height for unselected tabs
                          child: Text(
                            'Basic',
                            style: GoogleFonts.nunitoSans(
                              fontSize: size.height * 0.019,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          // color: Colors.white,
                          height: 30, // Adjust the height for selected tab
                          child: Text(
                            'Bank A/C',
                            style: GoogleFonts.nunitoSans(
                              fontSize: size.height * 0.019,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                    // indicator: BoxDecoration(
                    //   color: AppColors.white,
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // // Empty box decoration to remove the underline
                    // labelColor: AppColors.graphtopbar, // Color for selected tab
                    // unselectedLabelColor:
                    //     Colors.black, // Color for unselected tabs
                    // labelStyle: GoogleFonts.roboto(
                    //     fontSize: size.height * 0.017,
                    //     fontWeight: FontWeight.w300),
                    // unselectedLabelStyle: GoogleFonts.roboto(
                    //     fontSize: size.height * 0.017,
                    //     fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PersonalProfile(),
                    // monthly_sales(
                    //   isShowingMainData: true,
                    // ),
                    BasicEmployeeProfile(),

                    BankDetailEmployeeProfile(),

                    ///todo:....................
                    // Your tab views here
                    // Example:
                    // PlacesTab(),
                    // InspirationTab(),
                    // EmotionsTab(),
                  ],
                ),
              ),
            ],
          ),

          // },
          //),
        ),
      ),
    );
  }
}
