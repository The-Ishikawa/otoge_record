import 'package:flutter/material.dart';

class SongDataProvider extends ChangeNotifier{
  Map _songDataMap = {};
  List _idList = [];
  int _idListNum = 0;

  Map<dynamic, dynamic> get songDataMap => _songDataMap;
  List get idList => _idList;
  int get idListNum => _idListNum;

  void setSongDataMap(Map _path){
    _songDataMap = _path;
    mapToList();
    notifyListeners();
  }


  void mapToList(){
    int _i = 0;
    while(true) {
      if (_songDataMap["IIdx"][_i]['notes'] == -1) {
        break;
      }
      _idList.add(_songDataMap["IIdx"][_i]["id"]);
      _i++;
    }
    _idListNum = _idList.length;
    print(_idListNum);
    notifyListeners();
  }

}
