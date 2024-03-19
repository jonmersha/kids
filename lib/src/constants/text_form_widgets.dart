import 'package:flutter/material.dart';
import 'package:kids/src/utils/colors.dart';

SizedBox textForm(
    {
      required double height,
      required double width,
      required TextTheme textTheme,
      required TextEditingController mobileController,
      String hint="hint text",
      bool isPassword=false}) {
  return SizedBox(
    height: height,//height * 0.06,
    width: width ,//width * 0.95,
    child: TextFormField(
      controller: mobileController,
      cursorColor: black,
      obscureText: isPassword,
      style: textTheme.bodyMedium!
          .copyWith(fontWeight: FontWeight.w500),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: hint,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
            const BorderSide(color: secondaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: grey),
          )),
    ),
  );
}
