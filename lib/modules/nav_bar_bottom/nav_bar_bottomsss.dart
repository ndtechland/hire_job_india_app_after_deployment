// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hirejobindia/constants/themes/theme_colors.dart';
// import 'package:hirejobindia/modules/homepage/home_pages.dart';
//
// import '../../controllers/nav_bar_controller/nav_controller.dart';
// //import 'home_page.dart'; // Import your home page and other screens here
//
// class MyBottomNavigationBar extends StatelessWidget {
//   final List<Widget> _screens = [
//     HomeScreen(),
//     BusinessScreen(),
//     SchoolScreen(),
//   ];
//   BottomNavigationBarController _controller =
//       Get.put(BottomNavigationBarController());
//
//   // final BottomNavigationBarController _controller =
//   //     Get.find<BottomNavigationBarController>();
//
//   MyBottomNavigationBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Bottom Navigation Bar Example'),
//       // ),
//       body: Obx(() => _screens[_controller.selectedIndex.value]),
//       bottomNavigationBar: Obx(() => BottomNavigationBar(
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.business),
//                 label: 'Job',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.school),
//                 label: 'Applied',
//               ),
//             ],
//             currentIndex: _controller.selectedIndex.value,
//             selectedItemColor: AppColors.joberror,
//             onTap: _controller.updateIndex,
//           )),
//     );
//   }
// }
