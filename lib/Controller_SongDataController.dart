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
    print(_songDataMap["IIdx"][0].containsKey("clear"));
    colorToMap();
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
  void colorToMap(){
    int _i = 0;
    while(true){
      if(_songDataMap["IIdx"][_i]["notes"] == -1){
        break;
      }
      if(_songDataMap["IIdx"][_i].containsKey("clear") == true){

      }else if(_songDataMap["IIdx"][_i].containsKey("clear") == false){
        _songDataMap["IIdx"][_i]["color"]["red"] = 128;
        _songDataMap["IIdx"][_i]["color"]["green"] = 128;
        _songDataMap["IIdx"][_i]["color"]["blue"] = 128;
        print(_songDataMap["IIdx"][_i]["color"]["red"]);
      }
      _i++;
    }
  }
}