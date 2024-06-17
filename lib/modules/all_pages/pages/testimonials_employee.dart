import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/styles.dart';
import '../../../constants/static_text.dart';
import '../../../controllers/testimonial_controllerr/testimonial_controllersss.dart';

class TestimonialView extends StatelessWidget {
  final RxBool isLoading = false.obs;

  TestimonialView({Key? key}) : super(key: key);

  final AlltestimonialController _alltestimonialController = Get.find();

  String stripHtmlTags(String htmlString) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Testimonials'),
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
          return LayoutBuilder(builder: (context, constraints) {
            var screenWidth = constraints.maxWidth;
            var screenHeight = constraints.maxHeight;

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
                : screenHeight * 0.45;

            return Obx(
              () => (_alltestimonialController.isLoading.value ||
                      isLoading.value)
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
                                    1), // Adjust vertical padding to decrease height
                            child: SizedBox(
                              width: screenWidth * 0.97,
                              height: screenHeight * 0.14,
                              child: TextField(
                                cursorColor: Colors.blue,
                                onChanged: (value) => _alltestimonialController
                                    .filterTestimonial(value),
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.blue),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.blue,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter Name',
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, bottom: 12.0, top: 13.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: _alltestimonialController
                                    .foundtestmonial.isEmpty
                                ? Center(
                                    child: Text("No Job Found"),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _alltestimonialController
                                        .foundtestmonial.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final packageText =
                                          (_alltestimonialController
                                                          .foundtestmonial[
                                                              index]
                                                          .name ==
                                                      null ||
                                                  _alltestimonialController
                                                      .foundtestmonial[index]
                                                      .name!
                                                      .isEmpty)
                                              ? "Not disclose"
                                              : _alltestimonialController
                                                  .foundtestmonial[index].name;
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.02,
                                              vertical: screenHeight * 0.007),
                                          child: Container(
                                            width: screenWidth * 0.97,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(2, 2),
                                                    blurRadius: 8,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.16),
                                                  )
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height:
                                                              textfieldHeight *
                                                                  0.4,
                                                          width:
                                                              textfieldWidth *
                                                                  0.23,
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          child: ClipOval(
                                                            clipBehavior:
                                                                Clip.none,
                                                            child:
                                                                Image.network(
                                                              FixedText
                                                                      .imgurltestimonial +
                                                                  _alltestimonialController
                                                                      .foundtestmonial[
                                                                          index]
                                                                      .filePath
                                                                      .toString(),
                                                              fit: BoxFit.fill,
                                                              errorBuilder:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                return ClipOval(
                                                                  child: Image
                                                                      .asset(
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
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            blackHeadingSmall(
                                                                _alltestimonialController
                                                                    .foundtestmonial[
                                                                        index]
                                                                    .name),
                                                            greyTextSmall(
                                                                _alltestimonialController
                                                                    .foundtestmonial[
                                                                        index]
                                                                    .designation)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(
                                                        thickness: 1,
                                                        color: Colors.grey),
                                                    SizedBox(height: 2),
                                                    Container(
                                                      // height: imageHeight * 0.9,
                                                      //width: imageWidth * 13,
                                                      child: greyTextSmall2(stripHtmlTags(
                                                          _alltestimonialController
                                                                  .foundtestmonial[
                                                                      index]
                                                                  .paragraph ??
                                                              " Not Avalable")),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
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
