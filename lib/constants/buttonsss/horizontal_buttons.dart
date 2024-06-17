import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirejobindia/components/styles.dart';

import '../app_colorss/app_colorss.dart';

class HorizontalButton extends StatefulWidget {
  final String text;
  final Function()? onClick; // Make the onClick function nullable
  final double? height;
  final double? width;

  const HorizontalButton({
    Key? key,
    required this.text,
    required this.onClick,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  _HorizontalButtonState createState() => _HorizontalButtonState();
}

class _HorizontalButtonState extends State<HorizontalButton> {
  static double _shadowHeight = 1;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final double _height = 42 - _shadowHeight;
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          _position = 4;
        });
        if (widget.onClick != null) widget.onClick!();
      },
      onTapDown: (_) {
        setState(() {
          _position = 0;
        });
      },
      onTapCancel: () {
        setState(() {
          _position = 3;
        });
      },
      child: Container(
        height: _height + _shadowHeight,
        width: size.width * 0.31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(-0.0, -0.0),
              blurRadius: 1,
            ),
            BoxShadow(
              color: appColor2,
              offset: Offset(0.0, 0.0),
              blurRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.bounceIn,
                bottom: _position,
                duration: Duration(milliseconds: 60),
                child: Container(
                  height: _height,
                  width: size.width * 0.22,

                  //width: 200,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.p3)),
                  child: Center(
                    child: Text(
                      widget.text ?? 'Click me!',
                      style: GoogleFonts.roboto(
                        //fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,

                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 0.0,
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
