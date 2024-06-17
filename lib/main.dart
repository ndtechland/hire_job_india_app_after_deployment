import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/controllers/nav_bar_controller/nav_controller.dart';
import 'package:hirejobindia/modules/components/styles.dart';
import 'package:permission_handler/permission_handler.dart';

import 'controllers/company_controllers/company_controller.dart';
import 'controllers/company_detail_by_com_id/company_detail_by_id_controller.dart';
import 'controllers/employeee_controllersss/employee_dashboard_controller/employee_dashboardcontroller.dart';
import 'controllers/user_profile_controller/user_profile_controller.dart';
import 'controllers/view_job_controller/job_controllersss.dart';
import 'modules/splash_screen/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await FlutterDownloader.initialize(debug: true);
  await Permission.storage.request();

  FlutterDownloader.registerCallback(downloadCallback);

  runApp(const MyApp());
}

void downloadCallback(String id, int status, int progress) {
  final DownloadTaskStatus taskStatus = DownloadTaskStatus(status);
  // Handle your download callback here if needed
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "regular",
        primaryColor: appColor,
        backgroundColor: appColor,
        dividerColor: Colors.transparent,
      ),
      home: Scaffold(
        body:

            ///HomeEmployee(),
            SplashScreen(),
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<BottomNavigationBarController>(
            () => BottomNavigationBarController());
        Get.lazyPut<AllJibsController>(() => AllJibsController());
        Get.lazyPut<ProfileController>(() => ProfileController());
        Get.lazyPut<HomedashboardController>(() => HomedashboardController());
        Get.lazyPut<AllJibsController>(() => AllJibsController());
        Get.lazyPut<CompanyDetailController>(() => CompanyDetailController());
        Get.lazyPut<AllcompanyController>(() => AllcompanyController());
        // AllcompanyController _allcompanyController = Get.find();
        //   CompanyDetailController _companyDetailController = Get.find();

        //HomedashboardController
      }),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Get.to(() => PdfViewScreen(
//                 pdfUrl:
//                     'https://api.hirejobindia.com/ProfileUploadCV/f09dd832-7b4b-47a0-aec7-1ceff12f068620240530124324724.pdf'));
//           },
//           child: Text('View and Download PDF'),
//         ),
//       ),
//     );
//   }
// }
