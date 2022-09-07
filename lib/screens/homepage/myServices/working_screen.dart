import 'package:flutter/material.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_text.dart';
class WorkingScreen extends StatelessWidget {
   WorkingScreen({Key? key}) : super(key: key);

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
                child: Container(
                  height: 84,
                  padding: kHrPadding,
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 84,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/home_design_img.png")
                            )
                        ),
                      ),
                      //Space
                      SizedBox(width: 12,),
                      Expanded(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomText(
                                        title: "Design of a childern's",
                                        fontSize: 12,
                                        color: blackColor,
                                      )) ,
                                  CustomText(
                                    title: "256 EG",
                                    fontSize: 20,
                                    color: blueColor,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomText(
                                        title: "room for 2 children",
                                        fontSize: 12,
                                        color: blackColor,
                                      )) ,
                                  Row(
                                      children: List.generate(4, (index){
                                        return Icon(index==3?Icons.star_border:Icons.star,
                                          color:index==3?greyColor: yellowColor,
                                          size: 17,
                                        );
                                      })
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomText(
                                        title: "Interior design",
                                        fontSize: 11,
                                        color: greyColor,
                                      )) ,
                                  CustomButton(
                                    onPressed: () {
                                    },
                                    btnHeight: 32,
                                    btnWidth: 65,
                                    btnRadius: 8,
                                    title: "working",
                                    fontWeight: FontWeight.w500,
                                    btnColor: blueColor,
                                    textColor: whiteColor,
                                    fontSize: 15,
                                  )
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ));
          }),
    );
  }
}
