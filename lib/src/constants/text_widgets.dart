import 'package:flutter/material.dart';

Text textDisplaySmall({
  required TextTheme textTheme,
  required String text,
  Color color=Colors.black
}) {
  return Text(
    text,
    style: textTheme.displaySmall!.copyWith(
      fontWeight: FontWeight.w600,
      color: color
    ),
  );
}

Text textBodyLarge({required TextTheme textTheme,
  required String text}) {
  return Text(
    text,
    style: textTheme.bodyLarge
  );
}

Text textDisplayMedium({required TextTheme textTheme,
  required String text}) {
  return Text(
    text,
    style: textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.w600,
    ),
  );
}

Text textDisplayLarge(
    {
      required TextTheme textTheme,
      required String text}
    ) {
  return Text(
    text,
    style: textTheme.displayLarge!.copyWith(
      fontWeight: FontWeight.w600,
    ),
  );
}