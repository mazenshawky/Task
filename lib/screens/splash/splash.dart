import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/category_provider.dart';
import 'package:mono/screens/homepage/homepage.dart';
import 'package:mono/screens/onboarding/onboarding_screen.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/serivce_provider.dart';
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
        if(token == null) {
          Helper.toRemoveUntiScreen(context, OnBoardingScreen());
        }else {
          final catProvider = Provider.of<CategoryProvider>(context, listen: false);
          final serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
          await catProvider.getCategories();
          await serviceProvider.getServices();
          Helper.toRemoveUntiScreen(context, HomePage());
        }
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
