import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/widget/elevated_button.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import 'package:maps_launcher/maps_launcher.dart';

import '../../../constants/static_text.dart';
import '../../../controllers/company_detail_by_com_id/company_detail_by_id_controller.dart';
import '../../../controllers/home_page_controllerss/home_page_controllerss.dart';
import '../../../controllers/job_list_by_cat_id_controller/job_detail_by_job_id_controller.dart';
import 'job_details.dart';

final Uri urlfb = Uri.parse(
    "${_companyDetailController.companydetailbyIdmodel!.response!.facebookLink}"
    // 'https://www.facebook.com/HireJobsIndia/'
    );
final Uri _urllnkdn = Uri.parse(
    "${_companyDetailController.companydetailbyIdmodel!.response!.linkdnLink}"

    // 'https://www.linkedin.com/company/hire-job-india/?originalSubdomain=in'
    );
final Uri _urltwtr = Uri.parse(
    "${_companyDetailController.companydetailbyIdmodel!.response!.tiwtterLink}");
final Uri _urlinsta = Uri.parse(
    "${_companyDetailController.companydetailbyIdmodel!.response!.instaLink}");
final Uri _urlytube = Uri.parse(
    "${_companyDetailController.companydetailbyIdmodel!.response!.youtubeLink}");
final Uri asddresss = Uri.parse(
    "${_companyDetailController.companydetailbyIdmodel!.response!.companyAddress}");

Future<void> _launchUrlfb() async {
  //const url = 'https://www.facebook.com/HireJobsIndia';
  if (await canLaunch(urlfb.toString())) {
    await launch(urlfb.toString());
  } else {
    throw 'Could not launch $urlfb';
  }
}

Future<void> _launchUrllkdn() async {
  if (await canLaunch(_urllnkdn.toString())) {
    await launch(_urllnkdn.toString());
  } else {
    throw 'Could not launch $_urllnkdn';
  }
}

Future<void> _launchUrltwtr() async {
  if (await canLaunch(_urltwtr.toString())) {
    await launch(_urltwtr.toString());
  } else {
    throw 'Could not launch $_urltwtr';
  }
}

Future<void> _launchUrlinsta() async {
  if (await canLaunch(_urlinsta.toString())) {
    await launch(_urlinsta.toString());
  } else {
    throw 'Could not launch $_urlinsta';
  }
}

Future<void> _launchUrlytbee() async {
  if (await canLaunch(_urlytube.toString())) {
    await launch(_urlytube.toString());
  } else {
    throw 'Could not launch $_urlytube';
  }
}

// late GoogleMapController _mapController;
// LatLng _center = LatLng(28.5851, 77.3116); // Default center
// bool _isLoading = true;

///todo: google map api laucher...
void launchMaps(String address) async {
  final Uri googleMapsUrl =
      Uri.parse("https://www.google.com/maps/search/?api=1&query=$address");
  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl);
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}

class CompanyDetail extends StatefulWidget {
  //static const String id = 'CompanyDetail';

  const CompanyDetail({Key? key}) : super(key: key);

  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}

CompanyDetailController _companyDetailController =
    Get.put(CompanyDetailController());

///todo: i can remove anchor tag in flutter...24 may 2024..

String stripHtmlTags(String htmlString) {
  final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, '');
}

class _CompanyDetailState extends State<CompanyDetail> {
  final CompanyDetailController _companyDetailController =
      Get.put(CompanyDetailController());
  HomePageController _homePageController = Get.put(HomePageController());

  JobdetauilsbyJobIdController _jobdetauilsbyJobIdController =
      Get.put(JobdetauilsbyJobIdController());

  final RxBool isLoading = false.obs;

  // late GoogleMapController _mapController;
  // LatLng _center = LatLng(28.5851, 77.3116); // Default center
  // bool _isLoading = true;
  // final Set<Marker> _markers = {};
  bool _isValidUrl = true;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // _setInitialLocation();
    // _companyDetailController.companydetailbyIdApi();
    super.initState();
    _initializeYoutubePlayer();
  }

  // Future<void> _setInitialLocation() async {
  //   String address = _companyDetailController
  //           .companydetailbyIdmodel?.response?.companyAddress ??
  //       "Not Available";
  //   LatLng coordinates = await _getCoordinates(address);
  //   setState(() {
  //     _center = coordinates;
  //     _markers.add(Marker(
  //       markerId: MarkerId('companyAddress'),
  //       position: coordinates,
  //       infoWindow: InfoWindow(
  //         title: 'Company Address',
  //         snippet: address,
  //       ),
  //     ));
  //     _isLoading = false;
  //   });
  // }
  //
  // Future<LatLng> _getCoordinates(String address) async {
  //   try {
  //     List<Location> locations = await locationFromAddress(address);
  //     if (locations.isNotEmpty) {
  //       return LatLng(locations.first.latitude, locations.first.longitude);
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  //   return LatLng(28.5851, 77.3116); // Default coordinates if geocoding fails
  // }
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   _mapController = controller;
  // }

  void _initializeYoutubePlayer() {
    String videoUrl =
        '${_companyDetailController.companydetailbyIdmodel?.response?.youtubeLink}'
            .toString();
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    } else {
      setState(() {
        _isValidUrl = false;
      });
      print('Invalid YouTube URL');
    }
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  void launchMaps(String address) async {
    final Uri googleMapsUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$address");
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
            "${_companyDetailController.companydetailbyIdmodel!.response!.organizationName}"

            //'Prince Technology'
            ),
        centerTitle: true,
        titleSpacing: 0,
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
          return LayoutBuilder(
            builder: (context, constraints) {
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
              return Obx(
                () => (_companyDetailController.isLoading.value)
                    ? Center(child: CircularProgressIndicator())
                    : _buildBody(),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              color: backgroundColor,
              child: Stack(
                children: [
                  Column(
                    children: [_buildHeader(), _buildBottomDtl()],
                  ),
                  Positioned(
                      top: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: _buildLoginDetail()),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      //width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.25,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height *
              0.25 // Default height for portrait mode
          : MediaQuery.of(context).size.height *
              0.3, // Default height for landscape mode
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          // Default width for portrait mode
          : MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        image: DecorationImage(
            image: AssetImage('lib/assets/logo/hirelogo108.jpg'),
            fit: BoxFit.cover),
      ),
      child: _companyDetailController
                  .companydetailbyIdmodel?.response?.bgCompanyImage !=
              null
          ? Image.network(
              "${FixedText.imgurl}${_companyDetailController.companydetailbyIdmodel?.response?.bgCompanyImage.toString()}",
              //color: appColor,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
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
    );
  }

  Widget _buildLoginDetail() {
    return Center(
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ViewJobs()));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20.0,
                )
              ]),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                //companyImage
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.height *
                            0.06 // Default height for portrait mode
                        : MediaQuery.of(context).size.height *
                            0.07, // Default height for landscape mode
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.15
                        // Default width for portrait mode
                        : MediaQuery.of(context).size.width * 0.15,
                    padding: EdgeInsets.only(right: 10),
                    // decoration: const BoxDecoration(
                    //   borderRadius: BorderRadius.all(Radius.circular(4)),
                    //   image: DecorationImage(
                    //       image: AssetImage('lib/assets/logo/hirelogo108.jpg'),
                    //       fit: BoxFit.fill),
                    // ),
                    child: _companyDetailController.companydetailbyIdmodel
                                ?.response?.companyImage !=
                            null
                        ? Image.network(
                            "${FixedText.imgurl}${_companyDetailController.companydetailbyIdmodel?.response?.companyImage.toString()}",
                            //color: appColor,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'lib/assets/logo/noimageavlble.jpg',
                                fit: BoxFit.fill,
                              );
                            },
                          )
                        : Image.network(
                            'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.height *
                                    0.07 // Default height for portrait mode
                                : MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.width * 0.1
                                // Default width for portrait mode
                                : MediaQuery.of(context).size.width * 0.2,
                            fit: BoxFit.cover,
                          ),
                    // child: Image.asset('lib/assets/images/n3.png',
                    //     width: 30, height: 30
                    // )
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        blackHeadingSmall(_companyDetailController
                            .companydetailbyIdmodel
                            ?.response
                            ?.organizationName),
                        greyTextSmall(
                            "${_companyDetailController.companydetailbyIdmodel?.response?.cityName}, India")
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -16,
                right: 0,
                child: SizedBox(
                  child: MyElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ViewJobs()));
                      },
                      text: btnText(
                          //'4 OPEN POSITIONS'
                          "${_companyDetailController.companydetailbyIdmodel?.response?.noofopening}  OPEN POSITIONS"),
                      height: 28,
                      width: 140),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomDtl() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            blackHeadingSmall('About us'.toUpperCase()),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20.0,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    blackHeadingSmall('Grow Next Level Business'.toUpperCase()),
                    const SizedBox(height: 8),
                    greyText(stripHtmlTags(
                        "${_companyDetailController.companydetailbyIdmodel?.response?.description ?? "No Description"}"))

                    // 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look \n \n Lorem slightly believable. If you ar ything embarra text on theefined chunks as necessary,')
                  ],
                )),
            const SizedBox(height: 8),
            blackHeadingSmall('Intro video'.toUpperCase()),
            Container(
              height: 160,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: _isValidUrl
                    ? YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        onReady: () {
                          print('Player is ready.');
                        },
                      )
                    : const Center(
                        child: Text(
                          'Invalid YouTube URL',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
              ),
            ),

            // YoutubePlayer(
            //   controller: _controller,
            //   showVideoProgressIndicator: true,
            //   onReady: () {
            //     print('Player is ready.');
            //   },
            // ),
            //),
            // ),

            // Container(
            //   height: 160,
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(6)),
            //     image: DecorationImage(
            //         image: AssetImage('lib/assets/images/p2.jpg'),
            //         fit: BoxFit.cover),
            //   ),
            // ),
            const SizedBox(height: 8),
            blackHeadingSmall('Overview company'.toUpperCase()),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20.0,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOverviewList(Icons.category_outlined, 'Categories',
                        "${_companyDetailController.companydetailbyIdmodel?.response?.companycategoryname ?? "No Description"}"),
                    ListTile(
                      onTap: () {
                        // MapsLauncher.launchQuery(
                        //     "${_companyDetailController.companydetailbyIdmodel?.response?.companyAddress ?? "Not Available"}");
                        //
                        // /// usersatartlat,
                        // // usersatartlang,
                        // // "${userstartlocation}"
                        // Navigator.of(context).pop();
                      },
                      trailing: MyElevatedButton(
                        onPressed: () {
                          MapsLauncher.launchQuery(
                              "${_companyDetailController.companydetailbyIdmodel?.response?.companyAddress ?? "Not Available"}");

                          /// usersatartlat,
                          // usersatartlang,
                          // "${userstartlocation}"
                          Navigator.of(context).pop();

                          ///todo: we can use url launcher butr after launching it will shoing error....
                          // launchMaps(
                          //     "${_companyDetailController.companydetailbyIdmodel?.response?.companyAddress ?? "Not Available"}");
                        },
                        text: Text('Track'),
                        height: 25,
                        width: 45,
                      ),

                      ///
                      // MyTextButton(
                      //   onPressed: () {
                      //     launchMaps(
                      //         "${_companyDetailController.companydetailbyIdmodel?.response?.companyAddress ?? "Not Available"}");
                      //   },
                      //   text: 'Track',
                      //   colors: appColor,
                      // ),
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      leading: CircleAvatar(
                          backgroundColor: backgroundColor,
                          child: Icon(Icons.location_on_outlined,
                              size: 20, color: appColor),
                          radius: 18),
                      minLeadingWidth: 0,
                      title: Container(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: boldText("Location")),
                      subtitle: greyTextSmall(
                          "${_companyDetailController.companydetailbyIdmodel?.response?.companyAddress ?? "Not Available"}"),
                    ),
                    const Divider(thickness: 01, color: Colors.black12),
                    _buildOverviewList(Icons.call_outlined, 'Phone Number',
                        "${_companyDetailController.companydetailbyIdmodel?.response?.mobileNumber ?? "Not Avalable"}"),
                    _buildOverviewList(Icons.mail_outline, 'Email Address',
                        "${_companyDetailController.companydetailbyIdmodel?.response?.email ?? "Not Avalable"}"),
                    _buildOverviewList(Icons.language, 'Website',
                        "${_companyDetailController.companydetailbyIdmodel?.response?.officeUrl ?? "Not Avalable"}"),
                  ],
                )),
            const SizedBox(height: 8),
            // blackHeadingSmall('Destination Map'.toUpperCase()),
            // Container(
            //   height: 180,
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(6)),
            //   ),
            //   child: GoogleMap(
            //     onMapCreated: _onMapCreated,
            //     initialCameraPosition:
            //         CameraPosition(target: _center, zoom: 15),
            //     //zoomControlsEnabled: false,
            //     //zoomGesturesEnabled: false,
            //     markers: _markers,
            //   ),
            // ),
            ///
            // Container(
            //   height: 160,
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(6)),
            //   ),
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: 130,
            //         child: GoogleMap(
            //           onMapCreated: _onMapCreated,
            //           zoomControlsEnabled: false,
            //           zoomGesturesEnabled: false,
            //           //markers: _markers,
            //           initialCameraPosition: const CameraPosition(
            //               target: LatLng(28.5851, 77.3116), zoom: 15),
            //         ),
            //       ),
            //       InkWell(
            //           onTap: () {
            //             launchMaps(
            //                 "${_companyDetailController.companydetailbyIdmodel?.response?.companyAddress ?? "Not Available"}");
            //           },
            //           child: Icon(
            //             Icons.place_rounded,
            //             color: Colors.red,
            //           ))
            //     ],
            //   ),
            // ),
            const SizedBox(height: 8),
            blackHeadingSmall('Social Profile'.toUpperCase()),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20.0,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await _launchUrlfb();
                      },
                      child: Image.asset('lib/assets/images/facebook.png',
                          width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    InkWell(
                      onTap: () async {
                        await _launchUrllkdn();
                      },
                      //https://www.linkedin.com/company/hire-job-india/?originalSubdomain=in
                      child: Image.asset('lib/assets/images/linkedinicon.png',
                          width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    InkWell(
                      onTap: () async {
                        await _launchUrltwtr();
                      },
                      //https://twitter.com/home
                      child: Image.asset('lib/assets/images/xxlogo.png',
                          width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    InkWell(
                      onTap: () async {
                        await _launchUrlinsta();
                      },
                      //https://www.instagram.com/hirejobindia/
                      child: Image.asset('lib/assets/images/instagram.png',
                          width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    InkWell(
                      onTap: () async {
                        await _launchUrlytbee();
                      },
                      //https://www.youtube.com/@HireJobIndia
                      child: Image.asset('lib/assets/images/youtube.png',
                          width: 40, height: 40, fit: BoxFit.cover),
                    ),
                  ],
                )),

            ///
            SizedBox(height: 8),
            blackHeadingSmall('Job Vacancies (in This Company)'.toUpperCase()),

            Obx(
              () => (_companyDetailController.isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: _companyDetailController
                            .companydetailbyIdmodel
                            ?.response
                            ?.cjobOpeningss
                            ?.length
                        //.clamp(0, 2)
                        , // Show only 2 items,
                        itemBuilder: (BuildContext context, int index) {
                          final packageText = (_companyDetailController
                                          .companydetailbyIdmodel
                                          ?.response
                                          ?.cjobOpeningss![index]
                                          .package ==
                                      null ||
                                  _companyDetailController
                                      .companydetailbyIdmodel!
                                      .response!
                                      .cjobOpeningss![index]
                                      .package!
                                      .isEmpty)
                              ? "Not disclose"
                              : _companyDetailController.companydetailbyIdmodel
                                  ?.response?.cjobOpeningss![index].package!;
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 3),
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
                                          jobListId: _companyDetailController
                                              .companydetailbyIdmodel!
                                              .response!
                                              .cjobOpeningss![index]
                                              .id
                                              .toString(),
                                        );

                                        _jobdetauilsbyJobIdController
                                            .relatedjobListApi(
                                          jobTitleid: _companyDetailController
                                              .companydetailbyIdmodel!
                                              .response!
                                              .cjobOpeningss![index]
                                              .jobTitleid,
                                        );

                                        Get.to(JobDetails());
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        height: MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.portrait
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07 // Default height for portrait mode
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.016,
                                        width: MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.portrait
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.19
                                            // Default width for portrait mode
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                        // height:
                                        // textfieldHeight * 0.26,
                                        // width: textfieldWidth * 0.19,
                                        child: ClipOval(
                                          clipBehavior: Clip.none,
                                          child: Image.network(
                                            FixedText.imgurl +
                                                (_companyDetailController
                                                        .companydetailbyIdmodel!
                                                        .response!
                                                        .cjobOpeningss![index]
                                                        .companyImage ??
                                                    ""),
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) {
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
                                              _companyDetailController
                                                  .companydetailbyIdmodel!
                                                  .response!
                                                  .cjobOpeningss![index]
                                                  .jobTitle),
                                          TextSmallbold(_companyDetailController
                                              .companydetailbyIdmodel!
                                              .response!
                                              .cjobOpeningss![index]
                                              .companyName),
                                          TextSmalllocation(
                                              _companyDetailController
                                                  .companydetailbyIdmodel!
                                                  .response!
                                                  .cjobOpeningss![index]
                                                  .location),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      // height: MediaQuery.of(context).orientation ==
                                      //     Orientation.portrait
                                      //     ? MediaQuery.of(context).size.height *
                                      //     0.26 // Default height for portrait mode
                                      //     : MediaQuery.of(context).size.height * 0.016,
                                      width: MediaQuery.of(context)
                                                  .orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.width *
                                              0.2
                                          // Default width for portrait mode
                                          : MediaQuery.of(context).size.width *
                                              0.2,
                                      //width: screenWidth * 0.2,

                                      ///height: screenHeight * 0.09,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _homePageController.savejobssApi(
                                                _companyDetailController
                                                    .companydetailbyIdmodel!
                                                    .response!
                                                    .cjobOpeningss![index]
                                                    .id
                                                    .toString(),
                                              );
                                              print('job saved');
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0),
                                              child: Icon(
                                                Icons.save,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                          ),
                                          boldText(_companyDetailController
                                              .companydetailbyIdmodel!
                                              .response!
                                              .cjobOpeningss![index]
                                              .requiredExperience),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: greyTextSmall4(
                                    stripHtmlTags(_companyDetailController
                                            .companydetailbyIdmodel!
                                            .response!
                                            .cjobOpeningss![index]
                                            .skills ??
                                        "No skills listed"),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    boldText("₹  ${packageText}"),
                                    boldText(
                                        "${_companyDetailController.companydetailbyIdmodel!.response!.cjobOpeningss![index].noofdays.toString()}"),
                                    MyElevatedButton(
                                      onPressed: () async {
                                        isLoading.value = true;
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString(
                                            "JobListId",
                                            _companyDetailController
                                                .companydetailbyIdmodel!
                                                .response!
                                                .cjobOpeningss![index]
                                                .id
                                                .toString());
                                        print(
                                            "sadsad${_companyDetailController.companydetailbyIdmodel!.response!.cjobOpeningss![index].id.toString()}");
                                        await Future.delayed(
                                            Duration(seconds: 0));
                                        isLoading.value = false;
                                        _homePageController.applyjobssApi(
                                          _companyDetailController
                                              .companydetailbyIdmodel!
                                              .response!
                                              .cjobOpeningss![index]
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
                        },
                      ),
                    ),
            ),

            ///
            // SingleChildScrollView(
            //     padding: const EdgeInsets.symmetric(vertical: 8),
            //     child: ListView.builder(
            //       padding: EdgeInsets.zero,
            //       itemCount:_companyDetailController.companydetailbyIdmodel?.response!.cjobOpeningss!.length,
            //       physics: const ScrollPhysics(),
            //       shrinkWrap: true,
            //       itemBuilder: (context, i) => Column(
            //         children: [_buildJobs()],
            //       ),
            //     ))
          ],
        ));
  }

  Widget _buildOverviewList(icon, title, txt) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          leading: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Icon(icon, size: 20, color: appColor),
              radius: 18),
          minLeadingWidth: 0,
          title: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: boldText(title)),
          subtitle: greyTextSmall(txt),
        ),
        const Divider(thickness: 1, color: Colors.black12)
      ],
    );
  }

  Widget _buildOverviewList2(icon, title, ontap, txt, icon2) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          trailing: icon2,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          leading: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Icon(icon, size: 20, color: appColor),
              radius: 18),
          minLeadingWidth: 0,
          title: Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: boldText(title)),
          subtitle: greyTextSmall(txt),
        ),
        const Divider(thickness: 1, color: Colors.black12)
      ],
    );
  }

  Widget _buildJobs() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
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
                    child: Image.asset('lib/assets/images/n3.png',
                        width: 30, height: 30)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blackHeadingSmall('Flutter Developer'),
                      greyTextSmall('Prince Tech. Noida India, IND')
                    ],
                  ),
                ),
                const Icon(Icons.bookmark, color: appColor, size: 16),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: greyTextSmall(
                  'It is a long established fact that a reader be distracted by content of page when looking at its layout..'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldText('₹ 3,35,000 - ₹ 5,85,000 a year'),
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

  //https://www.facebook.com/HireJobsIndia
  //https://www.linkedin.com/company/hire-job-india/?originalSubdomain=in
  //https://www.instagram.com/hirejobindia/
  //https://www.youtube.com/@HireJobIndia

}

// Future<LatLng> _getCoordinates(String address) async {
//   try {
//     List<Location> locations = await locationFromAddress(address);
//     if (locations.isNotEmpty) {
//       return LatLng(locations.first.latitude, locations.first.longitude);
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
//   return LatLng(28.5851, 77.3116); // Default coordinates if geocoding fails
// }
//
// void _onMapCreated(GoogleMapController controller) {
//   _mapController = controller;
// }
