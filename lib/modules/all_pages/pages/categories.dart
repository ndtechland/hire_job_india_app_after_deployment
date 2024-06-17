import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';

import '../../../components/responsive_text.dart';
import '../../../constants/static_text.dart';
import '../../../controllers/catagory_controllerss/get_catagory_controller.dart';
import '../../../controllers/home_page_controllerss/home_page_controllerss.dart';
import '../../../controllers/view_job_controller/job_controllersss.dart';
import 'company_list_by_catagory_id.dart';

class Categories extends StatelessWidget {
  final RxBool isLoading = false.obs;

  static const String id = 'Categories';

  Categories({Key? key}) : super(key: key);
  final AllcatagoryController _allcatagoryController = Get.find();

  AllJibsController _allJibsController = Get.put(AllJibsController());
  HomePageController _homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      //drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Categories'),
        centerTitle: true,
        titleSpacing: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
        flexibleSpace: Container(
          height: double.infinity,
          width: double.infinity,
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
          var screenWidth = constraints.maxWidth;
          var screenHeight = constraints.maxHeight;

          var imageWidth = orientation == Orientation.portrait
              ? screenWidth * 0.55
              : screenWidth * 0.3;
          var imageHeight = orientation == Orientation.portrait
              ? screenHeight * 0.2
              : screenHeight * 0.4;

          var categoryWidth = orientation == Orientation.portrait
              ? screenWidth * 0.5
              : screenWidth * 0.4;
          var categoryHeight = orientation == Orientation.portrait
              ? screenHeight * 0.12
              : screenHeight * 0.45;

          var textfieldWidth2 = orientation == Orientation.portrait
              ? screenWidth * 0.84
              : screenWidth * 0.87;
          var textfieldHeight2 = orientation == Orientation.portrait
              ? screenHeight * 0.15
              : screenHeight * 0.4;

          return Obx(
            () => (_allcatagoryController.isLoading.value || isLoading.value)
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Container(
                        //width: screenWidth * 0.97,
                        height: imageHeight * 0.5,
                        color: appColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        child: SizedBox(
                          width: screenWidth * 0.97,
                          height: screenHeight * 0.14,
                          child: TextField(
                            cursorColor: appColor,
                            onChanged: (value) =>
                                _allcatagoryController.filterCatagorryy(value),
                            autofocus: false,
                            style: TextStyle(fontSize: 15.0, color: appColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: appColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Category',
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
                      Expanded(
                        child: _allcatagoryController.foundcategory.isEmpty
                            ? Center(
                                child: Text("No category Found"),
                              )
                            : Container(
                                margin: const EdgeInsets.all(8),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12.0,
                                    mainAxisSpacing: 12.0,
                                  ),
                                  itemCount: _allcatagoryController
                                      .foundcategory.length,
                                  itemBuilder: (context, index) {
                                    final category = _allcatagoryController
                                        .foundcategory[index];
                                    if (category == null) return Container();
                                    return GestureDetector(
                                      onTap: () async {
                                        _allJibsController.jobListByCatIDApi(
                                            category.id.toInt());
                                        _allJibsController.update();
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewJobListOnID(),
                                            //const CompanyDetail(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 0),
                                              blurRadius: 1,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.16),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 0),
                                              height: categoryHeight * 0.5,
                                              width: categoryWidth * 0.25,
                                              child: ClipOval(
                                                clipBehavior: Clip.none,
                                                child: category?.postedImage !=
                                                        null
                                                    ? Image.network(
                                                        FixedText.imgurl +
                                                            category.postedImage
                                                                .toString(),
                                                        color: appColor,
                                                        fit: BoxFit.fill,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return Image.asset(
                                                            'lib/assets/logo/noimageavlble.jpg',
                                                            // width:
                                                            //     categoryWidth *
                                                            //         0.2,
                                                            // height:
                                                            //     categoryHeight *
                                                            //         0.3,
                                                            //color: appColor,
                                                            fit: BoxFit.fill,
                                                          );
                                                        },
                                                      )
                                                    : Image.network(
                                                        'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
                                                        fit: BoxFit.fill,
                                                      ), // Provide a fallback image URL
                                              ),
                                            ),
                                            SizedBox(
                                                height: categoryHeight * 0.05),
                                            responsiveText(
                                              context: context,
                                              text:
                                                  "${category?.postedtype ?? 'Unknown Category'}",
                                              fontSizePortrait: 10,
                                              fontSizeLandscape: 17,
                                              color: Colors.black,
                                            ),
                                            // boldTextcat(category?.postedtype ??
                                            //     'Unknown Category'),
                                            SizedBox(
                                                height: categoryHeight * 0.1),
                                            greyTextSmall(
                                              '(${category?.noofopening ?? 'Not Found'} jobs)',
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
                    ],
                  ),
          );
        });
      }),
    );
  }
}
