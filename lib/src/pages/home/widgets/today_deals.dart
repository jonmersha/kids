import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kids/src/constants/common_functions.dart';
import 'package:kids/src/constants/constants.dart';
import 'package:kids/src/pages/vidoe_list.dart';
import 'package:kids/src/utils/colors.dart';
import 'package:kids/src/pages/home/widgets/slider.dart';

Widget todayDeals(
    double width, double height, TextTheme textTheme, BuildContext context,) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'New videos | Top 10',
        style: textTheme.displaySmall!
            .copyWith(fontWeight: FontWeight.w600, color: black),
      ),
      InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => VideoListView(),
            ),
          );
        },
        child: Text(
          'See All . . . ',
          style: textTheme.displaySmall!
              .copyWith(fontWeight: FontWeight.w600, color: black),
        ),
      ),
    ],
  );
}
