
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePageProvider extends ChangeNotifier{
  TabController? controller;
  tabFuncation(TickerProvider vsync){
    controller = TabController(length: 4, vsync: vsync);
    controller!.addListener(tabIndexChange);
  }

  tabIndexChange(){
    notifyListeners();
  }

  tabNavigate(int index){
    controller!.animateTo(index);
    //  notifyListeners();
  }

  bool isSearchBar = false;
  searchBarToggle({bool?val}){
    isSearchBar = val!;
    notifyListeners();
  }



}