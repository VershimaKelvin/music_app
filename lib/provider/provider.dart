

import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier{
  bool isActive = false;


  void beenClicked(){
    isActive = true;
    notifyListeners();
  }
}