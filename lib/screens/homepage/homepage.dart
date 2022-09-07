import 'package:flutter/material.dart';
import 'package:mono/provider/homepage_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_tab.dart';
import 'package:provider/provider.dart';

import 'cart/my_request_screen.dart';
import 'home/home_screen.dart';
import 'myServices/my_services_screen.dart';
import 'profile/profile_screen.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<HomePageProvider>(context,listen:false).tabFuncation(this);
  }
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:Consumer<HomePageProvider>(
          builder: (context,homePageProvider, child) {
          return Scaffold(
            body: TabBarView(
                controller: homePageProvider.controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomeScreen(),
                  MyServicesScreen(),
                  MyRequestScreen(),
                  ProfileScreen(),
                ]),
            bottomNavigationBar: BottomAppBar(
              elevation: 2,
              color: blackColor,
              child: Container(
                height: 65,
                child: TabBar(
                  controller: homePageProvider.controller,
                  // isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.only(bottom: 3),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 0.1,
                  labelColor: yellowColor,
                  unselectedLabelColor: greyColor,
                  tabs: [
                    CustomTab(img: "assets/icons/ic_home.png",title: "Home",index: 0,),
                    CustomTab(img: "assets/icons/ic_briefcase.png",title: "My services",index: 1,),
                    CustomTab(img: "assets/icons/ic_cart1.png",title: "My requests",index: 2,),
                    CustomTab(img: "assets/icons/ic_profile.png",title: "Profile",index: 3,),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
