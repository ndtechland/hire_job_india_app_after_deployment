// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hirejobindia/constants/themes/theme_colors.dart';
// import 'package:hirejobindia/controllers/drower_home_controller/drower_home_controller.dart';
// import 'package:hirejobindia/controllers/nav_bar_controller/nav_controller.dart';
// import 'package:hirejobindia/modules/drawer_home/drower_page_class.dart';
//
// class HomeScreen extends StatelessWidget {
//   BottomNavigationBarController _bottomNavigationBarController =
//       Get.put(BottomNavigationBarController());
//   NavController _navcontroller = Get.put(NavController(), permanent: true);
//
//   GlobalKey<ScaffoldState> _key = new GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColors.jobbluegray,
//       key: _key,
//       appBar: AppBar(
//         backgroundColor: AppColors.jobbluegray,
//         elevation: 0,
//         title: SizedBox(
//           height: size.height * 0.05,
//           width: size.width * 0.6,
//           child: TextField(
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: AppColors.greyColor,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none, // Remove the border color
//               ),
//               filled: true,
//               hintStyle: TextStyle(
//                 color: Colors.grey[800],
//                 // Modify the style of the hint text here
//                 fontSize: 13.0, // Example font size
//               ),
//               hintText: "Search jobs here",
//               fillColor: AppColors.white,
//               contentPadding: EdgeInsets.symmetric(
//                   vertical: 12.0, horizontal: 16.0), // Add content padding
//             ),
//             textAlign: TextAlign.left, // Align the input text to center
//             style: TextStyle(
//               // You can also modify the style of the entered text here
//               fontSize: 16.0, // Example font size
//             ),
//           ),
//         ),
//
//         //Text('Home'),
//         centerTitle: true,
//         leading: InkWell(
//             onTap: () {
//               /// Get.to(LoginEmailPage());
//               _key.currentState!.openDrawer();
//             },
//             child: Icon(
//               Icons.menu,
//               color: AppColors.greyColor,
//             )),
//         actions: [
//           Icon(
//             Icons.notifications,
//             color: AppColors.greyColor,
//           ),
//         ],
//       ),
//       drawer: MainAmbrbDrawer(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: size.height * 0.17,
//                 //width: size.width * 0.3,
//                 decoration: BoxDecoration(color: AppColors.whiteColor),
//                 child: ListView.builder(
//                     scrollDirection:
//                         Axis.horizontal, // Set scroll direction to horizontal
//                     itemCount: 5,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(7.0),
//                         child: Material(
//                           elevation: 1,
//                           child: Container(
//                             //height: size.height * 0.05,
//                             //width: size.width * 0.6,
//                             decoration: BoxDecoration(
//                               color: AppColors.jobgray,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: size.height * 0.09,
//                                   width: size.width * 0.2,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                         height: size.height * 0.09,
//                                         width: size.width * 0.2,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.jobbrown,
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: Icon(Icons.account_circle),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: size.width * 0.03,
//                                 ),
//                                 SizedBox(
//                                   height: size.height * 0.09,
//                                   width: size.width * 0.45,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Name',
//                                         style: TextStyle(
//                                           fontSize: size.width * 0.04,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Update 6 hrs ago',
//                                         style: TextStyle(
//                                           fontSize: size.width * 0.03,
//                                           // fontWeight: FontWeight.,
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                       Text(
//                                         'View profile',
//                                         style: TextStyle(
//                                           fontSize: size.width * 0.035,
//                                           color: Colors.blue,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               Container(
//                   height: size.height * 0.055,
//                   //width: size.width * 0.3,
//                   decoration: BoxDecoration(color: AppColors.jobbluegray),
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: size.width * 0.03),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Jobs based on your\napplies (120)',
//                           style: TextStyle(
//                             fontSize: size.width * 0.045,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'View all',
//                           style: TextStyle(
//                             fontSize: size.width * 0.035,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               Container(
//                 height: size.height * 0.23,
//                 // width: size.width * 0.4,
//                 decoration: BoxDecoration(color: AppColors.whiteColor),
//                 child: ListView.builder(
//                     scrollDirection:
//                         Axis.horizontal, // Set scroll direction to horizontal
//                     itemCount: 5,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(7.0),
//                         child: Material(
//                           elevation: 1,
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             //height: size.height * 0.1,
//                             width: size.width * 0.7,
//                             decoration: BoxDecoration(
//                               color: AppColors.jobgray,
//                               border: Border.all(color: AppColors.jobgray),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: size.height * 0.06,
//                                   width: size.width * 0.18,
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: size.width * 0.02),
//                                     child: Container(
//                                       height: size.height * 0.07,
//                                       width: size.width * 0.15,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.jobbrown,
//                                         //shape: BoxShape.circle,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Icon(Icons.business_outlined),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: size.width * 0.02),
//                                   child: SizedBox(
//                                     height: size.height * 0.13,
//                                     width: size.width * 0.45,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Flutter Developer',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.04,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           'Posted by Aperiron Management',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.03,
//                                             // fontWeight: FontWeight.,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         Text(
//                                           'Noida (sector-142 Noida)',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.03,
//                                             // fontWeight: FontWeight.,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: size.height * 0.02,
//                                         ),
//                                         Text(
//                                           '1d ago',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.03,
//                                             // fontWeight: FontWeight.,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               Container(
//                   height: size.height * 0.055,
//                   //width: size.width * 0.3,
//                   decoration: BoxDecoration(color: AppColors.jobbluegray),
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: size.width * 0.03),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Jobs based on your\nprofile (12)',
//                           style: TextStyle(
//                             fontSize: size.width * 0.045,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'View all',
//                           style: TextStyle(
//                             fontSize: size.width * 0.035,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               Container(
//                 height: size.height * 0.23,
//                 // width: size.width * 0.4,
//                 decoration: BoxDecoration(color: AppColors.whiteColor),
//                 child: ListView.builder(
//                     scrollDirection:
//                         Axis.horizontal, // Set scroll direction to horizontal
//                     itemCount: 5,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(7.0),
//                         child: Material(
//                           elevation: 1,
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             //height: size.height * 0.1,
//                             width: size.width * 0.7,
//                             decoration: BoxDecoration(
//                               color: AppColors.jobgray,
//                               border: Border.all(color: AppColors.jobgray),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: size.height * 0.06,
//                                   width: size.width * 0.18,
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: size.width * 0.02),
//                                     child: Container(
//                                       height: size.height * 0.06,
//                                       width: size.width * 0.15,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.jobbrown,
//                                         //shape: BoxShape.circle,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: Icon(Icons.business_outlined),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: size.width * 0.02),
//                                   child: SizedBox(
//                                     height: size.height * 0.12,
//                                     width: size.width * 0.45,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Software Developer',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.04,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           'Posted by oxford Management',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.03,
//                                             // fontWeight: FontWeight.,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         Text(
//                                           'Noida (sector-12 Noida)',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.03,
//                                             // fontWeight: FontWeight.,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: size.height * 0.02,
//                                         ),
//                                         Text(
//                                           '2d ago',
//                                           style: TextStyle(
//                                             fontSize: size.width * 0.03,
//                                             // fontWeight: FontWeight.,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BusinessScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Business'),
//       ),
//       body: Center(
//         child: Text('Business Screen'),
//       ),
//     );
//   }
// }
//
// class SchoolScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('School'),
//       ),
//       body: Center(
//         child: Text('School Screen'),
//       ),
//     );
//   }
// }
