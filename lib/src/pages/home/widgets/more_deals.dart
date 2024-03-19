import 'package:flutter/material.dart';
import 'package:kids/src/utils/colors.dart';

Container otherDealsGridOffer(double width, double height, TextTheme textTheme,String title,String textBtnName,List pic, String? Function(int x) function) {
  return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          GridView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        // color: teal,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyShade3),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/offersNsponcered/${pic[index]}'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Text(
                      '${function(index)}',
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              );
            },
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                textBtnName,
                style: textTheme.bodySmall!.copyWith(color: teal),
              ))
        ],
      ));
}
