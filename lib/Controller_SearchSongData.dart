import 'main.dart';

class SearchSongData{
  String _versionSelectedItem = "ALL VERSION";
  String _difficultySelectedItem = "ALL DIFFICULTY";
  String _levelSelectedItem = "ALL LEVEL";
  String _clearSelectedItem = "ALL";
  List _stableIDList = [];
  List _mutableIDList = [];
  Map _songDataMap = {};

  void setVersionSelectedItem(String _path) {
    _versionSelectedItem = _path;
    print(_versionSelectedItem);  //デバッグ
  }
  String getVersionSelectedItem(){
    return _versionSelectedItem;
  }
  void setDifficultySelectedItem(String _path) {
    _difficultySelectedItem = _path;
    print(_difficultySelectedItem); //debug
  }
  String getDifficultySelectedItem(){
    return _difficultySelectedItem;
  }
  void setLevelSelectedItem(String _path){
    _levelSelectedItem = _path;
    print(_levelSelectedItem);  //debug
  }
  String getLevelSelectedItem(){
    return _levelSelectedItem;
  }
  void setClearSelectedItem(String _path){
    _clearSelectedItem = _path;
    print(_clearSelectedItem);  //debug
  }
  String getClearSelectedItem(){
    return _clearSelectedItem;
  }

  void intensiveSearch(){
    _mutableIDList.clear();
    _stableIDList = songDataController.getStableIDList();
    _songDataMap = songDataController.getSongDataMap();

    for (var _i = 0; _i < _stableIDList.length; _i++) {
      if ((_levelSelectedItem == "ALL LEVEL" || _songDataMap["IIdx"][_stableIDList[_i]]["level"] == _levelSelectedItem)&&
          (_difficultySelectedItem == "ALL DIFFICULTY" || _songDataMap["IIdx"][_stableIDList[_i]]["difficulty"] == _difficultySelectedItem)&&
          (_versionSelectedItem == "ALL VERSION" || _songDataMap["IIdx"][_stableIDList[_i]]["versionName"] == _versionSelectedItem) &&
          (_clearSelectedItem == "ALL" || _songDataMap["IIdx"][_stableIDList[_i]]["clear"] == _clearSelectedItem)
      ){
        _mutableIDList.add(_stableIDList[_i]);
        print(_mutableIDList);
      }
    }
    songDataController.setMutableIDList(_mutableIDList);
  }
}