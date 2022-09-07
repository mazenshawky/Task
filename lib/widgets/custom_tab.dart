import 'package:flutter/material.dart';
import 'package:mono/provider/homepage_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';
class CustomTab extends StatelessWidget {
  String? title;
  String? img;
  int? index;
  CustomTab({
    this.title,
    this.img,
    this.index,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(img!,scale: 2,color:Provider.of<HomePageProvider>(context,listen: false)
              .controller!.index==index?yellowColor:greyColor),
          //Space
          SizedBox(height: 6,),
          CustomText(
              title: title,
              fontSize: 11,
              color:Provider.of<HomePageProvider>(context,listen: false)
              .controller!.index==index?yellowColor:greyColor
          ),
        ],
      ),
    );
  }
}
