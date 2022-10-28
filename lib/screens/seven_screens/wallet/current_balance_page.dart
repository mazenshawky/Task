import 'package:flutter/material.dart';
import 'package:mono/widgets/custom_text.dart';

import '../../../utilites/constants.dart';
import '../../../widgets/custom_button.dart';

class CurrentBalancePage extends StatelessWidget {
  const CurrentBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 190),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 158,
              height: 125,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/current_balance.png")
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          CustomText(
            title: 'Your current balance',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: kDividerColor,
          ),
          const SizedBox(height: 12),
          CustomText(
            title: '150 EGP',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: textBlackColor2,
          ),
          const SizedBox(height: 130),
          CustomButton(
            onPressed: () {},
            btnHeight: 46,
            btnWidth: double.infinity,
            btnRadius: 26,
            title: "Add money",
            fontWeight: FontWeight.w500,
            btnColor: blueColor,
            textColor: whiteColor,
            fontSize: 15,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: CustomButton(
              onPressed: () {},
              btnHeight: 46,
              btnWidth: double.infinity,
              btnRadius: 26,
              title: "Take money",
              fontWeight: FontWeight.w500,
              btnColor: whiteColor,
              textColor: blueColor,
              fontSize: 15,
              btnBorderColor: blueColor,
              btnBorderWidth: 1,
            ),
          ),
        ],
      ),
    );
  }
}
