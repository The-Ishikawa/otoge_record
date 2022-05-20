import 'package:flutter/material.dart';
import 'UI_HomeScreen.dart';
import 'UI_SearchAndSortScreen.dart';

class BottomTabPage extends StatefulWidget{
  const BottomTabPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _BottomTabPageState();
  }
}

class _BottomTabPageState extends State<BottomTabPage>{

  int _currentIndex = 0;
  final _pageWidgets = {
    const HomeScreen(),
    const SearchAndSortScreen(),
  };

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("IIDX results"),
      ),
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

}