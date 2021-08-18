import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    Key? key,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.hintStyle,
    this.prefix,
    this.prefixIcon,
    this.suffix,
  }) : super(key: key);

  final String? hintText;
  TextInputType? keyboardType = TextInputType.multiline;
  int? maxLines;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      cursorColor: Colors.grey[700],
      cursorHeight: 24.0,
      cursorRadius: Radius.circular(10.0),
      cursorWidth: 1.5,
      textCapitalization: TextCapitalization.words,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffix: suffix,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: InputBorder.none,
      ),
    );
  }
}
