import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kids/src/utils/colors.dart';
Widget sectionHeader(double width, double height, TextTheme textTheme,
    BuildContext context, String sectionTitle, Widget routeTo) {
  return Container(
    color: Colors.grey.shade200,
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$sectionTitle',
          style: textTheme.displaySmall!
              .copyWith(fontWeight: FontWeight.w600, color: black),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => routeTo,
              ),
            );
          },
          child: Icon(Icons.play_arrow_outlined,size: 40,)
        ),
      ],
    ),
  );
}
