import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  //Forgot Password Screen
  int phoneNumberIndex =1;
  checkAccount(index){
    phoneNumberIndex = index;
    notifyListeners();
  }

  bool isToggle = true;
  bool isToggle1 = true;
  toggleDone({int? index}) {
    if(index==0){
      isToggle = !isToggle;
    }else if(index==1){
      isToggle1 = !isToggle1;
    }
    notifyListeners();
  }

}