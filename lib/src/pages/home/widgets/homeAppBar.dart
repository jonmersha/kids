import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/src/utils/colors.dart';
import 'package:kids/src/pages/home/widgets/decorations.dart';

PreferredSize homePageAppBar(double width, double height) {
  return PreferredSize(
    preferredSize: Size(width * 1, height * 0.29),
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.015),
      decoration: buildBoxDecorationAppBar(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width * 0.81,
              child: TextField(
                onTap: () {
                  log('Redirecting you to search product screen');
                },
                cursorColor: black,
                decoration: inputDecoration(width),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  color: Colors.black,
                ))
          ]),
    ),
  );
}



