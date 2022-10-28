import 'package:flutter/material.dart';

import '../../../utilites/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class UnderPaymentPage extends StatelessWidget {
  const UnderPaymentPage({Key? key}) : super(key: key);

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
              width: 126,
              height: 118,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/payment.png")
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          CustomText(
            title: 'Your outstanding balance for a service\nthat has not yet been completed',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: textBlackColor2,
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: 'number of uncompleted services',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: blueColor,
              ),
              Container(
                  height: 28,
                  width: 84,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: CustomText(
                      title: '1 service',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: textBlackColor2,
                    ),
                  )
              ),
            ],
          ),
          const SizedBox(height: 34),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: CustomText(
              title: 'Your current balance',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kDividerColor,
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {},
            btnHeight: 62,
            btnWidth: double.infinity,
            btnRadius: 24,
            title: "150 EGP",
            fontWeight: FontWeight.w400,
            btnColor: lightWhiteColor,
            textColor: textBlackColor3,
            fontSize: 24,
            btnBorderColor: blueColor,
            btnBorderWidth: 2,
          ),
          const SizedBox(height: 20),
          CustomText(
            title: 'Payment will be received once the service\n             is completed successfully',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: kTimeMessageColor,
          ),
        ],
      ),
    );
  }
}
