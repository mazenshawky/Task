import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/core/Util/netWork/local/cache_helper.dart';
import 'package:mono/models/city_model.dart';
import 'package:mono/provider/auth_provider.dart';
import 'package:mono/provider/category_provider.dart';
import 'package:mono/provider/city_provider.dart';
import 'package:mono/provider/serivce_provider.dart';
import 'package:mono/provider/signup_provider.dart';
import 'package:mono/screens/account/city_screen.dart';
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

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Data? city;

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
                    //name
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "name",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomTextField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.name],
                            onChanged: (_) {},
                            validation: firstNameField,
                            hintText: "name",
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
                            title: "city",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          Card(child: buildCity(),),
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
                            if(formKey.currentState!.validate() && city?.id != null){
                              await provider.register(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                cityId: city!.id!,
                              );
                              if(provider.registerSuccessModel?.message?.isNotEmpty?? false) {
                                CacheHelper.saveData(key: 'token', value: provider.registerSuccessModel!.data!.token).then((value)
                                async {
                                  token = provider.registerSuccessModel!.data!.token!;
                                  final catProvider = Provider.of<CategoryProvider>(context, listen: false);
                                  final serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
                                  await catProvider.getCategories();
				  catProvider.setCategoriesMap();
                                  await serviceProvider.getServices();
                                  Helper.toScreen(context, HomePage());
                                });
                              } else {
                                showToast(text: provider.registerErrorModel?.errors?.email?[0]??'');
                              }
                            } else if(city?.id == null){
                              showToast(text: 'Please select a city');
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

  Widget buildCity() {
    // ignore: prefer_function_declarations_over_variables
    final onTap = () async {
      final provider = Provider.of<CityProvider>(context, listen: false);
      await provider.getCities();
      final city = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CityScreen()),
      );

      if (city == null) return;

      setState(() => this.city = city);
    };

    return buildCityPicker(
      child: city == null
          ? buildListTile(title: 'No City', onTap: onTap)
          : buildListTile(
        title: city!.name!,
        onTap: onTap,
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
    );
  }

  Widget buildCityPicker({
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select City',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(margin: EdgeInsets.zero, child: child),
        ],
      );
}
