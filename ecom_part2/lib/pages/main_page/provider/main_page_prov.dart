import 'package:flutter/material.dart';

class MainPageProv with ChangeNotifier{
  int _selectedtabindex = 0;
  int getSelectedTabIndex(){
return _selectedtabindex;
  }
  void setTab(int tabindex){
    _selectedtabindex=tabindex;
    notifyListeners();
  }
}