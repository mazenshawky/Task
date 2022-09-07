import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/widgets/custom_text.dart';
class OnBoardSlider extends StatefulWidget {
   OnBoardSlider({Key? key}) : super(key: key);

  @override
  State<OnBoardSlider> createState() => _OnBoardSliderState();
}

class _OnBoardSliderState extends State<OnBoardSlider> {
   List images =[
     "assets/images/slide1.png",
     "assets/images/slide2.png",
   ];
int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Slider
          Container(
            height:Helper.setHeight(context)*0.58,
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 0.99,
                onPageChanged: (
                    CarouselPageChangedReason, val) {
                  setState(() {
                    currentPage = CarouselPageChangedReason;
                  });
                },
              ),
              //  carouselController: carouselController,
              items: images.map((i) {
                //  currentPage = images!.length-1;
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          //    borderRadius: BorderRadius.circular(7)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Image.asset(i,scale: 1.8,),
                            //Space
                            SizedBox(height: Helper.setHeight(context)*0.11-30,),
                            //
                            Center(
                              child: CustomText(
                                title:currentPage==0?
                                "Find your service"
                                :
                                "Apply your service with us !",
                                fontSize: 25,
                                color: blackColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            //Space
                            SizedBox(height: Helper.setHeight(context)*0.11-70,),
                            //
                            Center(
                              child: CustomText(
                                title:currentPage==0?
                                "Lorem Ipsum is simply dummy\ntext of the printing"
                                :
                                "Lorem Ipsum is simply dummy\ntext of the printing",
                                fontSize: 15,
                                color: greyColor,
                                textAlign: TextAlign.center,
                               // fontWeight: FontWeight.w700,
                              ),
                            ),
                            //Space
                            SizedBox(height: Helper.setHeight(context)*0.11,),
                          ],
                        )
                    );
                  },
                );
              }).toList(),
            ),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(2, (index){
              return buildDot(index: index);
            })
          )
        ],
      ),
    );
  }

  buildDot({int? index}){
    return AnimatedContainer(
      width:10,
      height: 10,
      margin: EdgeInsets.only(right: 9),
      decoration: BoxDecoration(
        color:currentPage==index?yellowColor: greyColor,
        borderRadius: BorderRadius.circular(5)
      ), duration: Duration(milliseconds: 350),
    );
  }
}
