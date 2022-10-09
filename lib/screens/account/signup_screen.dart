import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/core/Util/netWork/local/cache_helper.dart';
import 'package:mono/provider/auth_provider.dart';
import 'package:mono/provider/signup_provider.dart';
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

import 'otp_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final professionController = TextEditingController();
  String birthDate = '';
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String gender = 'male';

  DateTime currentDate = DateTime.now();
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
            leading: CustomInkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/ic_back.png",
                  scale: 2,
                ),
              ),
            ),
            title: CustomText(
              title: "Create New Account",
              fontSize: 18,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
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
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //first name
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "first name",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomTextField(
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.name],
                            onChanged: (_) {},
                            validation: firstNameField,
                            hintText: "first name",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            suffixIcon: CustomInkWell(
                              onTap: () {},
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/icons/ic_profile.png",
                                    scale: 2,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //last name
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "last name",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomTextField(
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.name],
                            onChanged: (_) {},
                            validation: lastNameField,
                            hintText: "last name",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            suffixIcon: CustomInkWell(
                              onTap: () {},
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/icons/ic_profile.png",
                                    scale: 2,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //email
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
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //profession
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
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomTextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            autofillHints: [
                              AutofillHints.telephoneNumberNational
                            ],
                            onChanged: (_) {},
                            validation: phoneField,
                            hintText: "phone number",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            suffixIcon: CustomInkWell(
                              onTap: () {},
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/icons/ic_phone.png",
                                    scale: 2,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //email
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "profession",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomTextField(
                            controller: professionController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (_) {},
                            validation: professionField,
                            hintText: "profession",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            suffixIcon: CustomInkWell(
                              onTap: () {},
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/icons/ic_briefcase.png",
                                    scale: 2,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
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
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
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
                              onTap: () {
                                authProvider.toggleDone(index: 1);
                              },
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: authProvider.isToggle1
                                      ? Image.asset(
                                    "assets/icons/ic_hide.png",
                                    scale: 1.7,
                                  )
                                      : Image.asset(
                                    "assets/icons/ic_seen.png",
                                    scale: 1.7,
                                    color: blackColor,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //birth date
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "birth date",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: birthDate.isEmpty
                                    ? currentDate
                                    : DateTime.parse(birthDate),
                                firstDate: DateTime(1940),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate == null) return;
                              birthDate =
                                  pickedDate.toString().split(" ")[0];
                              authProvider.datePicked();
                            },
                            title: birthDate.isEmpty
                                ? 'Select a date'
                                : '${birthDate}',
                            textColor: blueColor,
                          ),
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 80,
                    ),
                    //gender
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "gender",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: authProvider.value,
                                onChanged: (value){
                                  authProvider.chooseGender(value);
                                  gender = 'male';
                                },
                                activeColor: blueColor,
                              ),
                              // const SizedBox(width: 5.0),
                              const Text('male'),
                              const SizedBox(width: 30.0),
                              Radio(
                                value: 2,
                                groupValue: authProvider.value,
                                onChanged: (value){
                                  authProvider.chooseGender(value);
                                  gender = 'female';
                                },
                                activeColor: blueColor,
                              ),
                              const Text('female'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Helper.setHeight(context) * 0.03 + 10),
                    //Sign up
                    Consumer<SignUpProvider>(
                      builder: (context, provider, child) => Container(
                        padding: kHrPadding,
                        child: CustomButton(
                          onPressed: () async {
                            // Helper.toScreen(context, OTPScreen());
                            if(formKey.currentState!.validate() && birthDate.isNotEmpty){
                              await provider.register(
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                birthDate: birthDate,
                                phoneNumber: phoneController.text,
                                gender: gender,
                                profession: professionController.text,
                              );
                              if(provider.registerSuccessModel?.message?.isNotEmpty?? false) {
                                CacheHelper.saveData(key: 'token', value: provider.registerSuccessModel!.data!.token).then((value)
                                {
                                  token = provider.registerSuccessModel!.data!.token!;

                                  Helper.toScreen(context, HomePage());
                                });
                              } else {
                                showToast(text: provider.registerErrorModel?.message??'');
                              }
                            } else if(birthDate.isEmpty){
                              showToast(text: 'Please select a date');
                            } else {
                              showToast(text: 'Please try again');
                            }
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
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 40,
                    ),
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
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
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
                              border: Border.all(color: yellowColor, width: 1)),
                          child: Center(
                            child: Image.asset(
                              "assets/icons/ic_google.png",
                              scale: 2,
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: 20,
                        ),
                        //fb
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: yellowColor, width: 1)),
                          child: Center(
                            child: Image.asset(
                              "assets/icons/ic_fb.png",
                              scale: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //
                    CustomInkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomRichText(
                        titleText: "I have account  ",
                        titleFontSize: 14,
                        titleColor: blackColor,
                        children: [
                          TextSpan(
                              text: "Sign in",
                              style: TextStyle(fontSize: 14, color: blueColor))
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 30,
                    ),
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
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
