import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hirejobindia/modules/all_pages/pages/welcome.dart';
import 'package:hirejobindia/modules/components/styles.dart';
import 'package:hirejobindia/widget/text_btn.dart';

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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _itemCarausl(),
        ],
      ),
    );
  }

  Widget _itemCarausl() {
    return Builder(
      builder: (context) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .9,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                // autoPlay: true,
              ),
              items: imgList
                  .map((e) => Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          logoImg(),
                          Image.asset(
                            e.img,
                            fit: BoxFit.fitHeight,
                            height: MediaQuery.of(context).size.width * .9,
                          ),
                          const SizedBox(height: 0),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: centerHeading(e.detail),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: centerText(e.text),
                          ),
                        ],
                      )))
                  .toList(),
              carouselController: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextButton(
                    onPressed: () {},
                    text: '',
                    //'SKIP',
                    colors: Colors.black54),
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
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : appColor)
                                    .withOpacity(
                                        _current == entry.key ? 0.8 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                MyTextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                //ViewJobs()
                                Welcome(),
                          ));
                    },
                    text: 'SKIP',
                    //'NEXT',
                    colors: appColor)
              ],
            )
          ],
        );
      },
    );
  }

  logoImg() {
    return Image.asset(
      'lib/assets/logo/hirelogo108.jpg',
      //'lib/assets/logo/logo4.jpg',
      //'lib/assets/images/job.png',
      width: 200,
      height: 200,
    );
  }
}

class Item {
  const Item(
    this.img,
    this.detail,
    this.text,
  );
  final String img;
  final String detail;
  final String text;
}
