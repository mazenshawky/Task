import 'package:flutter/material.dart';

class InteriorProvider extends ChangeNotifier{
  //
  int hrListIndex =0;
  switchList(index){
    hrListIndex = index;
    notifyListeners();
  }
}