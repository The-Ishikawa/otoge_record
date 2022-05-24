import 'package:flutter/material.dart';

class SongDataProvider extends ChangeNotifier{
  Map _songDataMap = {};
  List _idList = [];
  List _checkBoxValue = <bool>[true, true, true, true, true,
    true, true, true, true, true, true, true];

  Map<dynamic, dynamic> get songDataMap => _songDataMap;
  List get idList => _idList;
  List get checkBoxValue => _checkBoxValue;

  void setSongDataMap(Map _path){
    _songDataMap = _path;
    notifyListeners();
  }
  void setIdList(List _path){
    _idList = _path;
    notifyListeners();
  }
  void setCheckBoxValue(List _path){
    _checkBoxValue = _path;
    notifyListeners();
    print(_checkBoxValue); ///debug
  }

}
