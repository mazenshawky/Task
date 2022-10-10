import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/serivce_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:mono/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import 'categories_list.dart';
import 'interior_screen.dart';
import 'offer_box.dart';
import 'services_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Color for Android
      statusBarIconBrightness: Brightness.dark,
    ),
      sized: false,
      child: CustomParentWidget(
        child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        title: Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: CustomTextField(
            // controller: phoneController,
              keyboardType: TextInputType.text,
              onChanged: (_) {},
              hintText: "Search",
              isOutlineInputBorderColor: greyColor,
              isOutlineInputBorder: true,
              isUnderlineInputBorder: false,
              contentPaddingLeft: 5,
              prefixIcon: CustomInkWell(
                onTap: (){},
                child:  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset("assets/icons/ic_search.png",scale: 2,)
                ),
              ),
              suffixIcon: CustomInkWell(
              onTap: (){},
              child:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset("assets/icons/ic_vector.png",scale: 2,)
            ),
            ),
            ),
          ),
        ],
      ),
      ),
        ),
          body: Consumer<ServiceProvider>(
            builder: (context, serviceProvider, child) => Container(
              width: double.infinity,
              height: double.infinity,
              color: lightWhiteColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-50,),
                    //
                    Container(
                      padding: kHrPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         CustomText(
                           title: "Categories",
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
                    SizedBox(height: Helper.setHeight(context)*0.10-50,),
                    //CategoriesList
                    CategoriesList(),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-30,),
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
                    //
                    Container(
                      padding: kHrPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomInkWell(
                            onTap: (){
                              Helper.toScreen(context, InteriorScreen());
                            },
                            child: CustomText(
                              title: serviceProvider.serviceModel!.data!.first.category,
                              fontSize: 12,
                              color: blackColor,
                            ),
                          ) ,
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-60,),
                    //
                    Container(
                      padding: kHrPadding,
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/img1.png")
                              )
                            ),
                          ),
                          //Space
                          SizedBox(width: 12,),
                          Expanded(
                              child: CustomText(
                                // title: "Designer / Ibrahim",
                                // title: "Designer / ${serviceProvider.serviceModel!.data!.first.provider!.firstName}",
                                title: "Designer / ${serviceProvider.serviceModel!.data!.first.provider!.email.toString().split("@")[0]}",
                                fontSize: 12,
                                color: greyColor,
                              )),
                          CustomButton(
                            onPressed: () {
                            },
                            btnHeight: 32,
                            btnWidth: 60,
                            btnRadius: 8,
                            title: "BOOK",
                            fontWeight: FontWeight.w500,
                            btnColor: blueColor,
                            textColor: whiteColor,
                            fontSize: 15,
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-60,),
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
                    ServicesWidget(servProvider: serviceProvider,),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-40,),
                  ],
                ),
              ),
            ),
          ),
      ),
      ),
    );
  }
}
