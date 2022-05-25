import 'package:otoge_record/Provider_SongDataProvider.dart';

class SongDataController {
  String _versionSelectedItem = "ALL VERSION";
  String _difficultySelectedItem = "ALL DIFFICULTY";
  String _levelSelectedItem = "ALL LEVEL";
  Map _stableSongDataMap = {};  //initState か　song 追加の時しか変更しない
  List _stableIDList = [];  //initState か　song 追加の時しか変更しない
  List _mutableIdList = [];
  List _checkBoxValue = <bool>[true, true, true, true, true,
    true, true, true, true, true, true, true];
  SongDataProvider? songDataProvider;

  void setReference(SongDataProvider _instanceReference) {
    songDataProvider ??= _instanceReference;
  }

  void setSongDataMap(Map _path) {  //stableSongData変更時に実行
    _stableSongDataMap = _path; //controller
    songDataProvider?.setSongDataMap(_path);  //provider
  }
  Map getSongDataMap(){
    return _stableSongDataMap;
  }

  void setMutableIDList(_path){
    _mutableIdList = _path;  //controller
    songDataProvider?.setIdList(_path); //provider
  }
  List getIDList(){
    return _mutableIdList;
  }

  void setStableIDList(_path){ //あんま使わない予定
    _stableIDList = _path;
  }
  List getStableIDList(){
    return _stableIDList;
  }

  void mapToIdList() {  //stableSongData変更時に実行
    int _i = 0;
    while (true) {
      if (_stableSongDataMap["IIdx"][_i]['notes'] == -1) {
        break;
      }
      _stableIDList.add(_stableSongDataMap["IIdx"][_i]["id"]);
      _i++;
    }
    songDataProvider?.setIdList(_stableIDList);
  }

  void clearLampColorToMap() {  //stableSongData変更時に実行
    int _i = 0;
    var _noPlayRGB = {"red": 20, "green": 20, "blue": 20};
    var _fullcomboRGB = {"red": 254, "green": 195, "blue": 200};
    var _exhardRGB = {"red": 128, "green": 128, "blue": 128};
    var _hardRGB = {"red": 255, "green": 255, "blue": 255};
    var _normalRGB = {"red": 0, "green": 255, "blue": 255};
    var _easyRGB = {"red": 146, "green": 255, "blue": 20};
    var _assistedRGB = {"red": 255, "green": 64, "blue": 255};
    var _failedRGB = {"red": 192, "green": 0, "blue": 0};

    while (true) {
      if (_stableSongDataMap["IIdx"][_i]["notes"] == -1) {
        break;
      }
      if (_stableSongDataMap["IIdx"][_i].containsKey("clear") == true) {
        if (_stableSongDataMap["IIdx"][_i]["clear"] == "FULLCOMBO") {
          _stableSongDataMap["IIdx"][_i].addAll(_fullcomboRGB);
        } else if (_stableSongDataMap["IIdx"][_i]["clear"] == "EXHARD") {
          _stableSongDataMap["IIdx"][_i].addAll(_exhardRGB);
        } else if (_stableSongDataMap["IIdx"][_i]["clear"] == "HARD") {
          _stableSongDataMap["IIdx"][_i].addAll(_hardRGB);
        } else if (_stableSongDataMap["IIdx"][_i]["clear"] == "NORMAL") {
          _stableSongDataMap["IIdx"][_i].addAll(_normalRGB);
        } else if (_stableSongDataMap["IIdx"][_i]["clear"] == "EASY") {
          _stableSongDataMap["IIdx"][_i].addAll(_easyRGB);
        } else if (_stableSongDataMap["IIdx"][_i]["clear"] == "ASSISTEDEASY") {
          _stableSongDataMap["IIdx"][_i].addAll(_assistedRGB);
        } else if (_stableSongDataMap["IIdx"][_i]["clear"] == "FAILED") {
          _stableSongDataMap["IIdx"][_i].addAll(_failedRGB);
        } else {
          print("status [clear] error");
        }
      } else if (_stableSongDataMap["IIdx"][_i].containsKey("clear") == false) {
        _stableSongDataMap["IIdx"][_i].addAll(_noPlayRGB);
      }
      _i++;
    }
  }

  void setVersionSelectedItem(String _path) {
    _versionSelectedItem = _path;
    print(_versionSelectedItem);
  }

  void setDifficultySelectedItem(String _path) {
    _difficultySelectedItem = _path;
    print(_difficultySelectedItem);
  }

  void setLevelSelectedItem(String _path){
    _levelSelectedItem = _path;
    print(_levelSelectedItem);
  }
}