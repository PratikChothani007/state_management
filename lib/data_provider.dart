import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {

  int _counter = 0;

  int get counter => _counter;

  void increaseCount(){
    _counter++;
    notifyListeners();
  }
}