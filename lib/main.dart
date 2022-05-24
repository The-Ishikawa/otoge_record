///package
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otoge_record/Controller_SongDataController.dart';


///other dart files
import 'Provider_SongDataProvider.dart';
import 'UI_HomeScreen.dart';
import 'UI_BottomTabScreen.dart';
import 'Controller_SearchSongData.dart';

SongDataController songDataController = SongDataController();
SearchSongData searchSongData = SearchSongData();

void main() {
  WidgetsFlutterBinding.ensureInitialized();  //向きの固定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦に固定
  ]);
  runApp(
    const ProviderScope(
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'otoge_record',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{

  @override
  void initState(){
    super.initState();
    loadLocalJson();
    WidgetsBinding.instance!.addObserver(this);
  }

  Future loadLocalJson() async{
    String _jsonString = await rootBundle.loadString("assets/SongData.json");
    Map<dynamic, dynamic> _jsonData = json.decode(_jsonString);
    songDataController.setSongDataMap(_jsonData);
    songDataController.mapToIdList();
    songDataController.clearLampColorToMap();
  }

  @override
  void dispose(){
    print("dispose");
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    print("state = $state");
    switch (state) {
      case AppLifecycleState.inactive:
        print('非アクティブになったときの処理');
        break;
      case AppLifecycleState.paused:
        print('停止されたときの処理');
        break;
      case AppLifecycleState.resumed:
        print('再開されたときの処理');
        break;
      case AppLifecycleState.detached:
        print('破棄されたときの処理');
        break;
    }
  }

  @override
  Widget build(BuildContext context){
    return BottomTabPage();
  }
}
