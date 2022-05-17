import 'package:flutter/material.dart';

class SongDataProvider extends ChangeNotifier{
  Map _songDataMap = {};
  List _idList = [];

  Map get songDataMap => _songDataMap;
  List get idList => _idList;

  void setSongDataMap(Map _path){
    _songDataMap = _path;
    //mapToList();
    notifyListeners();
  }

  void mapToList(){
    int _i = 0;
    while(true){
      _idList.add(_songDataMap[_i]["id"]);
      if(_songDataMap[_i]['notes'] == -1){
        break;
      }
      _i++;
    }
  }
}
