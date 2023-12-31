// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:musico/constants/colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;

  CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.visible,
      text ?? '',
      style: TextStyle(
        color: color ?? whiteColor,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
