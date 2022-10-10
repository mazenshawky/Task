import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/provider/interior_provider.dart';
import 'package:mono/provider/serivce_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import 'offer_box.dart';
import 'services_widget.dart';
class ServicesScreen extends StatelessWidget {
  final ServiceProvider serviceProvider;

  ServicesScreen({
    required this.serviceProvider,
    Key? key,
  }) : super(key: key);

  List list =[
    "Design of children's rooms",
    "Living rooms design",
    "Living rooms design",
  ];
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child:AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Consumer<InteriorProvider>(
            builder: (context,interiorProvider, child) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: CustomText(
                    title: "Services",
                    fontSize: 18,
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: lightWhiteColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Space
                        SizedBox(height: Helper.setHeight(context)*0.10-60,),
                        Container(
                            padding: EdgeInsets.only(bottom: 15),
                            child: ServicesWidget(serviceProvider: serviceProvider, isScreen: true,)),
                        //Space
                        SizedBox(height: Helper.setHeight(context)*0.10-70,),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
