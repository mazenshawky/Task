import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/cart_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:mono/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import 'cart_finished.dart';
import 'cart_waiting.dart';
import 'cart_working.dart';
class MyRequestScreen extends StatefulWidget {
   MyRequestScreen({Key? key}) : super(key: key);

  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen>with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context,listen:false).tabFuncation(this);
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarIconBrightness: Brightness.dark,
      ),
      sized: false,
      child: Consumer<CartProvider>(
          builder: (context,cartProvider, child) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                toolbarHeight: 75,
                leading: CustomInkWell(
                  onTap: (){

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/icons/ic_bell.png",scale: 2,),
                  ),
                ),
                title:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                   //   width: 230,
                        child: CustomTextField(
                          // controller: phoneController,
                          keyboardType: TextInputType.text,
                          onChanged: (_) {},
                          hintText: "Search",
                          isOutlineInputBorderColor: greyColor,
                          isOutlineInputBorder: true,
                          isUnderlineInputBorder: false,
                          contentPaddingLeft: 5,
                          prefixIcon: CustomInkWell(
                            onTap: (){},
                            child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset("assets/icons/ic_search.png",scale: 2,)
                            ),
                          ),
                          suffixIcon: CustomInkWell(
                            onTap: (){},
                            child:  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset("assets/icons/ic_vector.png",scale: 2,)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Container(
                      width: 50,
                      child: Stack(
                        children: [
                          Center(child: Image.asset("assets/icons/chat.png",scale: 2,)),
                          Positioned.directional(
                              textDirection: Directionality.of(context),
                              top: 16,
                              end: 15,
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
                    color: lightWhiteColor,
                    child: Container(
                      width: double.infinity,
                      margin: kHrPadding,
                      decoration: BoxDecoration(
                          color: lightWhiteColor,
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: greyColor
                              )
                          )
                      ),
                      child: TabBar(
                        controller: cartProvider.controller,
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
              ),
              body:  Container(
                width: double.infinity,
                height: double.infinity,
                color: lightWhiteColor,
                child: TabBarView(
                    controller: cartProvider.controller,
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      CartWaiting(),
                      CartWorking(),
                      CartFinished(),
                    ]),
              ),
            );
          }
      ),
    );
  }
}
