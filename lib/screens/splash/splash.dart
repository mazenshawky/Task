import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/screens/onboarding/onboarding_screen.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void init() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(Duration(seconds: 3),()async{
        Helper.toRemoveUntiScreen(context, OnBoardingScreen());
    });
    }catch(e){
      print(e);
      }
  }
  @override
  void initState() {
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarIconBrightness: Brightness.light,
        ),
        sized: false,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:  BoxDecoration(
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image:  AssetImage("assets/images/splash.png")
                )
            ),
          ),
        ),
      ),
    );
  }
}
