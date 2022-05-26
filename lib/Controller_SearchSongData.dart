import 'main.dart';

class SearchSongData{
  String _versionSelectedItem = "ALL VERSION";
  String _difficultySelectedItem = "ALL DIFFICULTY";
  String _levelSelectedItem = "ALL LEVEL";
  List _stableIDList = [];
  List _mutableIDList = [];
  Map _songDataMap = {};

  void setVersionSelectedItem(String _path) {
    _versionSelectedItem = _path;
    print(_versionSelectedItem);  //デバッグ
  }
  void setDifficultySelectedItem(String _path) {
    _difficultySelectedItem = _path;
    print(_difficultySelectedItem); //debug
  }
  void setLevelSelectedItem(String _path){
    _levelSelectedItem = _path;
    print(_levelSelectedItem);  //debug
  }

  void search(String type, var content){
    _mutableIDList.clear();
    _stableIDList = songDataController.getStableIDList();
    _songDataMap = songDataController.getSongDataMap();
    for (var _i = 0; _i < _stableIDList.length; _i++) {
      if (_songDataMap["IIdx"][_stableIDList[_i]][type] == content) {
        _mutableIDList.add(_stableIDList[_i]);
      }else{
        print("search error");  //debug
      }
    }
    songDataController.setMutableIDList(_mutableIDList);
  }

  void intensiveSearch(){
    _mutableIDList.clear();
    _stableIDList = songDataController.getStableIDList();
    _songDataMap = songDataController.getSongDataMap();

    for (var _i = 0; _i < _stableIDList.length; _i++) {
      if ((_songDataMap["IIdx"][_stableIDList[_i]]["level"] == "ALL LEVEL" || _songDataMap["IIdx"][_stableIDList[_i]]["level"] == _levelSelectedItem)&&
          (_songDataMap["IIdx"][_stableIDList[_i]]["difficulty"] == "ALL DIFFICULTY" || _songDataMap["IIdx"][_stableIDList[_i]]["difficulty"] == _difficultySelectedItem)&&
          (_songDataMap["IIdx"][_stableIDList[_i]]["versionName"] == "ALL VERSION" || _songDataMap["IIdx"][_stableIDList[_i]]["versionName"] == _versionSelectedItem)
      ){
        _mutableIDList.add(_stableIDList[_i]);
        print(_mutableIDList);
      }
    }
    songDataController.setMutableIDList(_mutableIDList);
  }

}