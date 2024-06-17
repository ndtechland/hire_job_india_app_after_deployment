import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirejobindia/components/styles.dart';

import 'app_colorss/app_colorss.dart';

class ReusableCustomDialog extends StatelessWidget {
  final String titleText;
  final double? titleFontSize;
  final String cancelText;
  final String submitText;
  final String submitText2;

  final VoidCallback onCancelPressed;
  final VoidCallback onSubmitPressed;
  final VoidCallback onSubmit2Pressed;

  final Color? titleColor;
  final Color? contentColor;
  final Color? cancelTextColor;
  final Color? submitTextColor;
  final String? additionalText1;
  final String? additionalText2;
  final String? additionalText3;

  final Color? additionalTextColor1;
  final Color? additionalTextColor2;
  final Color? additionalTextColor3;

  final Color? additionalContainerColor1;
  final Color? additionalContainerColor2;
  final Color? additionalContainerColor3;

  final VoidCallback? additionalText1OnTap;
  final VoidCallback? additionalText2OnTap;
  final VoidCallback? additionalText3OnTap;

  ReusableCustomDialog({
    required this.titleText,
    this.titleFontSize,
    required this.cancelText,
    required this.submitText,
    required this.submitText2,
    required this.onCancelPressed,
    required this.onSubmitPressed,
    required this.onSubmit2Pressed,
    this.titleColor,
    this.contentColor,
    this.cancelTextColor,
    this.submitTextColor,
    this.additionalText1,
    this.additionalText2,
    this.additionalText3,
    this.additionalTextColor1,
    this.additionalTextColor2,
    this.additionalTextColor3,
    this.additionalContainerColor1,
    this.additionalContainerColor2,
    this.additionalContainerColor3,
    this.additionalText1OnTap,
    this.additionalText2OnTap,
    this.additionalText3OnTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoAlertDialog(
      title: Container(
        padding: EdgeInsets.only(top: size.height * 0.0),
        color: AppColors.a14,
        child: Text(
          titleText,
          style: GoogleFonts.poppins(
            fontSize: titleFontSize ?? size.height * 0.019,
            fontWeight: FontWeight.w600,
            color: titleColor ?? Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                if (additionalText1 != null)
                  _buildAdditionalTextContainer(
                    additionalText: additionalText1!,
                    textColor: additionalTextColor1,
                    containerColor: additionalContainerColor1,
                    size: size,
                    onTap: additionalText1OnTap,
                  ),
                if (additionalText2 != null)
                  _buildAdditionalTextContainer(
                    additionalText: additionalText2!,
                    textColor: additionalTextColor2,
                    containerColor: additionalContainerColor2,
                    size: size,
                    onTap: additionalText2OnTap,
                  ),
                if (additionalText3 != null)
                  _buildAdditionalTextContainer(
                    additionalText: additionalText3!,
                    textColor: additionalTextColor3,
                    containerColor: additionalContainerColor3,
                    size: size,
                    onTap: additionalText3OnTap,
                  ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            cancelText,
            style: GoogleFonts.poppins(
              fontSize: size.height * 0.018,
              fontWeight: FontWeight.w600,
              color: cancelTextColor ?? appColor,
            ),
          ),
          onPressed: onCancelPressed,
        ),
        CupertinoDialogAction(
          child: Text(
            submitText,
            style: GoogleFonts.poppins(
              fontSize: size.height * 0.018,
              fontWeight: FontWeight.w600,
              color: submitTextColor ?? appColor2,
            ),
          ),
          onPressed: onSubmitPressed,
        ),
        CupertinoDialogAction(
          child: Text(
            submitText2,
            style: GoogleFonts.poppins(
              fontSize: size.height * 0.018,
              fontWeight: FontWeight.w600,
              color: submitTextColor ?? logoColor,
            ),
          ),
          onPressed: onSubmit2Pressed,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cancel,
                color: Colors.red,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalTextContainer({
    required String additionalText,
    Color? textColor,
    Color? containerColor,
    VoidCallback? onTap,
    required Size size,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: containerColor ?? Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          additionalText,
          style: GoogleFonts.poppins(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: size.height * 0.016,
          ),
        ),
      ),
    );
  }
}
