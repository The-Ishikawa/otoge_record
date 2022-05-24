import 'main.dart';

class SearchSongData{
  List _stableIDList = [];
  List _mutableIDList = [];
  Map _songDataMap = {};

  void search(String type, var content){
    _mutableIDList.clear();
    _stableIDList = songDataController.getStableIDList();
    _songDataMap = songDataController.getSongDataMap();
    for (var _i = 0; _i < _stableIDList.length; _i++) {
      if (_songDataMap["IIdx"][_i].containsKey(type) == false) {  //NO PLAY用
        _mutableIDList.add(_stableIDList[_i]);
      }
      else if (_songDataMap["IIdx"][_stableIDList[_i]][type] == content) {
        _mutableIDList.add(_stableIDList[_i]);
      }
    }
    songDataController.setMutableIDList(_mutableIDList);
  }


}