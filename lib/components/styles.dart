import 'package:flutter/material.dart';

const appColor = Color(0xFF6F67FE);
const appColor2 = Color(0xFF214683
    // 0xFFB446FF
    );
const linkedinColor = Color(0xFF0077B5);
const logoColor = Color(0xFF214683);
const logocolorlite = Color(0xff657EA9);
const logocolorred = Color(0xff5A1313);

//5A1313

//214683

const backgroundColor = Color.fromARGB(255, 243, 243, 243);

centerHeading(val) {
  return Text(
    val,
    textAlign: TextAlign.center,
    style: const TextStyle(
        height: 1.4,
        fontSize: 24,
        fontFamily: 'medium',
        color: Colors.black,
        letterSpacing: 1),
  );
}

centerText(val) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(
      val,
      textAlign: TextAlign.center,
      style: const TextStyle(height: 1.5, fontSize: 14, color: Colors.black),
    ),
  );
}

btnText(val) {
  return Text(
    val.toUpperCase(),
    style: const TextStyle(
        fontSize: 12, fontFamily: 'medium', color: Colors.white),
  );
}

smallText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 12, color: Colors.black),
  );
}

blackHeading(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 18, fontFamily: 'medium', color: Colors.black),
  );
}

blackHeadingSmall(val) {
  return Container(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(
      val,
      style: const TextStyle(
          fontSize: 13, fontFamily: 'medium', color: Colors.black),
    ),
  );
}

boldText(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 12, fontFamily: 'medium', color: Colors.black),
  );
}

boldTextcat(val) {
  return SizedBox(
    width: 65,
    height: 24,
    child: Center(
      child: Text(
        val,
        style: const TextStyle(
            fontSize: 10, fontFamily: 'medium', color: Colors.black),
      ),
    ),
  );
}

boldText2(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 12, fontFamily: 'medium', color: Colors.black),
  );
}

reviewText(val) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Text(
      val,
      style: const TextStyle(
          fontSize: 14, fontFamily: 'medium', color: Colors.black),
    ),
  );
}

blackText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 14, color: Colors.black),
  );
}

greyText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 14, color: Colors.black54),
  );
}

greyTextSmall(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 12, color: Colors.black54),
  );
}

greyTextSmall2(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 10, color: Colors.black54),
  );
}

greyTextSmall3(String val) {
  return Text(
    val,
    style: TextStyle(
      fontSize: 10,
      color: Colors.black54,
    ),
    maxLines: 6,
    overflow: TextOverflow
        .ellipsis, // This will add "..." if the text exceeds the maximum lines
  );
}

greyTextSmall4(String val) {
  return Text(
    val,
    style: TextStyle(
      fontSize: 11,
      color: Colors.black54,
    ),
    maxLines: 3,
    overflow: TextOverflow
        .ellipsis, // This will add "..." if the text exceeds the maximum lines
  );
}
// greyTextSmall3(stripHtmlTags(
//testgimonial?.paragraph ?? 'Not Found'))

TextSmallbold(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 11, color: appColor, fontWeight: FontWeight.w700),
  );
}

TextSmalllocation(val) {
  return Text(
    val,
    style: const TextStyle(
        fontSize: 10, color: Colors.black54, fontWeight: FontWeight.w600),
  );
}

appcolorText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 14, color: appColor, fontFamily: 'medium'),
  );
}

Container textField2({
  String? hint,
  IconData? suffixIcon,
  TextEditingController? controller,
  String? Function(String?)? validator,
  IconData? prefixIcon,
  FocusNode? focusNode, // Added FocusNode
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      focusNode: focusNode, // Use FocusNode
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: hint,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                size: 23,
                color: Colors.black12,
              )
            : null,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 23,
                color: Colors.black54,
              )
            : null,
        labelStyle: const TextStyle(color: Colors.black54, fontSize: 15),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: appColor),
        ),
      ),
    ),
  );
}

Container textField3({
  String? hint,
  IconData? suffixIcon,
  TextEditingController? controller,
  String? Function(String?)? validator,
  IconData? prefixIcon,
  FocusNode? focusNode, // Added FocusNode
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      focusNode: focusNode, // Use FocusNode
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: hint,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                size: 23,
                color: Colors.black12,
              )
            : null,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 23,
                color: Colors.black54,
              )
            : null,
        labelStyle: const TextStyle(color: Colors.black54, fontSize: 15),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: appColor),
        ),
      ),
    ),
  );
}

///
//
// Container textField2({
//   String? hint,
//   IconData? suffixIcon,
//   TextEditingController? controller,
//   String? Function(String?)? validator,
//   IconData? prefixIcon,
// }) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10),
//     child: TextFormField(
//       controller: controller,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: hint,
//         suffixIcon: suffixIcon != null
//             ? Icon(
//                 suffixIcon,
//                 size: 23,
//                 color: Colors.black12,
//               )
//             : null,
//         prefixIcon: prefixIcon != null
//             ? Icon(
//                 prefixIcon,
//                 size: 23,
//                 color: Colors.black54,
//               )
//             : null,
//         labelStyle: const TextStyle(color: Colors.black54, fontSize: 15),
//         focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: appColor),
//         ),
//       ),
//     ),
//   );
// }

textField(hint, icn) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        labelText: hint,
        suffixIcon: Icon(
          icn,
          size: 23,
          color: Colors.black12,
        ),
        labelStyle: const TextStyle(color: Colors.black54, fontSize: 15),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: appColor),
        ),
      ),
    ),
  );
}

textFieldNo(hint) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextField(
      decoration: InputDecoration(
        labelText: hint,
        hintStyle: (TextStyle(
          fontSize: 13,
        )),
        labelStyle: const TextStyle(color: Colors.black54, fontSize: 13),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: appColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
      ),
    ),
  );
}

class PasswordTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const PasswordTextField({
    Key? key,
    this.hint,
    this.controller,
    this.validator,
    this.focusNode,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.hint,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: _obscureText ? Colors.red : Colors.green,
            ),
            onPressed: _toggleVisibility,
          ),
          labelStyle: const TextStyle(color: Colors.black54, fontSize: 15),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appColor),
          ),
        ),
      ),
    );
  }
}
