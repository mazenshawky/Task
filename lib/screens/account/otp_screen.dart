import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/auth_provider.dart';
import 'package:mono/screens/homepage/homepage.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
class OTPScreen extends StatefulWidget {
   OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
   var textController = TextEditingController();

   var verificationPin = "";

   Timer? timer1;

   int _start = 59;

   bool? visibleButton=false;

   void startTimer() {
     const oneSec = const Duration(seconds: 1);
     timer1 = new Timer.periodic(oneSec, (Timer timer) {
       setState(
             () {
           if (_start <= 0) {
             //_start = 59;
             timer.cancel();
             visibleButton = true;
             // visibleTimer = false;
           } else {
             _start = _start - 1;
           }
         },
       );
     });
   }
   @override
   void initState() {
     super.initState();
     startTimer();
     textController =  TextEditingController();
   }
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarIconBrightness: Brightness.dark,
        ),
        sized: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: CustomInkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/icons/ic_back.png",scale: 2,),
              ),
            ),
            title: CustomText(
              title: "verification",
              fontSize: 18,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: Consumer<AuthProvider>(
              builder: (context,authProvider, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-20,),
                      //
                      Container(
                      padding: kHrPadding,
                      alignment: Alignment.center,
                      child: CustomText(
                        title: "Lorem Ipsum is simply dummy\ntext of the printing",
                        fontSize: 16,
                        color: greyColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.11,),
                      //otp fields
                      Container(
                        padding: kHrPadding,
                        child: PinCodeTextField(
                          autofocus: true,
                          controller: textController,
                          hideCharacter: false,
                          highlight: false,
                          highlightColor: darkBlueColor,
                          defaultBorderColor: yellowColor,
                          highlightPinBoxColor: whiteColor,
                          hasTextBorderColor: yellowColor,
                          // highlightPinBoxColor: Colors.orange,
                          maxLength: 4,
                          onDone: (text) {
                            verificationPin = text;
                          },
                          pinBoxWidth: 48,
                          pinBoxHeight: 48,

                          hasUnderline: false,
                          wrapAlignment: WrapAlignment.spaceAround,
                          pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                          pinTextStyle: TextStyle(fontSize: 22.0),
                          pinBoxRadius: 10,
                          pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 10),
                          pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.scalingTransition,
                          maskCharacter: '',
//                    pinBoxColor: Colors.green[100],
                          pinTextAnimatedSwitcherDuration:
                          Duration(milliseconds: 300),
//                    highlightAnimation: true,
                          highlightAnimationBeginColor: darkBlueColor,
                          highlightAnimationEndColor: darkBlueColor,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-30,),
                      Container(
                          child:visibleButton==false?
                          Container(
                            padding: kHrPadding,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                CustomText(
                                  title: "Resend  ",
                                  fontSize: 14,
                                  color: blackColor,
                                ),
                                Text(
                                  "$_start" + " s",
                                  style: TextStyle(
                                      color: blueColor,
                                      fontSize: 13,
                                      fontFamily: 'medium'),
                                ),
                              ],
                            ),
                          ):
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            alignment: Alignment.centerLeft,
                            child:
                            Center(child:
                            CustomInkWell(
                              onTap: (){
                                startTimer();
                                setState(() {
                                  _start = 59;
                                  visibleButton = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      title: "Didn’t get an OTP? ",
                                      fontSize: 14,
                                      color: blackColor,
                                    ),
                                    CustomText(
                                      title: "Resend OTP",
                                      fontSize: 14,
                                      color: blueColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ),
                          )),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10,),
                      //Send
                      Container(
                        padding: kHrPadding,
                        child: CustomButton(
                          onPressed: () {
                            Helper.toScreen(context, HomePage());
                            },
                          btnHeight: 46,
                          btnWidth: double.infinity,
                          btnRadius: 26,
                          title: "Confirm",
                          fontWeight: FontWeight.w500,
                          btnColor: blueColor,
                          textColor: whiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
