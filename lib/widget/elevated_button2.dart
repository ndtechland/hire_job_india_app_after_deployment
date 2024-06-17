import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double elevation;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.elevation = 2.0,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      color: backgroundColor,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontFamily: 'Medium',
                  fontSize: 12.0,
                  height: 1.2,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
