import 'package:flutter/material.dart';
import 'package:mono/screens/seven_screens/wallet/current_balance_page.dart';
import 'package:mono/screens/seven_screens/wallet/payment_page.dart';
import 'package:mono/screens/seven_screens/wallet/under_payment_page.dart';

import '../../../utilites/constants.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<Widget> pages = const [
    CurrentBalancePage(),
    PaymentPage(),
    UnderPaymentPage(),
  ];

  List<String> list = [
    "current balance",
    "payment",
    "Under payment",
  ];

  int hrListIndex =0;

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
          title: "Wallet",
          fontSize: 20,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Container(
            width: double.infinity,
            margin: kHrPadding,
            child:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(list.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: shadowColor, spreadRadius: 0, blurRadius: 5, offset: Offset(0, 4)),
                        ],
                      ),
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomInkWell(
                        onTap: (){
                          switchList(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: hrListIndex==index? yellowColor:whiteColor
                          ),
                          child: CustomText(
                            title: list[index],
                            fontSize: 14,
                            color:hrListIndex==index? whiteColor:greyColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
      body: pages[hrListIndex],
    );
  }

  switchList(index){
    hrListIndex = index;
    setState(() {});
  }
}
