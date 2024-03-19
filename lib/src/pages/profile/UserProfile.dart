import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kids/src/constants/common_functions.dart';
import 'package:kids/src/constants/constants.dart';
import 'package:kids/src/utils/colors.dart';
import 'package:kids/src/pages/profile/widgets/app_bar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: userAppBar(width, height),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          width: width,
         // height: height,
          child: Column(
            children: [
              blankSpace(),
              userGreetings(textTheme),
              blankSpace(),
              gridViewForUserAction(),
              blankSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Order',
                    style: textTheme.displayMedium,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: textTheme.displayMedium!.copyWith(color: teal),
                      ))
                ],
              ),
              blankSpace(),
              productList(height, width,cloth,'assets/images/offersNsponcered/'),
              Row(children: [
                 Text('Keep Shopping',style: textTheme.displaySmall!.copyWith(color: black,fontWeight: FontWeight.w600),),
                const Spacer(),
                TextButton(onPressed: (){}, child: Text('Edit',style: textTheme.labelLarge!.copyWith(color: teal,fontWeight: FontWeight.w600),)),
                Text('|',style: textTheme.displayLarge!.copyWith(color: grey),),
                TextButton(onPressed: (){}, child: Text('History',style: textTheme.labelLarge!.copyWith(color: teal,fontWeight: FontWeight.w600),)),
               // Text('Keep Shoping for'),
              ],),
              mainDvider(),
              gridViewPendingList(),
              blankSpace(),
              mainDvider(),
              blankSpace(),
              Row(children: [
                Text('Buy again',style: textTheme.displaySmall!.copyWith(color: black,fontWeight: FontWeight.w600),),
                TextButton(onPressed: (){}, child: Text('See all',style: textTheme.labelLarge!.copyWith(color: teal),))
              ]),
              productList(height, width,dealsOfTheDay,'assets/images/todays_deals/'),

            ],
          ),
        ),
      ),
    ));
  }

  GridView gridViewPendingList() {
    return GridView.builder(
                itemCount: dealsOfTheDay.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage('assets/images/todays_deals/${dealsOfTheDay[index]}'),fit: BoxFit.cover)


                    ),

                    ),
                  ),
                  const Text('placeholders'),
                ],
              );
            });
  }

  SizedBox productList(double height, double width,List productList,String path) {
    return SizedBox(
            height: height * 0.23,
            child: ListView.builder(
                itemCount: cloth.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.5,
                    height: height * 0.23,

                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('$path${productList[index]}'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: greyShade3, width: 2)),
                  );
                }),
          );
  }

  GridView gridViewForUserAction() {
    return GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              log('Index $index');
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: greyShade1,
                border: Border.all(color: greyShade3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: getText(index),
            ),
          );
        });
  }

  Text getText(int index) {
    if (index == 0) return const Text('Your Order');
    if (index == 1) return const Text('Buy Again');
    if (index == 2) return const Text('Your Account');
    return const Text('Your Wish List');
  }

  Row userGreetings(TextTheme textTheme) {
    return Row(
      children: [
        //  RichText(text: (children: [Text(text: "Hello")]))
        Text(
          'Hello,',
          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          'Nardos',
          style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 30,
          child: Icon(Icons.person),
        )
      ],
    );
  }
}
