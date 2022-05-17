import 'package:flutter/material.dart';

class SongDataProvider extends ChangeNotifier{
  Map _SongDataMap = {};

  Map get SongDataMap => _SongDataMap;

  void setSongDataMap(Map _path){
    _SongDataMap = _path;
    notifyListeners();
  }
}