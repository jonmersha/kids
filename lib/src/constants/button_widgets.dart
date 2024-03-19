import 'package:flutter/material.dart';
import 'package:kids/src/constants/common_functions.dart';
import 'package:kids/src/utils/colors.dart';

Container custom_radio(
{
  String message1='add tetx1',
  String message2 ="add text2",
required double height,
required double width,
required TextTheme textTheme,
required bool inLogin,
bool inverted=false,
  void Function()? func
}) {
  return Container(
    height: height * 0.06,
    width: width,
    decoration: BoxDecoration(
        border:
        Border(bottom: BorderSide(color: greyShade1))),
    // padding: EdgeInsets.symmetric(horizontal: width * 0.03),
    child: InkWell(
      onTap: func,
      child: Row(children: [
        Container(
          height: height * 0.03,
          width: height * 0.03,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: grey),
              color: white),
          child: Icon(
            Icons.circle,
            size: height * 0.015,
            color: inverted? inLogin? secondaryColor : transparent:!inLogin? secondaryColor : transparent,
          ),
        ),
        blankSpace(width: width * 0.02, height: 0),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$message1. ',
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            TextSpan(
                text: '$message2 ',
                style: textTheme.bodyMedium)
          ]),
        )
      ]),
    ),
  );
}
Container custom_checkbox(
    {
      String message1='add text1',
      String message2 ="add text2",
      required double height,
      required double width,
      required TextTheme textTheme,
      required bool isChecked,
      void Function()? func
    }) {
  return Container(
    height: height * 0.05,
    width: width,
    decoration: BoxDecoration(
        border:
        Border(bottom: BorderSide(color: greyShade1))),
    // padding: EdgeInsets.symmetric(horizontal: width * 0.03),
    child: InkWell(
      onTap: func,
      child: Row(children: [
        Container(
          height: height * 0.04,
          width: height * 0.04,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: secondaryColor,width: 1,),
              color: white,
          borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.check,
            size: height * 0.03,
            color:  isChecked? secondaryColor : greyShade2,
          ),
        ),
        blankSpace(width: width * 0.02, height: 0),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '$message1. ',
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            TextSpan(
                text: '$message2 ',
                style: textTheme.bodyMedium)
          ]),
        )
      ]),
    ),
  );
}

ElevatedButton buildElevatedButton(
    double width,
    double height,
    TextTheme textTheme,
    String label,
     void Function(String )? func,
    String rotePath) {
  return ElevatedButton(
    onPressed: (){func!(rotePath);},
    style: ElevatedButton.styleFrom(
        minimumSize: Size(width * 0.95, height * 0.06),
        backgroundColor: teal),
    child: Text(
      label,
      style: textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w600, color: white),
    ),
  );
}

