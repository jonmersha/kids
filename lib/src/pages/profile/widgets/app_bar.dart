
import 'package:flutter/material.dart';
import 'package:kids/src/utils/colors.dart';
import 'package:kids/src/pages/home/widgets/decorations.dart';

PreferredSize userAppBar(double width, double height) {
  return PreferredSize(
    preferredSize: Size(width * 1, height * 0.29),
    child: Container(
      width: width,
      height: height*0.08,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.015),
      decoration: buildBoxDecorationAppBar(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/logos.png',color: black,),
            const Spacer(),
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))
          ]),
    ),
  );
}
