import 'package:flutter/material.dart';
import 'package:mono/utilites/constants.dart';

import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);

  List<String> messages = [
    'hello',
    '',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    '',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    ''
  ];

  List<String> myMessages = [
    '',
    'hello',
    '',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    '',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry'
  ];

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
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
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/chat_pic.png')
                  )
              ),
            ),
            const SizedBox(width: 8),
            CustomText(
              title: "ahmed mohamed",
              fontSize: 20,
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        actions: [
          CustomInkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.only(right: 34),
              child: Image.asset("assets/icons/ic_dots.png",scale: 1,),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if(index % 2 == 0)
                    return buildMessage(messages[index]);

                  return buildMyMessage(myMessages[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 25.0,
                ),
                itemCount: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      hintText: "message",
                      hintFontSize: 16,
                      hintTextColor: messageHintTextColor,
                      isOutlineInputBorderColor: kTimeMessageColor,
                      isOutlineInputBorder: true,
                      isUnderlineInputBorder: false,
                      contentPaddingLeft: 18,
                      outlineBottomLeftRadius: 20,
                      outlineBottomRightRadius: 20,
                      outlineTopLeftRadius: 20,
                      outlineTopRightRadius: 20,
                      suffixIcon: CustomInkWell(
                        onTap: (){},
                        child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/icons/camera.png",scale: 1,)
                        ),
                      ),
                    ),
                  ),
                  CustomInkWell(
                    onTap: (){},
                    child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/icons/send.png",scale: 1,)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildMessage(String message) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/chat_pic.png')
              )
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: kMessageColor,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.only(
              top: 3,
              bottom: 10.0,
              left: 10.0,
              right: 10.0,
            ),
            margin: const EdgeInsets.only(right: 50),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    title: message,
                    height: 2,
                    fontSize: 14,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget buildMyMessage(String message) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
        color: lightWhiteColor,
        border: Border.all(
            color: Colors.yellow,
            width: 1
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.only(
        top: 3,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      margin: const EdgeInsets.only(left: 50),
      child: CustomText(
        title: message,
        height: 2,
        fontSize: 14,
        color: blackColor,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
