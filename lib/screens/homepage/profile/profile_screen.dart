import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/screens/account/signin_screen.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_text.dart';
class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarIconBrightness: Brightness.light,
        ),
        sized: false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //iMG
                Container(
                  width: double.infinity,
                  height: 114,
                  decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.directional(
                          textDirection: Directionality.of(context),
                          top: 67,
                          start: 0,
                          end: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 94,
                                height: 94,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: AssetImage("assets/images/profile_img.png")
                                  )
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                //Space
                SizedBox(height: Helper.setHeight(context)*0.13,),
                //wallet
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_wallet.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "wallet",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //address
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_location.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "address",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //favorites
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_heart.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "favorites",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //share code
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_share.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "share code",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //Space
                SizedBox(height: 10,),
                //Divider
                Divider(height: 0.5,thickness: 1,color: yellowColor,indent: 18,endIndent: 18,),
                //Space
                SizedBox(height: 10,),
                //about mono
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_about.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "about mono",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //contact us
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_phone.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "contact us",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //settings
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_setting.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "sittings",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //sign out
                Container(
                  padding: kHrPadding,
                  child: CustomInkWell(
                    onTap: (){
                      Helper.toScreen(context, SignInScreen());
                    },
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_logout.png",scale: 2,),
                          //Space
                          SizedBox(width: 20,),
                          Expanded(
                              child: CustomText(
                                title: "sign out",
                                fontSize: 16,
                                color: blackColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //Space
                SizedBox(height: Helper.setHeight(context)*0.10,),
              ],
            ),
          ),
        ));
  }

  Widget customTile(){
    return Container(
      child: Row(
        children: [

        ],
      ),
    );
  }
}
