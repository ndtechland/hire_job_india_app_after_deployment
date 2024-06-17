import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/styles.dart';
import '../../../constants/app_colorss/app_colorss.dart';
import 'categories.dart';
import 'company.dart';

//import '../../constants/reusable_appbar/reusable_appbar.dart';

class OtherJobDetails extends StatelessWidget {
  OtherJobDetails({Key? key}) : super(key: key);

  // NavBarController _navcontroller =
  // Get.put(NavBarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          //  _navcontroller.tabIndex(0);
          //Get.to(BottomNavBar());
          // Perform custom back button handling here
          // For example, navigate to a different page
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
          // Return true to prevent default back button behavior or false to allow it.
          return false;
        },
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.th1whtbackgrd,

            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text('Choose one'),
              centerTitle: true,
              titleSpacing: 0,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[appColor2, appColor]),
                ),
              ),
              elevation: 0,
            ),
            // myAppBar(
            //   //backgroundColor: AppColors.white,
            //   title: 'Reports',
            //   leadingIcon: Icons.arrow_back_ios_outlined,
            //
            //   centerTitle: true,
            //   titleFontSize: size.width * 0.042, // Specify font size here
            //   onLeadingPressed: () {
            //     _navcontroller.tabIndex(0);
            //
            //     //Get.back();
            //     // Get.to(BottomNavBar());
            //     // Handle leading icon press
            //   },
            //   searchIcon: null,
            //   onSearchPressed: () {
            //     // Handle search icon press
            //   },
            //   userIcon: null,
            //   onUserPressed: () {
            //     // Handle user icon press
            //   },
            // ),
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
                      tabs: [
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40, // Adjust the height for unselected tabs
                            child: Text(
                              'Category',
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
                              'Company',
                              style: GoogleFonts.nunitoSans(
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                      indicator: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Empty box decoration to remove the underline
                      labelColor:
                          AppColors.graphtopbar, // Color for selected tab
                      unselectedLabelColor:
                          Colors.black, // Color for unselected tabs
                      labelStyle: GoogleFonts.roboto(
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w300),
                      unselectedLabelStyle: GoogleFonts.roboto(
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Categories(),
                      // monthly_sales(
                      //   isShowingMainData: true,
                      // ),
                      Company(),

                      ///BarChartSample4(),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     'Reports......',
                      //     style: GoogleFonts.poppins(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: size.width * 0.033,
                      //       color: AppColors.a15,
                      //     ),
                      //   ),
                      // ),
                      ///
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     'Reports......',
                      //     style: GoogleFonts.poppins(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: size.width * 0.033,
                      //       color: AppColors.a15,
                      //     ),
                      //   ),
                      // ),
                      /// LineChartSample5(),

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
      ),
    );
  }
}
