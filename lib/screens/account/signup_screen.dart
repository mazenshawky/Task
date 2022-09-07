import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/auth_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/utilites/validator.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_rich_text.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:mono/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import 'otp_screen.dart';
class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
   final phoneController = TextEditingController();
   final passwordController = TextEditingController();
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
              title: "Create New Account",
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
                    SizedBox(height: Helper.setHeight(context)*0.10-50,),
                    //welcome back
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        title: "welcome back",
                        fontSize: 18,
                        color: blueColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-50,),
                    //phone number
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "phone number",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(height: Helper.setHeight(context)*0.10-70,),
                          CustomTextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.telephoneNumberNational],
                            onChanged: (_) {},
                            validation: phoneField,
                            hintText: "phone number",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            suffixIcon: CustomInkWell(
                              onTap: (){},
                              child:  Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/ic_phone.png",scale: 2,)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-30,),
                    //password
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "password",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(height: Helper.setHeight(context)*0.10-70,),
                          CustomTextField(
                            obscureText: authProvider.isToggle1,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.password],
                            onChanged: (_) {},
                            validation: validatePassword,
                            hintText: "password",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            suffixIcon: CustomInkWell(
                              onTap: (){
                                authProvider.toggleDone(index: 1);
                              },
                              child:  Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: authProvider.isToggle1?
                                  Image.asset("assets/icons/ic_hide.png",scale: 1.7,):
                                  Image.asset("assets/icons/ic_seen.png",scale: 1.7,color: blackColor,)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10+10),
                    //Sign up
                    Container(
                      padding: kHrPadding,
                      child: CustomButton(
                        onPressed: () {
                             Helper.toScreen(context, OTPScreen());
                        },
                        btnHeight: 46,
                        btnWidth: double.infinity,
                        btnRadius: 26,
                        title: "Sign up",
                        fontWeight: FontWeight.w500,
                        btnColor: blueColor,
                        textColor: whiteColor,
                        fontSize: 15,
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-40,),
                    //Or by social media
                    Container(
                      alignment: Alignment.center,
                      child: CustomText(
                        title: "Or by social media",
                        fontSize: 13,
                        color: greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-50,),
                    //Social Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //google
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: yellowColor,
                                  width: 1
                              )
                          ),
                          child: Center(
                            child: Image.asset("assets/icons/ic_google.png",scale: 2,),
                          ),
                        ),
                        //Space
                        SizedBox(width: 20,),
                        //fb
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: yellowColor,
                                  width: 1
                              )
                          ),
                          child: Center(
                            child: Image.asset("assets/icons/ic_fb.png",scale: 2,),
                          ),
                        ),
                      ],
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-50,),
                    //
                    CustomInkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CustomRichText(
                        titleText: "I have account  ",
                        titleFontSize: 14,
                        titleColor: blackColor,
                        children: [
                          TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: blueColor
                              )
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.10-30,),
                    //Enter as a guest
                    Container(
                      padding: kHrPadding,
                      child: CustomButton(
                        onPressed: () {
                          //    Helper.toScreen(context, SignInScreen());
                        },
                        btnHeight: 46,
                        btnWidth: double.infinity,
                        btnRadius: 26,
                        title: "Enter as a guest",
                        fontWeight: FontWeight.w500,
                        btnBorderColor: blueColor,
                        textColor: blueColor,
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
