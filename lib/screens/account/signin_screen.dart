import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/core/Util/netWork/local/cache_helper.dart';
import 'package:mono/provider/auth_provider.dart';
import 'package:mono/provider/category_provider.dart';
import 'package:mono/provider/signin_provider.dart';
import 'package:mono/screens/homepage/homepage.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/utilites/validator.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_rich_text.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:mono/widgets/custom_textfield.dart';
import 'package:mono/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

import '../../provider/serivce_provider.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';
class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   var formKey = GlobalKey<FormState>();

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
            title: CustomText(
              title: "Sign in",
              fontSize: 18,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: Consumer<AuthProvider>(
              builder: (context,authProvider, child) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                      Container(
                        padding: kHrPadding,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "email",
                              fontSize: 15,
                              color: blackColor,
                            ),
                            //Space
                            SizedBox(
                              height: Helper.setHeight(context) * 0.10 - 70,
                            ),
                            CustomTextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              autofillHints: [AutofillHints.email],
                              onChanged: (_) {},
                              validation: emailField,
                              hintText: "email",
                              isUnderlineInputBorder: true,
                              isOutlineInputBorder: false,
                              contentPaddingLeft: 5,
                              suffixIcon: CustomInkWell(
                                onTap: () {},
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/icons/ic_mail.png",
                                      scale: 2,
                                    )),
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
                              obscureText: authProvider.isToggle,
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
                                  authProvider.toggleDone(index: 0);
                                },
                                child:  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: authProvider.isToggle?
                                    Image.asset("assets/icons/ic_hide.png",scale: 1.7,):
                                    Image.asset("assets/icons/ic_seen.png",scale: 1.7,color: blackColor,)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      //Forgot password?
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.centerRight,
                        child: CustomInkWell(
                          onTap: (){
                            Helper.toScreen(context, ForgotPasswordScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomText(
                              title: "Forgot password?",
                              fontSize: 13,
                              color: greyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      //Space
                      SizedBox(height: Helper.setHeight(context)*0.10-20,),
                      //sign in
                      Consumer<SignInProvider>(
                        builder: (context, provider, child) => Container(
                          padding: kHrPadding,
                          child: CustomButton(
                            onPressed: () async {
                              if(formKey.currentState!.validate()){
                                await provider.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                if(provider.loginSuccessModel?.message?.token?.isNotEmpty?? false) {
                                  CacheHelper.saveData(key: 'token', value: provider.loginSuccessModel!.message!.token!).then((value)
                                  async {
                                    token = provider.loginSuccessModel!.message!.token!;
                                    final catProvider = Provider.of<CategoryProvider>(context, listen: false);
                                    final serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
                                    await catProvider.getCategories();
                                    await serviceProvider.getServices();
                                    Helper.toScreen(context, HomePage());
                                  });
                                } else {
                                  showToast(text: provider.loginErrorModel!.errors!.data!);
                                }
                              } else {
                                showToast(text: 'Please try again');
                              }
                            },
                            btnHeight: 46,
                            btnWidth: double.infinity,
                            btnRadius: 26,
                            title: "Sign in",
                            fontWeight: FontWeight.w500,
                            btnColor: blueColor,
                            textColor: whiteColor,
                            fontSize: 15,
                          ),
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
                          Helper.toScreen(context, SignUpScreen());
                        },
                        child: CustomRichText(
                          titleText: "I have no account  ",
                          titleFontSize: 14,
                          titleColor: blackColor,
                          children: [
                           TextSpan(
                             text: "create new account",
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
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
