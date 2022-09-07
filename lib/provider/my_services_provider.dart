import 'package:flutter/material.dart';

class MyServicesProvider extends ChangeNotifier{
  TabController? controller;
  tabFuncation(TickerProvider vsync){
    controller = TabController(length: 3, vsync: vsync);
    controller!.addListener(tabIndexChange);
  }

  tabIndexChange(){
    notifyListeners();
  }

  tabNavigate(int index){
    controller!.animateTo(index);
    //  notifyListeners();
  }

}