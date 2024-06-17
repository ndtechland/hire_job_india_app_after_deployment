import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/constants/static_text.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/company_controllers/company_controller.dart';
import '../../../controllers/company_detail_by_com_id/company_detail_by_id_controller.dart';
import 'chat.dart';
import 'company_detail.dart';

class Company extends StatelessWidget {
  static const String id = 'Company';

  final RxBool isLoading = false.obs;

  Company({Key? key}) : super(key: key);

  List<Item> companyList = <Item>[
    const Item('lib/assets/images/n3.png', 'Prince Tech'),
    const Item('lib/assets/images/n2.png', 'Global Info'),
    const Item('lib/assets/images/n1.png', 'Monarch IT'),
    const Item('lib/assets/images/n4.png', 'Prince PVT. LTD.'),
    const Item('lib/assets/images/n3.png', 'Rammurthi Tech'),
    const Item('lib/assets/images/n2.png', 'Fcc Info'),
    const Item('lib/assets/images/n1.png', 'Monar IT'),
    const Item('lib/assets/images/n4.png', 'Soft PVT. LTD.'),
  ];

  AllcompanyController _allcompanyController = Get.find();
  CompanyDetailController _companyDetailController = Get.find();
  bool _isLoading = false; // State variable to control loading indicator

  void _startDelayedAction(BuildContext context) {
    // Simulate delayed action
    Future.delayed(Duration(milliseconds: 400), () {
      print('Delayed action after 1 second');

      // Navigate to CompanyDetail after delay
      Get.to(CompanyDetail());

      // Alternatively, if using Navigator.push:
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CompanyDetail(),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      //drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Companies'),
        centerTitle: true,
        titleSpacing: 0,
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        // ],
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
            () => (_allcompanyController.isLoading.value || isLoading.value)
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
                                _allcompanyController.filterCaompany(value),
                            autofocus: false,
                            style: TextStyle(fontSize: 15.0, color: appColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: appColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Company Name',
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
                        child: _allcompanyController.foundcompany.isEmpty
                            ? Center(
                                child: Text("No Company Found"),
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
                                  itemCount:
                                      _allcompanyController.foundcompany.length,
                                  itemBuilder: (context, index) {
                                    final category = _allcompanyController
                                        .foundcompany[index];
                                    if (category == null) return Container();
                                    return GestureDetector(
                                      onTap: () {
                                        _allcompanyController.companyListApi();
                                        _allcompanyController.update();

                                        // _companyDetailController.companydetailbyIdApi(
                                        //     category.id
                                        // );
                                        _companyDetailController
                                            .companydetailbyIdApi(
                                                _allcompanyController
                                                    .foundcompany[index].id
                                                    ?.toInt());
                                        _companyDetailController.update();

                                        // Delay execution for 2 seconds
                                        Future.delayed(
                                            Duration(milliseconds: 00), () {
                                          _startDelayedAction(context);
                                          print(
                                              'Delayed action after 2 seconds');
                                          // Get.to(CompanyDetail());
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         CompanyDetail(),
                                          //   ),
                                          // );
                                          // Add your code here that you want to execute after the delay
                                        });
                                        // Future.delayed(Duration(seconds: 2),
                                        //     () {
                                        //
                                        //   print(
                                        //       'Delayed action after 2 seconds');
                                        //   Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           CompanyDetail(),
                                        //     ),
                                        //   );
                                        //   // Add your code here that you want to execute after the delay
                                        // });
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
                                                child: category?.companyImage !=
                                                        null
                                                    ? Image.network(
                                                        FixedText.imgurl +
                                                            category
                                                                .companyImage
                                                                .toString(),
                                                        //color: appColor,
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
                                                  "${category?.organizationName ?? 'Unknown Company'}",
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: backgroundColor,
//         drawer: const NavBar(),
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.white),
//           title: const Text('Company'),
//           centerTitle: true,
//           titleSpacing: 0,
//           actions: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
//           ],
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: <Color>[appColor2, appColor]),
//             ),
//           ),
//           elevation: 0,
//         ),
//         body: _buildBody());
//   }
//
//   Widget _buildBody() {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       child: GridView.count(
//         crossAxisCount: 3,
//         crossAxisSpacing: 12.0,
//         mainAxisSpacing: 12.0,
//         shrinkWrap: true,
//         children: companyList.map((e) {
//           return _buildCompany(context, e);
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _buildCompany(context, e) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const CompanyDetail()));
//       },
//       child: Container(
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 0),
//                   blurRadius: 1,
//                   color: Color.fromRGBO(0, 0, 0, 0.16),
//                 )
//               ],
//               borderRadius: BorderRadius.all(Radius.circular(6))),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 e.img,
//                 width: 30,
//                 height: 30,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(height: 4),
//               boldText2(e.name),
//               const SizedBox(height: 5),
//               greyTextSmall('(150 jobs)')
//             ],
//           )),
//     );
//   }
// }
//
// class Item {
//   const Item(this.img, this.name);
//   final String img;
//   final String name;
// }
