
import 'package:flutter/cupertino.dart';

class ThirdNotifier extends ChangeNotifier{
  int _curNum  =0 ;

  int get number=>_curNum;

  add(){
    _curNum++;
    notifyListeners();
  }

  minus(){
    _curNum --;
    notifyListeners();
  }

}