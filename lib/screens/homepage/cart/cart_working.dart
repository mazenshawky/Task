import 'package:flutter/material.dart';
import 'package:mono/screens/homepage/home/offer_box.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_text.dart';
class CartWorking extends StatelessWidget {
   CartWorking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Space
          SizedBox(height: Helper.setHeight(context)*0.10-50,),
          //
          OfferBox(heartColor: blueColor,),
          //Space
          SizedBox(height: Helper.setHeight(context)*0.10-40,),
          //
          Container(
            padding: kHrPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "Design of a childern's room for 2 children",
                  fontSize: 12,
                  color: blackColor,
                ) ,
                CustomText(
                  title: "256 EG",
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
                CustomText(
                  title: "Interior design",
                  fontSize: 12,
                  color: blackColor,
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
                      title: "Designer / Ibrahim",
                      fontSize: 12,
                      color: greyColor,
                    )),
                CustomButton(
                  onPressed: () {
                  },
                  btnHeight: 32,
                  btnWidth: 70,
                  btnRadius: 8,
                  title: "Ongoing",
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
        ],
      ),
    );
  }
}
