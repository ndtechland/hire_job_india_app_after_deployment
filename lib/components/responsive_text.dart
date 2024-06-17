import 'package:flutter/material.dart';

Text responsiveText({
  required BuildContext context,
  required String text,
  double? fontSizePortrait,
  double? fontSizeLandscape,
  Color color = Colors.black,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      height: 1.4,
      fontSize: MediaQuery.of(context).orientation == Orientation.portrait
          ? fontSizePortrait ?? 24
          : fontSizeLandscape ?? 20,
      fontFamily: 'medium',
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 0.2,
    ),
  );
}

Text responsiveText2({
  required BuildContext context,
  required String text,
  double? fontSizePortrait,
  double? fontSizeLandscape,
  Color color = Colors.grey,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    maxLines: 1,
    style: TextStyle(
      height: 1.4,
      fontSize: MediaQuery.of(context).orientation == Orientation.portrait
          ? fontSizePortrait ?? 24
          : fontSizeLandscape ?? 20,
      fontFamily: 'medium',
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 0.2,
    ),
  );
}

Container responsiveContainer({
  required BuildContext context,
  String? text,
  double? fontSizePortrait,
  double? fontSizeLandscape,
  Color color = Colors.black,
  Widget? child,
  double? heightPortrait, // Optional height in portrait mode
  double? widthPortrait, // Optional width in portrait mode
  double? heightLandscape, // Optional height in landscape mode
  double? widthLandscape, // Optional width in landscape mode
}) {
  return Container(
    height: MediaQuery.of(context).orientation == Orientation.portrait
        ? heightPortrait ??
            MediaQuery.of(context).size.height *
                0.2 // Default height for portrait mode
        : heightLandscape ??
            MediaQuery.of(context).size.height *
                0.3, // Default height for landscape mode
    width: MediaQuery.of(context).orientation == Orientation.portrait
        ? widthPortrait ??
            MediaQuery.of(context).size.width *
                0.3 // Default width for portrait mode
        : widthLandscape ??
            MediaQuery.of(context).size.width *
                0.2, // Default width for landscape mode
    child: child ??
        (text != null
            ? responsiveText(
                context: context,
                text: text,
                fontSizePortrait: fontSizePortrait,
                fontSizeLandscape: fontSizeLandscape,
                color: color,
              )
            : null),
  );
}

///
Container responsiveContainer2({
  required BuildContext context,
  String? text,
  double? fontSizePortrait,
  double? fontSizeLandscape,
  Color color = Colors.black,
  Widget? child,
  double? heightPortrait, // Optional height in portrait mode
  double? widthPortrait, // Optional width in portrait mode
  double? heightLandscape, // Optional height in landscape mode
  double? widthLandscape, // Optional width in landscape mode
}) {
  return Container(
    height: MediaQuery.of(context).orientation == Orientation.portrait
        ? heightPortrait ??
            MediaQuery.of(context).size.height *
                0.2 // Default height for portrait mode
        : heightLandscape ??
            MediaQuery.of(context).size.height *
                0.3, // Default height for landscape mode
    width: MediaQuery.of(context).orientation == Orientation.portrait
        ? widthPortrait ??
            MediaQuery.of(context).size.width *
                0.3 // Default width for portrait mode
        : widthLandscape ??
            MediaQuery.of(context).size.width *
                0.2, // Default width for landscape mode
    child: child ??
        (text != null
            ? responsiveText(
                context: context,
                text: text,
                fontSizePortrait: fontSizePortrait,
                fontSizeLandscape: fontSizeLandscape,
                color: color,
              )
            : null),
    //decoration: BoxDecoration(border: Border.all(color: appColor)),
  );
}

// Example usage of the responsive text widget
class MyWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            responsiveText(
              context: context,
              text: "Hello World!",
              fontSizePortrait: 24,
              fontSizeLandscape: 20,
            ),
            responsiveContainer(
              context: context,
              text: "This is a responsive container",
              fontSizePortrait: 14,
              fontSizeLandscape: 12,
            ),
            responsiveContainer(
              context: context,
              text: "This container has a child widget",
              child: Icon(
                Icons.star,
                size: 30,
                color: Colors.yellow,
              ),
            ),
            responsiveContainer(
              context: context,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Click Me'),
              ),
            ),
            // Add more responsive text widgets as needed
          ],
        ),
      ),
    );
  }
}
