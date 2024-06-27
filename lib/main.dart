import 'dart:io';

import 'package:flutter/material.dart';

///import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/controllers/nav_bar_controller/nav_controller.dart';
import 'package:hirejobindia/modules/components/styles.dart';
import 'package:permission_handler/permission_handler.dart';

import 'controllers/company_controllers/company_controller.dart';
import 'controllers/company_detail_by_com_id/company_detail_by_id_controller.dart';
import 'controllers/employeee_controllersss/employee_dashboard_controller/employee_dashboardcontroller.dart';
import 'controllers/employeee_controllersss/payment_get_controller/payment_get_controller.dart';
import 'controllers/user_profile_controller/user_profile_controller.dart';
import 'controllers/view_job_controller/job_controllersss.dart';
import 'modules/splash_screen/splash_screen.dart';

void setupLazyLoading() {
  Get.lazyPut(() => BottomNavigationBarController());
  Get.lazyPut(() => AllJibsController());
  Get.lazyPut(() => ProfileController());
  Get.lazyPut(() => HomedashboardController());
  Get.lazyPut(() => CompanyDetailController());
  Get.lazyPut(() => AllcompanyController());
  Get.lazyPut(() => ProfileController());
  Get.lazyPut(() => PaymentEmployeeController());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLazyLoading();

  HttpOverrides.global = MyHttpOverrides();

  /// await FlutterDownloader.initialize(debug: true);
  /// await requestFilePermission();

  await Permission.storage.request();

  ///await requestPermissions();

  ///FlutterDownloader.registerCallback(downloadCallback);

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// void downloadCallback(String id, int status, int progress) {
//   final DownloadTaskStatus taskStatus = DownloadTaskStatus(status);
//   // Handle your download callback here if needed
// }

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
      home: SplashScreen(),
      // Scaffold(
      //   body:
      //
      //       ///HomeEmployee(),
      //       SplashScreen(),
      // ),
      // initialBinding: BindingsBuilder(() {
      //   Get.lazyPut<BottomNavigationBarController>(
      //       () => BottomNavigationBarController());
      //   Get.lazyPut<AllJibsController>(() => AllJibsController());
      //   Get.lazyPut<ProfileController>(() => ProfileController());
      //   Get.lazyPut<HomedashboardController>(() => HomedashboardController());
      //   Get.lazyPut<AllJibsController>(() => AllJibsController());
      //   Get.lazyPut<CompanyDetailController>(() => CompanyDetailController());
      //   Get.lazyPut<AllcompanyController>(() => AllcompanyController());
      //   Get.lazyPut<ProfileController>(() => ProfileController());
      //
      //   //Profile2Controller
      //   // AllcompanyController _allcompanyController = Get.find();
      //   //   CompanyDetailController _companyDetailController = Get.find();
      //
      //   //HomedashboardController
      // }),
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
///
// Future<void> requestFilePermission() async {
//   final status = await Permission.storage.request();
//
//   if (status.isGranted) {
//     // Permission granted, proceed with file operations
//     print('Storage permission granted');
//   } else if (status.isDenied) {
//     // Permission denied, but not permanently. You can ask for permission again.
//     print('Storage permission denied');
//   } else if (status.isPermanentlyDenied) {
//     // Permission permanently denied. Show a dialog guiding the user to settings.
//     print('Storage permission permanently denied');
//     // The following part requires context, so it should be called when context is available, e.g., in a widget
//     // showDialog(
//     //   context: context,
//     //   builder: (context) => AlertDialog(
//     //     title: Text('Permission Required'),
//     //     content: Text(
//     //         'This app needs storage access to perform this operation. Please enable it in the app settings.'),
//     //     actions: [
//     //       TextButton(
//     //         onPressed: () {
//     //           Navigator.of(context).pop();
//     //         },
//     //         child: Text('Cancel'),
//     //       ),
//     //       TextButton(
//     //         onPressed: () {
//     //           openAppSettings();
//     //           Navigator.of(context).pop();
//     //         },
//     //         child: Text('Open Settings'),
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }
// }

///
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await requestPermissions();
//   runApp(MyApp());
// }
//
Future<void> requestPermissions() async {
  if (await Permission.storage.request().isGranted) {
    print('Storage permission granted.');
  } else if (await Permission.manageExternalStorage.request().isGranted) {
    print('Manage external storage permission granted.');
  } else {
    print('Permissions denied.');
  }
}
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('File Picker Example')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await pickFile(context);
//           },
//           child: Text('Pick File'),
//         ),
//       ),
//     );
//   }
// }
//
// Future<void> pickFile(BuildContext context) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//   if (result != null) {
//     PlatformFile file = result.files.first;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Picked file: ${file.name}')),
//     );
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('No file selected')),
//     );
//   }
// }
