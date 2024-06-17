import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/widget/elevated_button.dart';
import 'package:hirejobindia/widget/rating.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/static_text.dart';
import '../../../controllers/home_page_controllerss/home_page_controllerss.dart';
import '../../../controllers/job_list_by_cat_id_controller/job_detail_by_job_id_controller.dart';

class JobDetails extends StatefulWidget {
  static const String id = 'JobDetails';

  const JobDetails({Key? key}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

JobdetauilsbyJobIdController _jobdetauilsbyJobIdController =
    Get.put(JobdetauilsbyJobIdController());
HomePageController _homePageController = Get.find();

///todo: i can remove anchor tag in flutter...24 may 2024..

String stripHtmlTags(String htmlString) {
  final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, '');
}

class _JobDetailsState extends State<JobDetails> {
  int selectID = 1;
  double rating = 3.5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  extendBodyBehindAppBar: true,
        backgroundColor: backgroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Individual Job Detail'),
          centerTitle: true,
          titleSpacing: 0,
          // actions: [
          //   IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          // ],
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
        body: OrientationBuilder(builder: (context, orientation) {
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
            return Obx(() => (_jobdetauilsbyJobIdController.isLoading.value)
                ? Center(child: CircularProgressIndicator())
                : _buildBody());
          });
        }));
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        var orientation = MediaQuery.of(context).orientation;
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              _buildJobName(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSelect('Description', 1),
                  _buildSelect('Company', 2),
                  // _buildSelect('Reviews', 3),
                ],
              ),
              Column(
                children: [
                  if (selectID == 1)
                    _buildDescription(constraints, orientation)
                  else if (selectID == 2)
                    _buildCompany()
                  // else if (selectID == 3)
                  //   _buildReviews()
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildJobName() {
    final jobimage = _jobdetauilsbyJobIdController
        .getjobdetailbyidModel?.response?.companyImage
        .toString();

    return Container(
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
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              width: 60,
              height: 40,
              child: ClipOval(
                clipBehavior: Clip.none,
                child: Image.network(
                  FixedText.imgurl + jobimage.toString(),
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
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
            // Image.network(FixedText.imgurl + jobimage.toString(),
            //     width: 40, height: 40),
            const SizedBox(height: 8),
            blackHeadingSmall(
                "${_jobdetauilsbyJobIdController.getjobdetailbyidModel?.response?.jobTitle}"),

            // 'PHP Developer'),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                greyText(
                    "${_jobdetauilsbyJobIdController.getjobdetailbyidModel?.response?.package}"

                    // '₹ 4,75,000 - ₹ 7,90,000 a year'
                    ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: greyTextSmall('Full Time'),
                ),
                greyText(
                    "${_jobdetauilsbyJobIdController.getjobdetailbyidModel?.response?.employeementType}"

                    // '₹ 4,75,000 - ₹ 7,90,000 a year'
                    ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  width: 40,
                  height: 30,
                  child: ClipOval(
                    clipBehavior: Clip.none,
                    child: Image.network(
                      FixedText.imgurl + jobimage.toString(),
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
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

                // Container(
                //     padding: const EdgeInsets.only(right: 10),
                //     child: Image.asset('lib/assets/images/n2.png',
                //         width: 30, height: 30)),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blackHeadingSmall(
                          "${_jobdetauilsbyJobIdController.getjobdetailbyidModel?.response?.companyName}"),
                      greyTextSmall(
                          "${_jobdetauilsbyJobIdController.getjobdetailbyidModel?.response?.location}"),
                    ],
                  ),
                ),
                greyTextSmall(
                    "${_jobdetauilsbyJobIdController.getjobdetailbyidModel?.response?.noofdays}"
                    ' Left')
              ],
            ),
          ],
        ));
  }

  Widget _buildSelect(title, id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectID = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[appColor2, appColor]),
          color: selectID == id ? appColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Text(title,
            style: TextStyle(
                fontFamily: 'medium',
                fontSize: 14,
                color: selectID == id ? Colors.white : Colors.black54)),
      ),
    );
  }

  Widget _buildDescription(
      BoxConstraints constraints, Orientation orientation) {
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

    final RxBool isLoading = false.obs;

    Widget buildSection(String title, String? description) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: blackHeading(title.toUpperCase()),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              children: [
                ListTile(
                  leading: const SizedBox(
                    height: double.infinity,
                    child: Icon(Icons.circle, size: 14),
                  ),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  minLeadingWidth: 0,
                  title:
                      greyText(stripHtmlTags(description ?? 'No description')),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget buildJobCard(int index) {
      final job = _jobdetauilsbyJobIdController.foundSavedJobs[index];
      final packageText = job.package == null || job.package!.isEmpty
          ? "Not disclosed"
          : job.package!;

      return Container(
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
                GestureDetector(
                  onTap: () async {
                    isLoading.value = true;
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("JobListId", job.id.toString());
                    await Future.delayed(Duration.zero);
                    isLoading.value = false;

                    await _jobdetauilsbyJobIdController.jobdetailbyjobIdApi(
                      jobListId: job.id.toString(),
                    );

                    await _jobdetauilsbyJobIdController.relatedjobListApi(
                      jobTitleid: job.jobTitleid,
                    );
                    await Get.to(JobDetails());
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    height: textfieldHeight * 0.26,
                    width: textfieldWidth * 0.19,
                    child: ClipOval(
                      clipBehavior: Clip.none,
                      child: Image.network(
                        FixedText.imgurl + job.companyImage.toString(),
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blackHeadingSmall(job.jobTitle),
                      TextSmallbold(job.companyName),
                      TextSmalllocation(job.location),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _homePageController.savejobssApi(job.id.toString());
                          print('Job saved');
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Icon(
                            Icons.save,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                      boldText(job.requiredExperience),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: greyTextSmall4(
                stripHtmlTags(job.skills ?? "No skills listed"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldText("₹ $packageText"),
                boldText("${job.noofdays} ago"),
                MyElevatedButton(
                  onPressed: () async {
                    isLoading.value = true;
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("JobListId", job.id.toString());
                    await Future.delayed(Duration.zero);
                    isLoading.value = false;
                    _homePageController.applyjobssApi(job.id.toString());
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
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSection(
            'Qualifications',
            _jobdetauilsbyJobIdController
                .getjobdetailbyidModel?.response?.qualificationDescription),
        buildSection(
            'About the job',
            _jobdetauilsbyJobIdController
                .getjobdetailbyidModel?.response?.aboutDescription),
        buildSection(
            'Responsibilities',
            _jobdetauilsbyJobIdController
                .getjobdetailbyidModel?.response?.responsebilitiesDescription),
        Container(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: blackHeading('Related Job'.toUpperCase()),
        ),
        Obx(
          () =>
              (_jobdetauilsbyJobIdController.isLoading.value || isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 200, // Set a fixed height for the horizontal list
                      child: ListView.builder(
                        //scrollDirection: Axis.horizontal,
                        itemCount: _jobdetauilsbyJobIdController
                            .foundSavedJobs.length
                            .clamp(0, 2),
                        itemBuilder: (BuildContext context, int index) {
                          return buildJobCard(index);
                        },
                      ),
                    ),
        ),
      ],
    );
  }

  Widget _buildJobs() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const JobDetails()));
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
                    child: Image.asset('lib/assets/images/n1.png',
                        width: 30, height: 30)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blackHeadingSmall('PHP Developer'),
                      greyTextSmall('ND Info PVT LTD, NOIDA')
                    ],
                  ),
                ),
                const Icon(Icons.bookmark, color: appColor, size: 16),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: greyTextSmall(
                  'It is an established Company and it is quality based company.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //                greyText('₹ 4,75,000 - ₹ 7,90,000 a year'),
                boldText('₹ 4,75,000 - ₹ 7,90,000 a year'),
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

  Widget _buildCompany() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: blackHeading('About Company'.toUpperCase()),
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              children: [
                ListTile(
                  leading: const SizedBox(
                      height: double.infinity,
                      child: Icon(Icons.circle, size: 14)),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                  minLeadingWidth: 0,
                  title: greyText(stripHtmlTags(
                      "${_jobdetauilsbyJobIdController.getjobdetailbyidModel?.response?.companyDescription}"
                      // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'
                      )),
                  //greyText(
                  //'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'),
                ),
                // ListTile(
                //   leading: const SizedBox(
                //       height: double.infinity,
                //       child: Icon(Icons.circle, size: 14)),
                //   visualDensity:
                //       const VisualDensity(horizontal: 0, vertical: -4),
                //   minLeadingWidth: 0,
                //   title: greyText(
                //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'),
                // ),
              ],
            )),
      ],
    );
  }

  Widget _buildReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: blackHeading('Review Summary'.toUpperCase()),
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: const [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18)
                    ]),
                    const SizedBox(width: 10),
                    reviewText('(453 Reviews) 70%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: const [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18)
                    ]),
                    const SizedBox(width: 10),
                    reviewText('(201 Reviews) 20%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: const [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18)
                    ]),
                    const SizedBox(width: 10),
                    reviewText('(45 Reviews) 5%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: const [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18)
                    ]),
                    const SizedBox(width: 10),
                    reviewText('(20 Reviews) 3%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: const [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18),
                      Icon(Icons.star, color: Colors.grey, size: 18)
                    ]),
                    const SizedBox(width: 10),
                    reviewText('(10 Reviews) 2%'),
                  ],
                ),
              ],
            )),
        Container(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: blackHeading('Your Rating'.toUpperCase()),
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StarRating(
                        rating: rating,
                        onRatingChanged: (rating) =>
                            setState(() => this.rating = rating),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter here',
                      labelStyle:
                          TextStyle(color: Colors.black38, fontSize: 14),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: appColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MyElevatedButton(
                      onPressed: () {},
                      text: Text(
                        'Submit'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'medium',
                            fontSize: 16),
                      ),
                      height: 45,
                      width: double.infinity),
                )
              ],
            )),
      ],
    );
  }
}
