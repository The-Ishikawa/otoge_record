import 'main.dart';

class SortSongData{
  List _mutableIDList = [];
  Map _songDataMap = {};
  Map _intensiveMap = {};

  void intensiveSort(){
    _mutableIDList = songDataController.getIDList();
    _songDataMap = songDataController.getSongDataMap();

    //level

  }
}