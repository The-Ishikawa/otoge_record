import 'package:otoge_record/Provider_SongDataProvider.dart';

class SongDataController{
  Map _songDataMap = {};
  List _idList = [];
  SongDataProvider? songDataProvider;

  void setReference(SongDataProvider _instanceReference){
    songDataProvider ??= _instanceReference;
  }
  void setSongDataMap(Map _path){
    _songDataMap = _path;
    mapToIdList();
    songDataProvider?.setSongDataMap(_songDataMap);
  }
  void mapToIdList(){
    int _i = 0;
    while(true) {
      if (_songDataMap["IIdx"][_i]['notes'] == -1) {
        break;
      }
      _idList.add(_songDataMap["IIdx"][_i]["id"]);
      _i++;
    }
    songDataProvider?.setIdList(_idList);
  }
}