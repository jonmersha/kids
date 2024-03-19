import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:kids/src/constants/common_functions.dart';
import 'package:kids/src/constants/constants.dart';
import 'package:kids/src/pages/home/widgets/homeAppBar.dart';
import 'package:kids/src/pages/home/widgets/more_deals.dart';
import 'package:kids/src/pages/home/widgets/product_category.dart';
import 'package:kids/src/pages/home/widgets/slider.dart';
import 'package:kids/src/pages/home/widgets/today_deals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  CarouselController deal_controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    dealsName(int x) {
      switch (x) {
        case 0:
          return 'Boss';
        case 1:
          return 'boAt';
        case 2:
          return 'Sony';
        case 3:
          return 'onePlus';
      }
    }

    clothing(int x) {
      switch (x) {
        case 0:
          return 'T-shirts';
        case 1:
          return 'Tops';
        case 2:
          return 'Kurta';
        case 3:
          return 'All';
      }
    }

    return SafeArea(
      child: Scaffold(
        //appBar: homePageAppBar(width, height),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //homeScreenAddressBar(height, width),
              mainDvider(),
              videoCategory(height, width, textTheme),
              blankSpace(height: height * 0.05),
              mainDvider(),
              homeScreenBanner(
                  height,
                  width),
              mainDvider(),
              blankSpace(height: height * 0.05),

              todayDeals(
                  width,
                  height,
                  textTheme,
                context

              ),
              blankSpace(height: height * 0.05),
              mainDvider(),
              newVideos(height, width),

              // otherDealsGridOffer(
              //     width,
              //     height,
              //     textTheme,
              //     'Latest launches in head phone',
              //     'Explore More',
              //     headPhoneDeals,
              //     dealsName),
             // mainDvider(),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Ensurance',
              //         style: textTheme.displayMedium!
              //             .copyWith(fontWeight: FontWeight.w600),
              //       ),
              //       Container(
              //         height: height * 0.35,
              //         width: width,
              //         decoration: const BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage(
              //                     'assets/images/offersNsponcered/insurance.png'),
              //                 fit: BoxFit.fill)),
              //       ),
              //     ],
              //   ),
              // ),
             // mainDvider(),
              // otherDealsGridOffer(
              //   width,
              //   height,
              //   textTheme,
              //   'Minimum 70% off | Top offers on clothing',
              //   'See all deals',
              //   cloth,
              //   clothing,
              // ),
             // mainDvider(),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Watch Sixer only on miniTV',
              //         style: textTheme.displayMedium!
              //             .copyWith(fontWeight: FontWeight.w600),
              //       ),
              //       Container(
              //         height: height * 0.35,
              //         width: width,
              //         decoration: const BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage(
              //                     'assets/images/offersNsponcered/sixer.png'),
              //                 fit: BoxFit.fill)),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
