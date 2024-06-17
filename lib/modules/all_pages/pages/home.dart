import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/modules/all_pages/pages/categories.dart';
import 'package:hirejobindia/modules/all_pages/pages/company.dart';
import 'package:hirejobindia/modules/all_pages/pages/testimonials_employee.dart';
import 'package:hirejobindia/modules/all_pages/pages/view_jobs.dart';
import 'package:hirejobindia/widget/elevated_button.dart';
import 'package:hirejobindia/widget/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/responsive_text.dart';
import '../../../constants/static_text.dart';
import '../../../controllers/catagory_controllerss/get_catagory_controller.dart';
import '../../../controllers/company_controllers/company_controller.dart';
import '../../../controllers/company_detail_by_com_id/company_detail_by_id_controller.dart';
import '../../../controllers/employee_controller/profile_controller/profile_info_employee_controller.dart';
import '../../../controllers/home_page_controllerss/home_page_controllerss.dart';
import '../../../controllers/job_list_by_cat_id_controller/job_detail_by_job_id_controller.dart';
import '../../../controllers/testimonial_controllerr/testimonial_controllersss.dart';
import '../../../controllers/user_profile_controller/user_profile_controller.dart';
import '../../../controllers/view_job_controller/job_controllersss.dart';
import '../../../services_apis/auto_login_employee.dart';
import '../../../widget/elevated_button2.dart';
import 'emploree_pages/employee_login.dart';
import 'emploree_pages/home_page_employee.dart';
import 'job_details.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';
  final RxBool isLoading = false.obs;

  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> cateList = <Item>[
    const Item('lib/assets/images/c1.png', 'Developer'),
    const Item('lib/assets/images/c2.png', 'Technology'),
    const Item('lib/assets/images/c3.png', 'Accounting'),
    const Item('lib/assets/images/c4.png', 'Engineer'),
    const Item('lib/assets/images/c1.png', 'Developer'),
    const Item('lib/assets/images/c2.png', 'Technology'),
    const Item('lib/assets/images/c3.png', 'Accounting'),
    const Item('lib/assets/images/c4.png', 'Engineer'),
  ];

  List<Item> companyList = <Item>[
    const Item('lib/assets/images/n3.png', 'Prince Tech'),
    const Item('lib/assets/images/n2.png', 'Nd Info'),
    const Item('lib/assets/images/n1.png', 'TechMahindra IT'),
    const Item('lib/assets/images/n4.png', 'PVT2. LTD.'),
    const Item('lib/assets/images/n3.png', 'Prince Tech'),
    const Item('lib/assets/images/n2.png', 'Gorge Info'),
    const Item('lib/assets/images/n1.png', 'TATA IT'),
    const Item('lib/assets/images/n4.png', 'CHEM PVT. LTD.'),
  ];
  @override
  void initState() {
    super.initState();
  }

  AllcatagoryController _allcatagoryController =
      Get.put(AllcatagoryController());

  AllcompanyController _allcompanyController = Get.put(AllcompanyController());

  HomePageController _homePageController = Get.put(HomePageController());
  AllJibsController _allJibsController = Get.put(AllJibsController());

  AlltestimonialController _alltestimonialController =
      Get.put(AlltestimonialController());

  final ProfileEmployeeController _getprofileepersonal =
      Get.put(ProfileEmployeeController());

  ProfileController _profileController = Get.find();

  JobdetauilsbyJobIdController _jobdetauilsbyJobIdController =
      Get.put(JobdetauilsbyJobIdController());

  CompanyDetailController _companyDetailController =
      Get.put(CompanyDetailController());

  String stripHtmlTags(String htmlString) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Home'),
        centerTitle: true,
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewJobs()));
              // Navigate to search page
            },
            icon: const Icon(Icons.search),
            padding:
                EdgeInsets.symmetric(vertical: 8), // Adjust vertical padding
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomElevatedButton(
              onPressed: () {
                Timer(Duration(seconds: 2), () async {
                  final accountData2 = await accountService2.getAccountData2;
                  print("AccountData2: $accountData2");

                  if (accountData2 == null) {
                    await _getprofileepersonal.profileemployeeApi();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => EmployeeLogin()),
                    );
                  } else {
                    await _getprofileepersonal.profileemployeeApi();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeEmployee()),
                    );
                  }
                });
                // Get.to(EmployeeLogin());
                // Add your onPressed logic here
              },
              text: "E-Login",
              backgroundColor: logoColor,
              textColor: Colors.white,
              elevation: 2,
              borderRadius: 15,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[appColor2, appColor],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(child: OrientationBuilder(builder: (context, orientation) {
        return LayoutBuilder(builder: (context, constraints) {
          final RxBool isLoading = false.obs;

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
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackHeadingSmall('All Category'.toUpperCase()),
                      GestureDetector(
                          onTap: () {
                            _allcatagoryController.catagoryListApi();
                            _allcatagoryController.update();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories()));
                          },
                          child: appcolorText('See All'))
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Obx(() {
                      if (_allcatagoryController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (_allcatagoryController.foundcategory.isEmpty) {
                        return Center(child: Text('No categories found'));
                      }
                      return Row(
                        children: _allcatagoryController.foundcategory
                            .map((category) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 16, bottom: 16, right: 12),
                              width: 110,
                              height: 90,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 8,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(),

                                  responsiveContainer(
                                    // padding: const EdgeInsets.only(right: 0),
                                    //height: 20,
                                    //width: 20,
                                    heightPortrait:
                                        MediaQuery.of(context).size.height *
                                            0.055,
                                    widthPortrait:
                                        MediaQuery.of(context).size.width *
                                            0.12,
                                    heightLandscape:
                                        MediaQuery.of(context).size.height *
                                            0.1,
                                    widthLandscape:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.05, // 20% of screen height if not provided
                                    // width: MediaQuery.of(context).size.width * 0.09,
                                    child: category.postedImage != null
                                        ? Image.network(
                                            FixedText.imgurl +
                                                category.postedImage.toString(),
                                            color: appColor,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'lib/assets/logo/noimageavlble.jpg',
                                                fit: BoxFit.fill,
                                              );
                                            },
                                          )
                                        : Image.network(
                                            'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                            fit: BoxFit.fill,
                                          ),
                                    context: context,
                                  ),
                                  Spacer(),
                                  responsiveText(
                                    context: context,
                                    text:
                                        "${category?.postedtype ?? 'Unknown Category'}",
                                    fontSizePortrait: 10,
                                    fontSizeLandscape: 10,
                                    color: Colors.black,
                                  ),
                                  Spacer(),
                                  // boldTextcat(category?.postedtype ??
                                  //     'Unknown Category'),
                                  //SizedBox(height: 4),
                                  greyTextSmall(
                                    '(${category?.noofopening ?? 'Not Found'} jobs)',
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackHeadingSmall('Jobs'.toUpperCase()),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewJobs()));
                          },
                          child: appcolorText('See All'))
                    ],
                  ),
                ),
                Obx(
                  () => (_allJibsController.isLoading.value || isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: _allJibsController.foundJobs.length
                                .clamp(0, 2), // Show only 2 items,
                            itemBuilder: (BuildContext context, int index) {
                              final packageText = (_allJibsController
                                              .foundJobs[index].package ==
                                          null ||
                                      _allJibsController
                                          .foundJobs[index].package!.isEmpty)
                                  ? "Not disclose"
                                  : _allJibsController
                                      .foundJobs[index].package!;
                              return Container(
                                padding: const EdgeInsets.all(16),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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

                                            _jobdetauilsbyJobIdController
                                                .jobdetailbyjobIdApi(
                                              jobListId: _allJibsController
                                                  .foundJobs[index].id
                                                  .toString(),
                                            );

                                            _jobdetauilsbyJobIdController
                                                .relatedjobListApi(
                                              jobTitleid: _allJibsController
                                                  .foundJobs[index].jobTitleid,
                                            );

                                            Get.to(JobDetails());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            height: textfieldHeight * 0.26,
                                            width: textfieldWidth * 0.19,
                                            child: ClipOval(
                                              clipBehavior: Clip.none,
                                              child: Image.network(
                                                FixedText.imgurl +
                                                    (_allJibsController
                                                            .foundJobs[index]
                                                            .companyImage ??
                                                        ""),
                                                fit: BoxFit.fill,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return ClipOval(
                                                    child: Image.asset(
                                                      'lib/assets/logo/noimageavlble.jpg',
                                                      width: 30,
                                                      height: 30,
                                                      fit: BoxFit.cover,
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
                                        //         _allJibsController
                                        //             .foundJobs[index].id
                                        //             .toString());
                                        //     print(
                                        //         "sadsad${_allJibsController.foundJobs[index].id.toString()}");
                                        //     await Future.delayed(
                                        //         Duration(seconds: 0));
                                        //     isLoading.value = false;
                                        //
                                        //     await _jobdetauilsbyJobIdController
                                        //         .jobdetailbyjobIdApi();
                                        //     await _jobdetauilsbyJobIdController
                                        //         .relatedjobListApi();
                                        //     _jobdetauilsbyJobIdController
                                        //         .update();
                                        //     await Get.to(JobDetails());
                                        //   },
                                        //   child: Container(
                                        //     padding: const EdgeInsets.only(
                                        //         right: 10),
                                        //     height: textfieldHeight * 0.26,
                                        //     width: textfieldWidth * 0.19,
                                        //     child: ClipOval(
                                        //       clipBehavior: Clip.none,
                                        //       child: Image.network(
                                        //         FixedText.imgurl +
                                        //             _allJibsController
                                        //                 .foundJobs[index]
                                        //                 .companyImage
                                        //                 .toString(),
                                        //         fit: BoxFit.fill,
                                        //         errorBuilder: (context, error,
                                        //             stackTrace) {
                                        //           return ClipOval(
                                        //             child: Image.asset(
                                        //               'lib/assets/logo/noimageavlble.jpg',
                                        //               width: 30,
                                        //               height: 30,
                                        //               fit: BoxFit.cover,
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              blackHeadingSmall(
                                                  _allJibsController
                                                      .foundJobs[index]
                                                      .jobTitle),
                                              TextSmallbold(_allJibsController
                                                  .foundJobs[index]
                                                  .companyName),
                                              TextSmalllocation(
                                                  _allJibsController
                                                      .foundJobs[index]
                                                      .location),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.2,

                                          ///height: screenHeight * 0.09,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _homePageController
                                                      .savejobssApi(
                                                    _allJibsController
                                                        .foundJobs[index].id
                                                        .toString(),
                                                  );
                                                  print('job saved');
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          screenWidth * 0.0),
                                                  child: Icon(
                                                    Icons.save,
                                                    color: Colors.indigo,
                                                  ),
                                                ),
                                              ),
                                              boldText(_allJibsController
                                                  .foundJobs[index]
                                                  .requiredExperience),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: greyTextSmall4(
                                        stripHtmlTags(_allJibsController
                                                .foundJobs[index].skills ??
                                            "No skills listed"),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        boldText("₹  ${packageText}"),
                                        boldText(
                                            "${_allJibsController.foundJobs[index].noofdays.toString()}"),
                                        MyElevatedButton(
                                          onPressed: () async {
                                            isLoading.value = true;
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString(
                                                "JobListId",
                                                _allJibsController
                                                    .foundJobs[index].id
                                                    .toString());
                                            print(
                                                "sadsad${_allJibsController.foundJobs[index].id.toString()}");
                                            await Future.delayed(
                                                Duration(seconds: 0));
                                            isLoading.value = false;
                                            _homePageController.applyjobssApi(
                                              _allJibsController
                                                  .foundJobs[index].id
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
                            },
                          ),
                        ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackHeadingSmall('Companies'.toUpperCase()),
                      GestureDetector(
                          onTap: () async {
                            await _allcompanyController.companyListApi();
                            _allcompanyController.update();
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Company()));
                          },
                          child: appcolorText('See All'))
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Obx(() {
                      if (_allcompanyController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (_allcompanyController.foundcompany.isEmpty) {
                        return Center(child: Text('No Company found'));
                      }
                      return Row(
                        children:
                            _allcompanyController.foundcompany.map((category) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 16, bottom: 16, right: 12),
                              width: 110,
                              height: 90,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 8,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(),

                                  responsiveContainer(
                                    // padding: const EdgeInsets.only(right: 0),
                                    //height: 20,
                                    //width: 20,
                                    heightPortrait:
                                        MediaQuery.of(context).size.height *
                                            0.055,
                                    widthPortrait:
                                        MediaQuery.of(context).size.width *
                                            0.12,
                                    heightLandscape:
                                        MediaQuery.of(context).size.height *
                                            0.1,
                                    widthLandscape:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    // height: MediaQuery.of(context).size.height *
                                    //     0.05, // 20% of screen height if not provided
                                    // width: MediaQuery.of(context).size.width * 0.09,
                                    child: category.companyImage != null
                                        ? Image.network(
                                            FixedText.imgurl +
                                                category.companyImage
                                                    .toString(),
                                            //color: appColor,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'lib/assets/logo/noimageavlble.jpg',
                                                fit: BoxFit.fill,
                                              );
                                            },
                                          )
                                        : Image.network(
                                            'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                            fit: BoxFit.fill,
                                          ),
                                    context: context,
                                  ),
                                  Spacer(),
                                  responsiveText(
                                    context: context,
                                    text:
                                        "${category?.organizationName ?? 'Unknown Category'}",
                                    fontSizePortrait: 10,
                                    fontSizeLandscape: 10,
                                    color: Colors.black,
                                  ),
                                  Spacer(),
                                  // boldTextcat(category?.postedtype ??
                                  //     'Unknown Category'),
                                  //SizedBox(height: 4),
                                  greyTextSmall(
                                    '(${category?.noofopening ?? 'Not Found'} jobs)',
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       blackHeadingSmall('Featured jobs'.toUpperCase()),
                //       GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => ViewJobs()));
                //           },
                //           child: appcolorText('See All'))
                //     ],
                //   ),
                // ),
                // SingleChildScrollView(
                //     padding: const EdgeInsets.symmetric(vertical: 8),
                //     child: ListView.builder(
                //       padding: EdgeInsets.zero,
                //       itemCount: 2,
                //       physics: const ScrollPhysics(),
                //       shrinkWrap: true,
                //       itemBuilder: (context, i) => Column(
                //         children: [_buildJobs()],
                //       ),
                //     )),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackHeadingSmall('Our Testimonial'.toUpperCase()),
                      GestureDetector(
                          onTap: () {
                            _alltestimonialController.TestimonialApi();
                            _alltestimonialController.update();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestimonialView()));
                          },
                          child: appcolorText('See All'))
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Obx(() {
                      if (_alltestimonialController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (_alltestimonialController.foundtestmonial.isEmpty) {
                        return Center(child: Text('No Testimonial found'));
                      }
                      return Row(
                        children: _alltestimonialController.foundtestmonial
                            .map((testgimonial) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                                margin: const EdgeInsets.only(
                                    top: 16, bottom: 16, right: 12),
                                padding: const EdgeInsets.all(10),
                                width: 220,
                                height: 160,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 8,
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        responsiveContainer(
                                          // padding: const EdgeInsets.only(right: 0),
                                          //height: 20,
                                          //width: 20,
                                          heightPortrait: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.055,
                                          widthPortrait: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.12,
                                          heightLandscape:
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                          widthLandscape: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.06,
                                          // height: MediaQuery.of(context).size.height *
                                          //     0.05, // 20% of screen height if not provided
                                          // width: MediaQuery.of(context).size.width * 0.09,
                                          child: testgimonial.filePath != null
                                              ? Image.network(
                                                  FixedText.imgurltestimonial +
                                                      testgimonial.filePath
                                                          .toString(),
                                                  // color: appColor,
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.asset(
                                                      'lib/assets/logo/noimageavlble.jpg',
                                                      fit: BoxFit.fill,
                                                    );
                                                  },
                                                )
                                              : Image.network(
                                                  'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                                  fit: BoxFit.fill,
                                                ),
                                          context: context,
                                        ),
                                        // responsiveContainer(
                                        //     padding: const EdgeInsets.only(
                                        //         right: 10),
                                        //     child: Image.asset(
                                        //         'lib/assets/images/p2.jpg',
                                        //         fit: BoxFit.cover,
                                        //         width: 40,
                                        //         height: 40)
                                        // ),
                                        SizedBox(
                                          width: screenWidth * 0.01,
                                        ),
                                        //Spacer(),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              responsiveText(
                                                context: context,
                                                text:
                                                    "${testgimonial?.name ?? 'Unknown Category'}",
                                                fontSizePortrait: 10,
                                                fontSizeLandscape: 10,
                                                color: Colors.black,
                                              ),
                                              greyTextSmall(
                                                  testgimonial?.designation ??
                                                      'Not Found')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                        thickness: 1, color: backgroundColor),
                                    // Row(
                                    //   children: [
                                    //     Row(children: const [
                                    //       Icon(Icons.star,
                                    //           color: Colors.orange, size: 14),
                                    //       Icon(Icons.star,
                                    //           color: Colors.orange, size: 14),
                                    //       Icon(Icons.star,
                                    //           color: Colors.orange, size: 14),
                                    //       Icon(Icons.star,
                                    //           color: Colors.orange, size: 14),
                                    //       Icon(Icons.star,
                                    //           color: Colors.grey, size: 14)
                                    //     ]),
                                    //     const SizedBox(width: 8),
                                    //     greyTextSmall('4.0 (1001 Reviews)'),
                                    //   ],
                                    // ),
                                    const SizedBox(height: 2),
                                    greyTextSmall3(stripHtmlTags(
                                        testgimonial?.paragraph ?? 'Not Found'))
                                  ],
                                )),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        });
      })),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                blackHeadingSmall('All Category'.toUpperCase()),
                GestureDetector(
                    onTap: () {
                      _allcatagoryController.catagoryListApi();
                      _allcatagoryController.update();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    },
                    child: appcolorText('See All'))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: Obx(() {
                if (_allcatagoryController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (_allcatagoryController.foundcategory.isEmpty) {
                  return Center(child: Text('No categories found'));
                }
                return Row(
                  children:
                      _allcatagoryController.foundcategory.map((category) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 16, bottom: 16, right: 12),
                        width: 110,
                        height: 90,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 8,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),

                            responsiveContainer(
                              // padding: const EdgeInsets.only(right: 0),
                              //height: 20,
                              //width: 20,
                              heightPortrait:
                                  MediaQuery.of(context).size.height * 0.055,
                              widthPortrait:
                                  MediaQuery.of(context).size.width * 0.12,
                              heightLandscape:
                                  MediaQuery.of(context).size.height * 0.1,
                              widthLandscape:
                                  MediaQuery.of(context).size.width * 0.06,
                              // height: MediaQuery.of(context).size.height *
                              //     0.05, // 20% of screen height if not provided
                              // width: MediaQuery.of(context).size.width * 0.09,
                              child: category.postedImage != null
                                  ? Image.network(
                                      FixedText.imgurl +
                                          category.postedImage.toString(),
                                      color: appColor,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'lib/assets/logo/noimageavlble.jpg',
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    )
                                  : Image.network(
                                      'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                      fit: BoxFit.fill,
                                    ),
                              context: context,
                            ),
                            Spacer(),
                            responsiveText(
                              context: context,
                              text:
                                  "${category?.postedtype ?? 'Unknown Category'}",
                              fontSizePortrait: 10,
                              fontSizeLandscape: 10,
                              color: Colors.black,
                            ),
                            Spacer(),
                            // boldTextcat(category?.postedtype ??
                            //     'Unknown Category'),
                            //SizedBox(height: 4),
                            greyTextSmall(
                              '(${category?.noofopening ?? 'Not Found'} jobs)',
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                blackHeadingSmall('Jobs'.toUpperCase()),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewJobs()));
                    },
                    child: appcolorText('See All'))
              ],
            ),
          ),
          SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) => Column(
                  children: [_buildJobs()],
                ),
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                blackHeadingSmall('Companies'.toUpperCase()),
                GestureDetector(
                    onTap: () {
                      _allcompanyController.companyListApi();
                      _allcompanyController.update();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Company()));
                    },
                    child: appcolorText('See All'))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: Obx(() {
                if (_allcompanyController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (_allcompanyController.foundcompany.isEmpty) {
                  return Center(child: Text('No categories found'));
                }
                return Row(
                  children: _allcompanyController.foundcompany.map((category) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 16, bottom: 16, right: 12),
                        width: 110,
                        height: 90,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 8,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),

                            GestureDetector(
                              onTap: () {},
                              child: responsiveContainer(
                                // padding: const EdgeInsets.only(right: 0),
                                //height: 20,
                                //width: 20,
                                heightPortrait:
                                    MediaQuery.of(context).size.height * 0.055,
                                widthPortrait:
                                    MediaQuery.of(context).size.width * 0.12,
                                heightLandscape:
                                    MediaQuery.of(context).size.height * 0.1,
                                widthLandscape:
                                    MediaQuery.of(context).size.width * 0.06,
                                // height: MediaQuery.of(context).size.height *
                                //     0.05, // 20% of screen height if not provided
                                // width: MediaQuery.of(context).size.width * 0.09,
                                child: category.companyImage != null
                                    ? Image.network(
                                        FixedText.imgurl +
                                            category.companyImage.toString(),
                                        //color: appColor,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'lib/assets/logo/noimageavlble.jpg',
                                            fit: BoxFit.fill,
                                          );
                                        },
                                      )
                                    : Image.network(
                                        'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                context: context,
                              ),
                            ),
                            Spacer(),
                            responsiveText(
                              context: context,
                              text:
                                  "${category?.organizationName ?? 'Unknown Category'}",
                              fontSizePortrait: 10,
                              fontSizeLandscape: 10,
                              color: Colors.black,
                            ),
                            Spacer(),
                            // boldTextcat(category?.postedtype ??
                            //     'Unknown Category'),
                            //SizedBox(height: 4),
                            greyTextSmall(
                              '(${category?.noofopening ?? 'Not Found'} jobs)',
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                blackHeadingSmall('Featured jobs'.toUpperCase()),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewJobs()));
                    },
                    child: appcolorText('See All'))
              ],
            ),
          ),
          SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) => Column(
                  children: [_buildJobs()],
                ),
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                blackHeadingSmall('Our Testimonial'.toUpperCase()),
                appcolorText('See All')
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: cateList.map((e) {
                  return _buildTestimonial(context, e);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(context, e) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.only(top: 16, bottom: 16, right: 12),
          width: 110,
          height: 90,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 8,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                e.img,
                width: 30,
                height: 30,
                color: appColor,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 4),
              boldText(e.name),
              const SizedBox(height: 4),
              greyTextSmall('(108 jobs)')
            ],
          )),
    );
  }

  Widget _buildJobs() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const JobDetails()));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset('lib/assets/images/n4.png',
                        width: 30, height: 30)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blackHeadingSmall('Flutter Developer'),
                      greyTextSmall('Micro Tech. Noida India')
                    ],
                  ),
                ),
                const Icon(Icons.bookmark, color: appColor, size: 16),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: greyTextSmall(
                  'It is a established company and it is good for employees and environment is very healthy..'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldText('₹ 3,50,000- ₹8,50,000 a year'),
                MyElevatedButton(
                    onPressed: () {},
                    text: btnText('Apply'),
                    height: 28,
                    width: 80)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonial(context, e) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.only(top: 16, bottom: 16, right: 12),
          padding: const EdgeInsets.all(10),
          width: 220,
          height: 160,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 8,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset('lib/assets/images/p2.jpg',
                          fit: BoxFit.cover, width: 40, height: 40)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        blackHeadingSmall('Test '),
                        greyTextSmall('It Manager @Nd Tech')
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1, color: backgroundColor),
              Row(
                children: [
                  Row(children: const [
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    Icon(Icons.star, color: Colors.grey, size: 14)
                  ]),
                  const SizedBox(width: 8),
                  greyTextSmall('4.0 (1001 Reviews)'),
                ],
              ),
              const SizedBox(height: 8),
              greyTextSmall(
                  'It is very good company for develop your project and It will deliver your project on time')
            ],
          )),
    );
  }
}

class Item {
  const Item(this.img, this.name);
  final String img;
  final String name;
}
