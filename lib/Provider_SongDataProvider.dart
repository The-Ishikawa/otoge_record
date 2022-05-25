import 'package:flutter/material.dart';

class SongDataProvider extends ChangeNotifier{
  Map _songDataMap = {};
  List _idList = [];

  Map<dynamic, dynamic> get songDataMap => _songDataMap;
  List get idList => _idList;

  void setSongDataMap(Map _path){
    _songDataMap = _path;
    notifyListeners();
  }
  void setIdList(List _path){
    _idList = _path;
    notifyListeners();
  }
}
