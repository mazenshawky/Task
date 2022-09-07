import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/auth_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/utilites/validator.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:mono/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);
   final phoneController = TextEditingController();
   final emailController = TextEditingController();
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
              title: "Forgot password",
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
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                               authProvider.checkAccount(0);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: yellowColor
                                      )
                                    ),
                                    padding: EdgeInsets.all(3),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: authProvider.phoneNumberIndex==0?
                                          yellowColor
                                              :
                                          Colors.transparent
                                      ),
                                    ),
                                  ),
                                  //Space
                                  SizedBox(width: 12,),
                                  Expanded(child: CustomText(
                                    title:authProvider.phoneNumberIndex==0?
                                    "Email"
                                    :
                                    "Google account",
                                    fontSize: 14,
                                    color: blackColor,
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                authProvider.checkAccount(1);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: yellowColor
                                        ),
                                    ),
                                    padding: EdgeInsets.all(3),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                              color: authProvider.phoneNumberIndex==1?
                                              yellowColor
                                                  :
                                                  Colors.transparent
                                      ),
                                    ),
                                  ),
                                  //Space
                                  SizedBox(width: 12,),
                                  CustomText(
                                    title: "phone number",
                                    fontSize: 14,
                                    color: blackColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(height: Helper.setHeight(context)*0.12,),
                    //phone number
                    authProvider.phoneNumberIndex==0?
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Email",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(height: Helper.setHeight(context)*0.10-70,),
                          CustomTextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (_) {},
                            validation: emailField,
                            hintText: "Email",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            suffixIcon: CustomInkWell(
                              onTap: (){},
                              child:  Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/ic_mail.png",scale: 2,)
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    :
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
                    SizedBox(height: Helper.setHeight(context)*0.20,),
                    //Send
                    Container(
                      padding: kHrPadding,
                      child: CustomButton(
                        onPressed: () {
                          //   Helper.toScreen(context, SignInScreen());
                        },
                        btnHeight: 46,
                        btnWidth: double.infinity,
                        btnRadius: 26,
                        title: "Send",
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
