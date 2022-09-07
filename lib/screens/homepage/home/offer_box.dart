import 'package:flutter/material.dart';
import 'package:mono/utilites/constants.dart';
class OfferBox extends StatelessWidget {
   Color? heartColor;
   OfferBox({
     this.heartColor,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kHrPadding,
      child: Container(
        width: double.infinity,
        height: 168,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/livingroom_img.png")
            )
        ),
        child: Stack(
          children: [
            Positioned.directional(
                textDirection: Directionality.of(context),
                start: 10,
                top: 10,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: whiteColor.withOpacity(0.7)
                  ),
                  child: Center(
                    child: Icon(Icons.favorite_border,
                      color:heartColor?? greyColor,),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
