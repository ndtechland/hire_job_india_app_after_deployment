import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hirejobindia/modules/components/styles.dart';
import 'package:hirejobindia/widget/text_btn.dart';

import 'login.dart';

class SliderScreen extends StatefulWidget {
  static const String id = 'SliderScreen';

  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  List<Item> imgList = <Item>[
    const Item('lib/assets/images/s11.jpg', 'SEARCH YOUR JOBS',
        'If you\'re looking for a part-time or full time job, hire job india in your app.'),
    const Item('lib/assets/images/s13.jpg', 'APPLY YOUR JOB',
        'If you\'re looking for a part-time or full time job, hire job india in your app.'),
    const Item('lib/assets/images/s10.jpg', 'READY TO WORK WITH US!',
        'If you\'re looking for a part-time or full time job, hire job india in your app.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              var screenWidth = constraints.maxWidth;
              var screenHeight = constraints.maxHeight;

              var imageWidth1 = orientation == Orientation.portrait
                  ? screenWidth * 0.75
                  : screenWidth * 0.5;
              var imageHeight1 = orientation == Orientation.portrait
                  ? screenHeight * 0.6
                  : screenHeight * 0.55;
              var imageWidth2 = orientation == Orientation.portrait
                  ? screenWidth * 0.75
                  : screenWidth * 0.55;
              var imageHeight2 = orientation == Orientation.portrait
                  ? screenHeight * 0.6
                  : screenHeight * 0.8;
              var textfieldWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.83
                  : screenWidth * 0.45;
              var textfieldHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.2
                  : screenHeight * 0.45;
              double height = MediaQuery.of(context).size.height;

              double imageWidth = MediaQuery.of(context).size.width * 0.4;
              double imageHeight = orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height *
                      0.5 // Portrait mode image height
                  : MediaQuery.of(context).size.width *
                      0.5; // Landscape mode image height

              double textPaddingHorizontal =
                  MediaQuery.of(context).size.width * 0.1;

              // Calculate responsive font sizes
              double headingFontSize = orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height *
                      0.06 // Portrait mode image height
                  : MediaQuery.of(context).size.width * 0.07;
              double textFontSize = orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height *
                      0.026 // Portrait mode image height
                  : MediaQuery.of(context).size.width * 0.03;
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _itemCarousel(
                          height,
                          imageWidth1,
                          imageHeight1,
                          textPaddingHorizontal,
                          headingFontSize,
                          textFontSize,
                          imageWidth2,
                          imageHeight2),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Widget _buildBody(BoxConstraints constraints, Orientation orientation) {
  //   double height = orientation == Orientation.portrait
  //       ? constraints.maxHeight * 0.8
  //       : constraints.maxHeight * 0.6; // Adjusted height for landscape mode
  //
  //   double imageWidth = MediaQuery.of(context).size.width * 0.4;
  //   double imageHeight = orientation == Orientation.portrait
  //       ? MediaQuery.of(context).size.height * 0.5 // Portrait mode image height
  //       : MediaQuery.of(context).size.width *
  //           0.5; // Landscape mode image height
  //
  //   double textPaddingHorizontal = MediaQuery.of(context).size.width * 0.1;
  //
  //   // Calculate responsive font sizes
  //   double headingFontSize = MediaQuery.of(context).size.width * 0.06;
  //   double textFontSize = MediaQuery.of(context).size.width * 0.04;
  //
  //   return SingleChildScrollView(
  //     child: SizedBox(
  //       width: double.infinity,
  //       height: constraints.maxHeight,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           _itemCarousel(height, imageWidth, imageHeight,
  //               textPaddingHorizontal, headingFontSize, textFontSize),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _itemCarousel(
    double height,
    double imageWidth1,
    double imageHeight1,
    double textPaddingHorizontal,
    double headingFontSize,
    double textFontSize,
    double imageWidth2,
    double imageHeight2,
  ) {
    return Builder(
      builder: (context) {
        return Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: height * 0.92,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: imgList
                  .map((e) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'lib/assets/logo/hirelogo108.jpg',
                              width: imageWidth1 * 0.8,
                              height: imageHeight1 * 0.55,
                            ),
                            // logoImg(),
                            Image.asset(
                              e.img,
                              fit: BoxFit.contain,
                              width: imageHeight2 * 0.9,
                              height: imageHeight1 * 0.63,
                            ),
                            SizedBox(height: imageHeight1 * 0.1),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: textPaddingHorizontal),
                              child: centerHeading(
                                  e.detail, headingFontSize * 0.4),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: textPaddingHorizontal),
                              child: centerText(e.text, textFontSize * 0.7),
                            ),
                            SizedBox(height: imageHeight1 * 0.1),
                          ],
                        ),
                      ))
                  .toList(),
              carouselController: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextButton(
                  onPressed: () {},
                  text: '',
                  colors: Colors.black54,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : appColor)
                              .withOpacity(_current == entry.key ? 0.8 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                MyTextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  text: 'SKIP',
                  colors: appColor,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget logoImg() {
    return Image.asset(
      'lib/assets/logo/hirelogo108.jpg',
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.2,
    );
  }

  Widget centerHeading(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget centerText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class Item {
  const Item(this.img, this.detail, this.text);
  final String img;
  final String detail;
  final String text;
}
