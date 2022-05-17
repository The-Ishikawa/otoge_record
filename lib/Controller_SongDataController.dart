
import 'package:flutter/cupertino.dart';
import 'package:otoge_record/Provider_SongDataProvider.dart';

class SongDataController{
  Map _songDataMap = {};
  List _idList = [];
  SongDataProvider? songDataProvider;

  void setReference(SongDataProvider s){
    songDataProvider ??= s;
  }

  void setSongDataMap(Map _path){
    _songDataMap = _path;
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


  }



}