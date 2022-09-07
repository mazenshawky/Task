import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/my_services_provider.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/cart_provider.dart';
import 'provider/homepage_provider.dart';
import 'provider/interior_provider.dart';
import 'screens/splash/splash.dart';
import 'utilites/constants.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
  ]).then((value) => runApp (

       MultiProvider(
           providers:[
             ChangeNotifierProvider(create: (context) => AuthProvider()),
             ChangeNotifierProvider(create: (context) => HomePageProvider()),
             ChangeNotifierProvider(create: (context) => MyServicesProvider()),
             ChangeNotifierProvider(create: (context) => CartProvider()),
             ChangeNotifierProvider(create: (context) => InteriorProvider()),
       ],
           child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light ,// Dark == white status bar -- for IOS.
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
    ));
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mono",
      home: const Splash(),
      // builder: EasyLoading.init(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: whiteColor,
              iconTheme: IconThemeData(
                  color: blackColor
              )
          ),
          //  bottomAppBarColor: Colors.transparent,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          canvasColor: scaffoldBackgroundColor,
          primaryColor: kPrimaryColor,
          primarySwatch: primarySwatch,
          fontFamily: 'medium',
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: InkRipple.splashFactory,
          focusColor: Colors.transparent,
          dividerColor: Colors.transparent,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: kPrimaryColor)),
    );
  }
}
