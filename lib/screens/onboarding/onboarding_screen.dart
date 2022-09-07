import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/screens/account/signin_screen.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_parent_widget.dart';

import 'onboard_slider.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarIconBrightness: Brightness.dark,
        ),
        sized: false,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Space
              SizedBox(height: Helper.setHeight(context)*0.10,),
              OnBoardSlider(),
              //Space
              SizedBox(height: Helper.setHeight(context)*0.12,),
              Container(
                padding: kHrPadding,
                child: CustomButton(
                  onPressed: () {
                       Helper.toScreen(context, SignInScreen());
                  },
                  btnHeight: 46,
                  btnWidth: double.infinity,
                  btnRadius: 26,
                  title: "Continue",
                  fontWeight: FontWeight.w500,
                  btnColor: blueColor,
                  textColor: whiteColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
