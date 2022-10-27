import 'package:flutter/material.dart';

import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<String> images = [
    'assets/images/first_pic.png',
    'assets/images/second_pic.png',
    'assets/images/third_pic.png',
    'assets/images/fourth_pic.png',
    'assets/images/fifth_pic.png'
  ];

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
          title: "Messages",
          fontSize: 20,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildNewRequests(),
            const SizedBox(height: 12),
            ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=> buildChatItem(context, images[index]),
              separatorBuilder: (context, index) => buildDivider(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNewRequests(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            border: Border.all(
                color: blueColor,
                width: 1
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: CustomText(
              title: "2",
              fontSize: 12,
              color: blueColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 8),
        CustomText(
          title: "New requests",
          fontSize: 16,
          color: blueColor,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Widget buildChatItem(BuildContext context, String image){
    return InkWell(
      onTap: (){
        Helper.toScreen(context, const ChatScreen());
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 6),
            child: Container(
              width: 63,
              height: 63,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image)
                  )
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: "ahmed mohamed",
                      fontSize: 16,
                      color: textBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      title: "4:30 Pm",
                      fontSize: 10,
                      // fontStyle: subtitle,
                      color: yellowColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: "Ok, no problem",
                      fontSize: 12,
                      // fontStyle: subtitle,
                      color: blueColor,
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: CustomText(
                          title: "2",
                          fontSize: 12,
                          color: whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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

  Widget buildDivider(){
    return const Padding(
      padding: EdgeInsets.only(left: 18, right: 18),
      child:  Divider(
        color: kDividerColor,
        thickness: 0.5,
      ),
    );
  }
}
