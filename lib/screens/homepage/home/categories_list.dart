import 'package:flutter/material.dart';
import 'package:mono/models/category_model.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/widgets/custom_text.dart';
class CategoriesList extends StatelessWidget {
   CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          itemCount: categoryList.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                height: 80,
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(categoryList[index].image.toString(),scale: 2,),
                    //Space
                    SizedBox(height: 6,),
                    //
                    CustomText(
                      title: categoryList[index].title,
                      fontSize: 14,
                      color: blackColor,
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
