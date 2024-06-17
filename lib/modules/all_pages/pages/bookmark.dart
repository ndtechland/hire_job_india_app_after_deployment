import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/widget/elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/static_text.dart';
import '../../../controllers/home_page_controllerss/home_page_controllerss.dart';
import '../../../controllers/job_list_by_cat_id_controller/job_detail_by_job_id_controller.dart';
import '../../../controllers/view_job_controller/saved_job_controller.dart';
import 'home.dart';
import 'job_details.dart';

class Bookmark extends StatelessWidget {
  // Define isLoading as a RxBool
  final RxBool isLoading = false.obs;

  Bookmark({Key? key}) : super(key: key);

  AllSavedJobController _allsavedJobsController =
      Get.put(AllSavedJobController());
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
        title: const Text('Saved Jobs'),
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
              () => (_allsavedJobsController.isLoading.value || isLoading.value)
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
                                onChanged: (value) => _allsavedJobsController
                                    .filterSavedJob(value),
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
                          _allsavedJobsController.foundSavedJobs.value.isEmpty
                              ? Center(
                                  child: Text("No Job Found"),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _allsavedJobsController
                                          .foundSavedJobs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final packageText =
                                            (_allsavedJobsController
                                                            .foundSavedJobs[
                                                                index]
                                                            .package ==
                                                        null ||
                                                    _allsavedJobsController
                                                        .foundSavedJobs![index]
                                                        .package!
                                                        .isEmpty)
                                                ? "Not disclose"
                                                : _allsavedJobsController
                                                    .foundSavedJobs![index]
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

                                                      try {
                                                        // SharedPreferences
                                                        //     prefs =
                                                        //     await SharedPreferences
                                                        //         .getInstance();

                                                        // Save JobListId
                                                        // String jobListId =
                                                        //     _allJibsController
                                                        //         .foundJobs[
                                                        //             index]
                                                        //         .id
                                                        //         .toString();
                                                        // await prefs.setString(
                                                        //     "JobListId",
                                                        //     jobListId);
                                                        // print(
                                                        //     "JobListId: $jobListId");

                                                        // Save JobTitleid1
                                                        // String jobTitleid =
                                                        //     _allJibsController
                                                        //             .foundJobs[
                                                        //                 index]
                                                        //             .jobTitleid ??
                                                        //         "";
                                                        // await prefs.setString(
                                                        //     "JobTitleid1",
                                                        //     jobTitleid);
                                                        // print(
                                                        //     "JobTitleid3: $jobTitleid");

                                                        // await Future.delayed(
                                                        //     Duration(
                                                        //         milliseconds:
                                                        //             200));
                                                      } catch (e) {
                                                        print("Error: $e");
                                                      } finally {
                                                        isLoading.value = false;
                                                      }

                                                      await _jobdetauilsbyJobIdController
                                                          .jobdetailbyjobIdApi(
                                                        jobListId:
                                                            _allsavedJobsController
                                                                .foundSavedJobs![
                                                                    index]
                                                                .id
                                                                .toString(),
                                                      );

                                                      await _jobdetauilsbyJobIdController
                                                          .relatedjobListApi(
                                                        jobTitleid:
                                                            _allsavedJobsController
                                                                .foundSavedJobs![
                                                                    index]
                                                                .jobTitleid,
                                                      );

                                                      Get.to(JobDetails());
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
                                                              (_allsavedJobsController
                                                                      .foundSavedJobs![
                                                                          index]
                                                                      .companyImage ??
                                                                  ""),
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

                                                  ///
                                                  // GestureDetector(
                                                  //   onTap: () async {
                                                  //     isLoading.value = true;
                                                  //     SharedPreferences prefs =
                                                  //         await SharedPreferences
                                                  //             .getInstance();
                                                  //     prefs.setString(
                                                  //         "JobListId",
                                                  //         _allsavedJobsController
                                                  //             .foundSavedJobs[
                                                  //                 index]
                                                  //             .id
                                                  //             .toString());
                                                  //     print(
                                                  //         "sadsad${_allsavedJobsController.foundSavedJobs[index].id.toString()}");
                                                  //     await Future.delayed(
                                                  //         Duration(seconds: 0));
                                                  //     isLoading.value = false;
                                                  //     await Get.to(
                                                  //         JobDetails());
                                                  //   },
                                                  //   child: Container(
                                                  //     padding:
                                                  //         const EdgeInsets.only(
                                                  //             right: 10),
                                                  //     height: textfieldHeight *
                                                  //         0.26,
                                                  //     width:
                                                  //         textfieldWidth * 0.19,
                                                  //     child: ClipOval(
                                                  //       clipBehavior: Clip.none,
                                                  //       child: Image.network(
                                                  //         FixedText.imgurl +
                                                  //             _allsavedJobsController
                                                  //                 .foundSavedJobs[
                                                  //                     index]
                                                  //                 .companyImage
                                                  //                 .toString(),
                                                  //         fit: BoxFit.fill,
                                                  //         errorBuilder:
                                                  //             (context, error,
                                                  //                 stackTrace) {
                                                  //           return ClipOval(
                                                  //             child:
                                                  //                 Image.asset(
                                                  //               'lib/assets/logo/noimageavlble.jpg',
                                                  //               width: 30,
                                                  //               height: 30,
                                                  //               fit: BoxFit
                                                  //                   .cover,
                                                  //             ),
                                                  //           );
                                                  //         },
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        blackHeadingSmall(
                                                            _allsavedJobsController
                                                                .foundSavedJobs[
                                                                    index]
                                                                .jobTitle),
                                                        TextSmallbold(
                                                            _allsavedJobsController
                                                                .foundSavedJobs[
                                                                    index]
                                                                .companyName),
                                                        TextSmalllocation(
                                                            _allsavedJobsController
                                                                .foundSavedJobs[
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
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            ///todo: delete job api....

                                                            _allsavedJobsController.deleteJob(
                                                                _allsavedJobsController
                                                                    .foundSavedJobs[
                                                                        index]
                                                                    .bookmarkid!
                                                                    .toInt()); // Assuming userId is 2

                                                            // _homePageController
                                                            //     .savejobssApi(
                                                            //   _allJibsController
                                                            //       .foundJobs[
                                                            //           index]
                                                            //       .id
                                                            //       .toString(),
                                                            // );
                                                            print('job delete');
                                                          },
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        screenWidth *
                                                                            0.0),
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: appColor2,
                                                            ),
                                                          ),
                                                        ),
                                                        boldText(
                                                            _allsavedJobsController
                                                                .foundSavedJobs[
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
                                                      _allsavedJobsController
                                                              .foundSavedJobs[
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
                                                      "${_allsavedJobsController.foundSavedJobs[index].noofdays.toString()}"),
                                                  MyElevatedButton(
                                                    onPressed: () async {
                                                      isLoading.value = true;
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      prefs.setString(
                                                          "JobListId",
                                                          _allsavedJobsController
                                                              .foundSavedJobs[
                                                                  index]
                                                              .id
                                                              .toString());
                                                      print(
                                                          "sadsad${_allsavedJobsController.foundSavedJobs[index].id.toString()}");
                                                      await Future.delayed(
                                                          Duration(seconds: 0));
                                                      isLoading.value = false;
                                                      _homePageController
                                                          .applyjobssApi(
                                                        _allsavedJobsController
                                                            .foundSavedJobs[
                                                                index]
                                                            .id
                                                            .toString(),
                                                      );
                                                    },
                                                    text: btnText('Apply'),
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
}
