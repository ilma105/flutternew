import 'package:flutter/widgets.dart';
//tab er state change korar bebostha korechi eikhane
class MainPaegProvider with ChangeNotifier{
  int _selectedtabindex=0;
  int getselectedtab(){
    return _selectedtabindex;
  }
  void settab(int tabindex){
    _selectedtabindex = tabindex;
    notifyListeners();

  }
}