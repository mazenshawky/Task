import 'package:flutter/material.dart';

import '../../utilites/constants.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhiteColor,
      appBar: AppBar(
        backgroundColor: lightWhiteColor,
        elevation: 0,
        centerTitle: true,
        leading: CustomInkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/icons/ic_back.png",scale: 2,),
          ),
        ),
        title: CustomText(
          title: "Notifications",
          fontSize: 20,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
              itemCount: 4,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=> buildNotificationItem(context, index),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationItem(context, index){
    return InkWell(
      onTap: (){},
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 6),
                child: Container(
                  width: 69,
                  height: 72,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/notification.png')
                      )
                  ),
                ),
              ),
              if(index != 3) Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 3,
                  end: 47,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: blueColor,
                    ),
                  )
              )
            ],
          ),
          const SizedBox(width: 19),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: "your request has been accepted",
                  fontSize: 14,
                  color: textBlackColor,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: CustomText(
                          title: "Lorem Ipsum is simply dummy text of the printing and",
                          fontSize: 14,
                          color: textDarkColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      title: "2 min ago",
                      fontSize: 10,
                      color: textLightBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
