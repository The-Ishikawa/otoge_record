import 'package:otoge_record/Provider_SongDataProvider.dart';

class SongDataController{
  Map _stableSongDataMap = {};
  Map _variableMap = {};
  List _tentativeList = [];
  List _idList = [];
  List _checkBoxValue =  <bool>[true, true, true, true, true,
    true, true, true, true, true , true, true];
  SongDataProvider? songDataProvider;

  void setReference(SongDataProvider _instanceReference){
    songDataProvider ??= _instanceReference;
  }

  void setSongDataMap(Map _path){
    _stableSongDataMap = _path;
    mapToIdList();
    clearLampColorToMap();
    songDataProvider?.setSongDataMap(_stableSongDataMap);
  }

  void mapToIdList(){
    int _i = 0;
    while(true) {
      if (_stableSongDataMap["IIdx"][_i]['notes'] == -1) {
        break;
      }
      _idList.add(_stableSongDataMap["IIdx"][_i]["id"]);
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
      if(_stableSongDataMap["IIdx"][_i]["notes"] == -1){
        break;
      }
      if(_stableSongDataMap["IIdx"][_i].containsKey("clear") == true){
        if(_stableSongDataMap["IIdx"][_i]["clear"] == "FULLCOMBO"){
          _stableSongDataMap["IIdx"][_i].addAll(_fullcomboRGB);
        } else if(_stableSongDataMap["IIdx"][_i]["clear"] == "EXHARD"){
          _stableSongDataMap["IIdx"][_i].addAll(_exhardRGB);
        }else if(_stableSongDataMap["IIdx"][_i]["clear"] == "HARD"){
          _stableSongDataMap["IIdx"][_i].addAll(_hardRGB);
        }else if(_stableSongDataMap["IIdx"][_i]["clear"] == "NORMAL"){
          _stableSongDataMap["IIdx"][_i].addAll(_normalRGB);
        }else if(_stableSongDataMap["IIdx"][_i]["clear"] == "EASY"){
          _stableSongDataMap["IIdx"][_i].addAll(_easyRGB);
        }else if(_stableSongDataMap["IIdx"][_i]["clear"] == "ASSISTEDEASY"){
          _stableSongDataMap["IIdx"][_i].addAll(_assistedRGB);
        }else if(_stableSongDataMap["IIdx"][_i]["clear"] == "FAILED"){
          _stableSongDataMap["IIdx"][_i].addAll(_failedRGB);
        }else{
          print("status [clear] error");
        }

      }else if(_stableSongDataMap["IIdx"][_i].containsKey("clear") == false){
        _stableSongDataMap["IIdx"][_i].addAll(_noPlayRGB);
      }
      _i++;
    }
  }

  void searchSongData(String type, var content){
    _tentativeList.clear();
    for(var _i = 0; _i < _idList.length; _i++){
      if(_stableSongDataMap["IIdx"][_i].containsKey(type) == false){
        _tentativeList.add(_idList[_i]);
      }
      else if(_stableSongDataMap["IIdx"][_idList[_i]][type] == content) {
        _tentativeList.add(_idList[_i]);
      }
    }
    songDataProvider?.setIdList(_tentativeList);
  }

  void resetTentativeList(){
    _tentativeList.clear();
  }

  void resetSearchSongData(){
    songDataProvider?.setIdList(_idList);
  }

  void changeCheckBoxValue(int _i){
    _checkBoxValue[_i] = !_checkBoxValue[_i];
    songDataProvider?.setCheckBoxValue(_checkBoxValue);
  }
}