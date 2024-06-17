import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final String text;
  final Color colors;

  const MyTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.colors,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 22,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
              color: colors,
              fontFamily: 'medium',
              fontSize: 14,
            )),
      ),
    );
  }
}
