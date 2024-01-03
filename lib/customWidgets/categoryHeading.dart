// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/text.dart';

class CategoryHeading extends StatelessWidget {
  String categoryTitle, subTitle;

  CategoryHeading({
    Key? key,
    required this.categoryTitle,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: categoryTitle,
          fontSize: 20,
          color: categoriesColor,
          fontWeight: FontWeight.w600,
        ).marginOnly(top: 1),
        CustomText(
          text: subTitle,
          fontSize: 20,
          color: categoriesColor,
        )
      ],
    );
  }
}
