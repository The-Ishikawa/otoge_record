import 'package:flutter/material.dart';

class SongDataProvider extends ChangeNotifier{
  Map _songDataMap = {};
  List _idList = [];

  Map<dynamic, dynamic> get songDataMap => _songDataMap;
  List get idList => _idList;

  void setSongDataMap(Map _path){
    _songDataMap = _path;
    mapToList();
    notifyListeners();
  }


  void mapToList(){
    int _i = 0;
    while(true) {
      _idList.add(_songDataMap["IIdx"][_i]["id"]);
      if (_songDataMap["IIdx"][_i]['notes'] == -1) {
        break;
      }
      _i++;
    }
  }

}
