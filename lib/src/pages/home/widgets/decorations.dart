import 'package:flutter/material.dart';
import 'package:kids/src/utils/colors.dart';

BoxDecoration buildBoxDecorationAppBar() {
  return BoxDecoration(
      gradient: LinearGradient(
          colors: appBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight));
}
BoxDecoration buildBoxDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight));
}
InputDecoration inputDecoration(double width) {
  return InputDecoration(
    fillColor: white,
    filled: true,
    hintText: 'Search in shemach',
    prefixIcon: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
    ),
    suffixIcon: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.camera_alt_sharp,
        color: grey,
      ),
    ),
    contentPadding:
    EdgeInsets.symmetric(horizontal: width * 0.03),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: grey)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: grey)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: grey)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: grey)),
  );
}

