import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/interior_provider.dart';
import 'package:mono/provider/serivce_provider.dart';
import 'package:mono/screens/homepage/home/services_screen.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_rich_text.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import 'offer_box.dart';
import 'services_widget.dart';
class InteriorScreen extends StatelessWidget {
  final ServiceProvider serviceProvider;

  InteriorScreen({
    required this.serviceProvider,
    Key? key,
  }) : super(key: key);

List list =[
  "Design of children's rooms",
  "Living rooms design",
  "Living rooms design",
];
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Consumer<InteriorProvider>(
            builder: (context,interiorProvider, child) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: CustomText(
                  title: "Interior design",
                  fontSize: 18,
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                ),
                bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 50),
                  child: Container(
                    width: double.infinity,
                    margin: kHrPadding,
                    padding: EdgeInsets.only(bottom: 10),
                    child:SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(list.length, (index){
                          return Container(
                            padding: EdgeInsets.only(right: 15),
                            child: CustomInkWell(
                              onTap: (){
                                interiorProvider.switchList(index);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color:interiorProvider.hrListIndex==index? yellowColor:Colors.transparent
                                ),
                                child: CustomText(
                                  title: list[index],
                                  fontSize: 14,
                                  color:interiorProvider.hrListIndex==index? whiteColor:greyColor,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                color: lightWhiteColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Services
                      Container(
                        padding: kHrPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: "Different services",
                              fontSize: 16,
                              color: blackColor,
                            ) ,
                            CustomInkWell(
                              onTap: () {
                                Helper.toScreen(context, ServicesScreen(serviceProvider: serviceProvider,));
                              },
                              child: CustomRichText(
                                children: [
                                  TextSpan(
                                      text: "See all",
                                      style: TextStyle(fontSize: 12, color: greyColor))
                                ],
                              ),
                            ),
                            // CustomText(
                            //   title: "See all",
                            //   fontSize: 12,
                            //   color: greyColor,
                            // )
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-60,),
                      Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: ServicesWidget(serviceProvider: serviceProvider, isScreen: false,)),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-70,),
                      //Offer & packages
                      Container(
                        padding: kHrPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: "Offer & packages",
                              fontSize: 16,
                              color: blackColor,
                            ) ,
                            CustomText(
                              title: "See all",
                              fontSize: 12,
                              color: greyColor,
                            )
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-60,),
                      //Offer & packages box
                      OfferBox(),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-40,),
                      //
                      Container(
                        padding: kHrPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: serviceProvider.serviceModel!.data!.first.name,
                              fontSize: 12,
                              color: blackColor,
                            ) ,
                            CustomText(
                              title: serviceProvider.serviceModel!.data!.first.price,
                              fontSize: 20,
                              color: blueColor,
                            )
                          ],
                        ),
                      ),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-60,),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
