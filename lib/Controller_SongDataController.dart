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
    clearLampColorToMap();
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

  void clearLampColorToMap(){
    int _i = 0;
    var _noPlayRGB ={"red": 20, "green": 20, "blue": 20};
    var _fullcomboRGB = {"red": 254, "green": 195, "blue": 200};
    var _exhardRGB = {"red": 128, "green": 128, "blue": 128};
    var _hardRGB = {"red": 255, "green": 255, "blue": 255};
    var _normalRGB = {"red": 0, "green": 255, "blue": 255};
    var _easyRGB = {"red": 146, "green": 255, "blue": 20};
    var _assistedRGB = {"red": 255, "green": 64, "blue": 255};
    var _failedRGB = {"red": 192, "green": 0, "blue": 0};

    while(true){
      if(_songDataMap["IIdx"][_i]["notes"] == -1){
        break;
      }
      if(_songDataMap["IIdx"][_i].containsKey("clear") == true){
        if(_songDataMap["IIdx"][_i]["clear"] == "FULLCOMBO"){
          _songDataMap["IIdx"][_i].addAll(_fullcomboRGB);
        } else if(_songDataMap["IIdx"][_i]["clear"] == "EXHARD"){
          _songDataMap["IIdx"][_i].addAll(_exhardRGB);
        }else if(_songDataMap["IIdx"][_i]["clear"] == "HARD"){
          _songDataMap["IIdx"][_i].addAll(_hardRGB);
        }else if(_songDataMap["IIdx"][_i]["clear"] == "NORMAL"){
          _songDataMap["IIdx"][_i].addAll(_normalRGB);
        }else if(_songDataMap["IIdx"][_i]["clear"] == "EASY"){
          _songDataMap["IIdx"][_i].addAll(_easyRGB);
        }else if(_songDataMap["IIdx"][_i]["clear"] == "ASSISTEDEASY"){
          _songDataMap["IIdx"][_i].addAll(_assistedRGB);
        }else if(_songDataMap["IIdx"][_i]["clear"] == "FAILED"){
          _songDataMap["IIdx"][_i].addAll(_failedRGB);
        }else{
          print("status [clear] error");
        }

      }else if(_songDataMap["IIdx"][_i].containsKey("clear") == false){
        _songDataMap["IIdx"][_i].addAll(_noPlayRGB);
      }
      _i++;
    }
  }
}