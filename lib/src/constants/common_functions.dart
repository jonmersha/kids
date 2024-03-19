import 'package:flutter/material.dart';
import 'package:kids/src/utils/colors.dart';

SizedBox blankSpace({double width = 10, double height = 10}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

Container hDivider(double width) {
  return Container(
    width: width * 0.99,
    height: 2,
    decoration:
        BoxDecoration(gradient: LinearGradient(colors: [white, grey, white])),
  );
}

Divider mainDvider() {
  return Divider(
    thickness: 3,
    color: greyShade3,
    height: 0,
  );
}
