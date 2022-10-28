import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/homepage_provider.dart';
import 'package:mono/provider/my_services_provider.dart';
import 'package:mono/screens/homepage/home/add_service_screen.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../seven_screens/add_new_service_screen.dart';
import 'finished_screen.dart';
import 'waiting_screen.dart';
import 'working_screen.dart';
class MyServicesScreen extends StatefulWidget {
  MyServicesScreen({Key? key}) : super(key: key);

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen>with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<MyServicesProvider>(context,listen:false).tabFuncation(this);
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarIconBrightness: Brightness.dark,
      ),
      sized: false,
      child: Consumer<MyServicesProvider>(
          builder: (context,myServicesProvider, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              leading: CustomInkWell(
                onTap: (){
                 Provider.of<HomePageProvider>(context,listen: false).tabNavigate(0);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/icons/ic_back.png",scale: 2,),
                ),
              ),
              title: CustomText(
                title: "My services",
                fontSize: 18,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                Container(
                  width: 50,
                    child: Stack(
                      children: [
                        Center(child: Image.asset("assets/icons/ic_briefcase.png",scale: 2,)),
                        Positioned.directional(
                            textDirection: Directionality.of(context),
                            top: 21,
                            end: 14,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: yellowColor
                              ),
                            )
                        )
                      ],
                    ))
              ],
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 50),
                child: Container(
                  width: double.infinity,
                  margin: kHrPadding,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: greyColor
                      )
                    )
                  ),
                  child: TabBar(
                    controller: myServicesProvider.controller,
                    // isScrollable: true,
                    indicatorColor: blueColor,
                    labelPadding: EdgeInsets.only(bottom: 3),
                    indicatorSize: TabBarIndicatorSize.tab,
                   // indicatorWeight: 0.1,
                    labelColor: blueColor,
                    unselectedLabelColor: greyColor,
                    tabs: [
                      Tab(
                        child: CustomText(
                          title: "Waiting",
                          fontSize: 13,
                        ),
                      ),
                      Tab(
                        child: CustomText(
                          title: "Working",
                          fontSize: 13,
                        ),
                      ),
                      Tab(
                        child: CustomText(
                          title: "Finished",
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body:  TabBarView(
                controller: myServicesProvider.controller,
               // physics: NeverScrollableScrollPhysics(),
                children: [
                  WaitingScreen(),
                  WorkingScreen(),
                  FinishedScreen(),
                ]),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomAppBar(
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                    child: CustomButton(
                      onPressed: () {
                        Helper.toScreen(context, AddServiceScreen());
                      },
                      btnHeight: 46,
                      btnWidth: double.infinity,
                      btnRadius: 26,
                      title: "+ add a new service",
                      fontWeight: FontWeight.w500,
                      btnColor: blueColor,
                      textColor: whiteColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                BottomAppBar(
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                    child: CustomButton(
                      onPressed: () {
                        Helper.toScreen(context, const AddNewServiceScreen());
                      },
                      btnHeight: 46,
                      btnWidth: double.infinity,
                      btnRadius: 26,
                      title: "+ add a new service demo",
                      fontWeight: FontWeight.w500,
                      btnColor: blueColor,
                      textColor: whiteColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
