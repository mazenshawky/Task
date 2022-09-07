import 'package:flutter/material.dart';
import 'package:mono/screens/homepage/home/services_widget.dart';
import 'package:mono/utilites/constants.dart';
class WaitingScreen extends StatelessWidget {
   WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 15),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index){
          return  Container(
            padding: EdgeInsets.only(bottom: 15),
              child: ServicesWidget());
          }),
    );
  }
}
