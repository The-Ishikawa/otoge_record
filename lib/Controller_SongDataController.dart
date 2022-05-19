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
    var _noPlayRGB ={"red": 128, "green": 128, "blue": 128};
    var _fullcomboRGB ={"red": 249, "green": 193, "blue": 207};
    var _exhardRGB ={"red": 128, "green": 128, "blue": 128};

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

        }else if(_songDataMap["IIdx"][_i]["clear"] == "NORMAL"){

        }else if(_songDataMap["IIdx"][_i]["clear"] == "EASY"){

        }else if(_songDataMap["IIdx"][_i]["clear"] == "ASSISTEDEASY"){

        }else if(_songDataMap["IIdx"][_i]["clear"] == "FAILED"){

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