import 'package:flutter/material.dart';
import 'package:kids/src/constants/app_bar.dart';
import 'package:kids/src/constants/button_widgets.dart';
import 'package:kids/src/constants/common_functions.dart';
import 'package:kids/src/constants/constants.dart';
import 'package:kids/src/utils/colors.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isRemember=false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;


    void toglecheck(){
      setState(() {
        isRemember=!isRemember;
        // print("Is Rememeber $isRemember");
      });
      // return checked;
    }


    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(width, height),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blankSpace(height: height * 0.03),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Subtotal ", style: textTheme.bodyLarge),
                        TextSpan(
                            text: "ETB 240.00",
                            style: textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  //Text('Subtotal',style: textTheme.displaySmall!.copyWith(color: black,),),

                  Row(
                    children: [
                      Text(
                        "EMI Available",
                        style: textTheme.labelLarge!
                            .copyWith(color: grey, fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Detail',
                          style: textTheme.labelLarge!.copyWith(color: teal),
                        ),
                      )
                    ],
                  ),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   const Icon(
                     Icons.check_circle,
                     color: Colors.green,
                   ),
                   Flexible(
                     child: RichText(
                       textAlign: TextAlign.justify,
                       text: TextSpan(
                         children: [
                           TextSpan(
                             text: 'Your order is eligible for FREE Delivery. ',
                             style: textTheme.bodySmall!.copyWith(color: teal),
                           ),
                           TextSpan(
                             text: 'Select this option at checkout',
                             style: textTheme.bodySmall!.copyWith(color: Colors.black),
                           ),
                           TextSpan(
                             text: ' Details',
                             style: textTheme.bodyMedium!.copyWith(color: teal),
                           ),
                         ],
                       ),
                     ),
                   ),

                 ],),
                  blankSpace(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width * 0.95, height * 0.06),
                        backgroundColor: teal),
                    child: Text(
                      'Proceed to Buy(2 items)',
                      style: textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w300, color: white),
                    ),
                  ),
                  blankSpace(),
                  custom_checkbox(
                    message1: "Send as gift",
                    message2: "Include custom message",
                    height:height,
                    width:width,
                    textTheme:textTheme,
                    func:toglecheck,
                    isChecked: isRemember,
                  ),
                  blankSpace(),
                  mainDvider(),
                  productList(height, width,dealsOfTheDay,'assets/images/todays_deals/',textTheme)
                ],
              ),
            )),
      ),
    );
  }
   productList(double height, double width,List productList,String path, TextTheme textTheme) {
    return ListView.builder(
        itemCount: cloth.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: height*0.01),
            width: width,
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex:20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('$path${productList[index]}',),height: height*0.12,fit: BoxFit.fitHeight,),
                blankSpace(height: 20),
                Row(
                  children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10),
                          ),
                      ),
                      child: const Icon(Icons.delete),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text('0',style: textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w600,color: teal),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10),
                        ),
                      ),

                      child: const Icon(Icons.add),),
                  ),
                ],),
                  blankSpace(height: 80),
                ],),),
              Expanded(flex: 1,child: Container(),),
              Expanded(flex:30,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Samsung 34-inch 86.42cm LED Odyssey G5 Ultra WQHD',style: textTheme.bodyLarge!),
                   SizedBox(height: height*0.01,),
                  Text('ETB 5000',style: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),),
                  SizedBox(height: height*0.005,),
                  Text('Eligible For FREE shipping',style: textTheme.bodySmall!.copyWith(color: grey)),
                  SizedBox(height: height*0.005,),
                  Text('In stock',style: textTheme.bodySmall!.copyWith(color: Colors.green),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        color: greyShade1,
                        borderRadius: BorderRadius.circular(10),
                        ),

                        child:  Text('Delete',style: textTheme.bodySmall,),)),
                      Expanded(flex: 1, child: Container( )),
                      Expanded(
                          flex: 6,
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: grey),
                              color: greyShade1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Text('Save For Later',style: textTheme.bodySmall),))
                  ],),
                  blankSpace(height: 30),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 49,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        color: greyShade1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('See more like this'),
                    ),
                  ),
                  blankSpace(height: 30),

                ],),),
          ],),

          );
        });
  }
}

