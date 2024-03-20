import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/src/constants/app_bar.dart';
import 'package:kids/src/constants/common_functions.dart';
import 'package:kids/src/utils/colors.dart';
import 'package:kids/src/pages/home/widgets/decorations.dart';
import 'package:kids/src/pages/profile/widgets/app_bar.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(width, height),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          height: double.infinity,
          decoration: buildBoxDecorationAppBar(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                    itemCount: 18,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: .7),
                    shrinkWrap: true,
                    physics: const PageScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          log('Index $index');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: greyShade3),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icon.png'))),
                          child: Text(getText(index)),
                        ),
                      );
                    }),
                // blankSpace(),
                // Container(
                //   height: 50,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10)),
                // ),
                // blankSpace(),
                // Container(
                //   height: 50,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10)),
                // ),
                // blankSpace(height: 100),
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment,
                //   children: [
                //     Expanded(
                //         child: Container(
                //       height: height * 0.08,
                //       alignment: Alignment.center,
                //       margin: EdgeInsets.symmetric(horizontal: 5),
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text("Order"),
                //     )),
                //     Expanded(
                //         child: Container(
                //       height: height * 0.08,
                //       alignment: Alignment.center,
                //       margin: EdgeInsets.symmetric(horizontal: 5),
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text("Buy Again"),
                //     )),
                //     Expanded(
                //         child: Container(
                //       height: height * 0.08,
                //       alignment: Alignment.center,
                //       margin: EdgeInsets.symmetric(horizontal: 5),
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text("Account"),
                //     )),
                //     Expanded(
                //         child: Container(
                //       height: height * 0.08,
                //       alignment: Alignment.center,
                //       margin: EdgeInsets.symmetric(horizontal: 5),
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text("List"),
                //     )),
                //   ],
                // ),
                // blankSpace(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getText(int index) {
    return 'Deal';
  }
}
