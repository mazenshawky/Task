import 'package:flutter/material.dart';
import 'package:mono/provider/serivce_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_text.dart';
class ServicesWidget extends StatelessWidget {
  final ServiceProvider serviceProvider;
  final bool isScreen;

  const ServicesWidget({
    required this.serviceProvider,
    required this.isScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: isScreen ? serviceProvider.serviceModel!.data!.length : serviceProvider.minListLength(serviceProvider.serviceModel!.data!.length),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 84,
                padding: kHrPadding,
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
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
                                      title: serviceProvider.serviceModel!.data![index].name,
                                      fontSize: 12,
                                      color: blackColor,
                                    )) ,
                                CustomText(
                                  title: serviceProvider.serviceModel!.data![index].price,
                                  fontSize: 20,
                                  color: blueColor,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: CustomText(
                                      // title: "room for 2 children",
                                      title: serviceProvider.serviceModel!.data![index].description,
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
                                      title: serviceProvider.serviceModel!.data![index].category,
                                      fontSize: 11,
                                      color: greyColor,
                                    )) ,
                                CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 32,
                                  btnWidth: 60,
                                  btnRadius: 8,
                                  title: "BOOK",
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
              ),
              SizedBox(height: 10,),
            ],
          );
        });
  }
}
