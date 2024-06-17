import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirejobindia/widget/elevated_button.dart';

import '../../../components/styles.dart';
import '../../../constants/static_text.dart';
import '../../../controllers/home_page_controllerss/home_page_controllerss.dart';
import '../../../controllers/job_list_by_cat_id_controller/job_detail_by_job_id_controller.dart';
import '../../../controllers/view_job_controller/aaplied_job_controller.dart';
import 'home.dart';
import 'job_details.dart';

class AppliedJobs extends StatelessWidget {
  static const String id = 'AppliedJobs';
  final RxBool isLoading = false.obs;

  AppliedJobs({Key? key}) : super(key: key);

// Define isLoading as a RxBool

  AllAppliedJobController _allappliedController = Get.find();
  HomePageController _homePageController = Get.find();
  JobdetauilsbyJobIdController _jobdetauilsbyJobIdController =
      Get.put(JobdetauilsbyJobIdController());

  ///todo: i can remove anchor tag in flutter...24 may 2024..

  String stripHtmlTags(String htmlString) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('View Applied Jobs'),
        centerTitle: true,
        titleSpacing: 0,
        leading: InkWell(
            onTap: () {
              Get.to(Home());
            },
            child: Icon(Icons.arrow_back)),
        //automaticallyImplyLeading: false,
        actions: [
          //IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          //IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[appColor2, appColor],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(builder: (context, constraints) {
            // Getting the size of the screen
            var screenWidth = constraints.maxWidth;
            var screenHeight = constraints.maxHeight;

            // Calculating sizes based on orientation
            var imageWidth = orientation == Orientation.portrait
                ? screenWidth * 0.55
                : screenWidth * 0.3;
            var imageHeight = orientation == Orientation.portrait
                ? screenHeight * 0.2
                : screenHeight * 0.4;

            var textfieldWidth = orientation == Orientation.portrait
                ? screenWidth * 0.83
                : screenWidth * 0.45;
            var textfieldHeight = orientation == Orientation.portrait
                ? screenHeight * 0.2
                : screenHeight * 0.3;

            var textfieldWidth2 = orientation == Orientation.portrait
                ? screenWidth * 0.84
                : screenWidth * 0.87;
            var textfieldHeight2 = orientation == Orientation.portrait
                ? screenHeight * 0.15
                : screenHeight * 0.4;
            return Obx(
              () => (_allappliedController.isLoading.value || isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                      child: Column(
                        children: [
                          Container(
                            height: imageHeight * 0.5,

                            color: appColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical:
                                    3), // Adjust vertical padding to decrease height
                            child: SizedBox(
                              width: screenWidth * 0.97,
                              height: screenHeight * 0.14,
                              child: TextField(
                                cursorColor: appColor,
                                onChanged: (value) => _allappliedController
                                    .filterAppliedJob(value),
                                autofocus: false,
                                style:
                                    TextStyle(fontSize: 15.0, color: appColor),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: appColor,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter job Title.',
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, bottom: 12.0, top: 13.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: appColor),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _allappliedController.foundappliedJobs.value.isEmpty
                              ? Center(
                                  child: Text("No Job Found"),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _allappliedController
                                          .foundappliedJobs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final packageText =
                                            (_allappliedController
                                                            .foundappliedJobs[
                                                                index]
                                                            .package ==
                                                        null ||
                                                    _allappliedController
                                                        .foundappliedJobs![
                                                            index]
                                                        .package!
                                                        .isEmpty)
                                                ? "Not disclose"
                                                : _allappliedController
                                                    .foundappliedJobs![index]
                                                    .package!;
                                        return Container(
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 20.0,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.0)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      isLoading.value = true;
                                                      // SharedPreferences prefs =
                                                      //     await SharedPreferences
                                                      //         .getInstance();
                                                      // prefs.setString(
                                                      //     "JobListId",
                                                      //     _allappliedController
                                                      //         .foundappliedJobs[
                                                      //             index]
                                                      //         .id
                                                      //         .toString());
                                                      // print(
                                                      //     "sadsad${_allappliedController.foundappliedJobs[index].id.toString()}");
                                                      await Future.delayed(
                                                          Duration(seconds: 0));
                                                      isLoading.value = false;

                                                      await _jobdetauilsbyJobIdController
                                                          .jobdetailbyjobIdApi(
                                                        jobListId:
                                                            _allappliedController
                                                                .foundappliedJobs![
                                                                    index]
                                                                .id
                                                                .toString(),
                                                      );

                                                      await _jobdetauilsbyJobIdController
                                                          .relatedjobListApi(
                                                        jobTitleid:
                                                            _allappliedController
                                                                .foundappliedJobs[
                                                                    index]
                                                                .jobTitleid,
                                                      );

                                                      await Get.to(
                                                          JobDetails());
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      height: textfieldHeight *
                                                          0.26,
                                                      width:
                                                          textfieldWidth * 0.19,
                                                      child: ClipOval(
                                                        clipBehavior: Clip.none,
                                                        child: Image.network(
                                                          FixedText.imgurl +
                                                              _allappliedController
                                                                  .foundappliedJobs[
                                                                      index]
                                                                  .companyImage
                                                                  .toString(),
                                                          fit: BoxFit.fill,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                'lib/assets/logo/noimageavlble.jpg',
                                                                width: 30,
                                                                height: 30,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        blackHeadingSmall(
                                                            _allappliedController
                                                                .foundappliedJobs[
                                                                    index]
                                                                .jobTitle),
                                                        TextSmallbold(
                                                            _allappliedController
                                                                .foundappliedJobs[
                                                                    index]
                                                                .companyName),
                                                        TextSmalllocation(
                                                            _allappliedController
                                                                .foundappliedJobs[
                                                                    index]
                                                                .location),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.2,
                                                    //height: screenHeight * 0.09,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            _homePageController
                                                                .savejobssApi(
                                                              _allappliedController
                                                                  .foundappliedJobs[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                            );
                                                            print('job saved');
                                                          },
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        screenWidth *
                                                                            0.05),
                                                            child: Icon(
                                                              Icons.save,
                                                              color:
                                                                  Colors.indigo,
                                                            ),
                                                          ),
                                                        ),
                                                        boldText(_allappliedController
                                                            .foundappliedJobs[
                                                                index]
                                                            .requiredExperience),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                child: greyTextSmall4(
                                                  stripHtmlTags(
                                                      _allappliedController
                                                              .foundappliedJobs[
                                                                  index]
                                                              .skills ??
                                                          "No skills listed"),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  boldText("₹  ${packageText}"),
                                                  boldText(
                                                      "${_allappliedController.foundappliedJobs[index].noofdays.toString()}"),
                                                  MyElevatedButton(
                                                    onPressed: () async {
                                                      // isLoading.value = true;
                                                      // SharedPreferences prefs =
                                                      //     await SharedPreferences
                                                      //         .getInstance();
                                                      // prefs.setString(
                                                      //     "JobListId",
                                                      //     _allappliedController
                                                      //         .foundappliedJobs[
                                                      //             index]
                                                      //         .id
                                                      //         .toString());
                                                      // print(
                                                      //     "sadsad${_allappliedController.foundappliedJobs[index].id.toString()}");
                                                      // await Future.delayed(
                                                      //     Duration(seconds: 0));
                                                      // isLoading.value = false;
                                                      // _homePageController
                                                      //     .applyjobssApi(
                                                      //   _allappliedController
                                                      //       .foundappliedJobs[
                                                      //           index]
                                                      //       .id
                                                      //       .toString(),
                                                      // );
                                                    },
                                                    text: btnText('Applied'),
                                                    height: 28,
                                                    width: 80,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      })
                                  //_buildBody()
                                  ),
                        ],
                      ),
                    ),
            );
          });
        },
      ),
    );
  }

// Widget _buildBody() {
//   return ListView.builder(
//     padding: EdgeInsets.zero,
//     itemCount: _doctorListController.f,
//     itemBuilder: (context, i) => _buildJobs(),
//   );
// }
//
// Widget _buildJobs() {
//   return
//     GestureDetector(
//     onTap: () {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => const JobDetails()),
//       // );
//     },
//     child: Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 20.0,
//           ),
//         ],
//         borderRadius: BorderRadius.all(Radius.circular(6.0)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: Image.asset(
//                   'lib/assets/images/n3.png',
//                   width: 30,
//                   height: 30,
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     blackHeadingSmall('Python Developer'),
//                     greyTextSmall('Job IT PVT LTD, Noida India'),
//                   ],
//                 ),
//               ),
//               const Icon(Icons.bookmark, color: appColor, size: 16),
//             ],
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: greyTextSmall(
//               'It is an established Company and This company based on Banking Sector Projects.',
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               boldText('₹ 3,10,000- ₹ 5,20,000 per year'),
//               MyElevatedButton(
//                 onPressed: () {
//                   ApiProvider.AllJobsApi();
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => Welcome()),
//                   // );
//                 },
//                 text: btnText('Apply'),
//                 height: 28,
//                 width: 80,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
