
import 'package:flutter/cupertino.dart';

class MyChangenNotifier  extends ChangeNotifier{
  int _counter= 0;

  int get counter =>_counter;

  addCounter(){
    _counter++;
    notifyListeners();
  }

}