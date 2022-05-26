import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otoge_record/main.dart';
import 'package:otoge_record/UI_HomeScreen.dart';

class SearchAndSortScreen extends ConsumerWidget{
  const SearchAndSortScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    songDataController.setReference(ref.read(songDataProvider));

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: _width,
              height: _height * 0.2,
              padding: EdgeInsets.only(
                bottom: _height * 0.005
              ),
              child: Column(
                children: [
                  Container(
                    width: _width,
                    height: _height * 0.05,
                    color: Colors.grey,
                    child: Text(
                      "Level",
                      style: TextStyle(
                        fontSize: _height * 0.035,
                      ),
                    )
                  ),

                  const Expanded(
                    child: DropDownLevelList(),
                  )

                ],
              ),
            ),



            Container(
              width: _width,
              height: _height * 0.2,
              padding: EdgeInsets.only(
                  bottom: _height * 0.005
              ),
              child: Column(
                children: [
                  Container(
                      width: _width,
                      height: _height * 0.05,
                      color: Colors.grey,
                      child: Text(
                        "Version",
                        style: TextStyle(
                          fontSize: _height * 0.035,
                        ),
                      )
                  ),
                  const Expanded(
                    child: DropDownVersionList(),
                  )
                ],
              ),
            ),

            Container(
              width: _width,
              height: _height * 0.2,
              padding: EdgeInsets.only(
                  bottom: _height * 0.005
              ),
              child: Column(
                children: [
                  Container(
                      width: _width,
                      height: _height * 0.05,
                      color: Colors.grey,
                      child: Text(
                        "Difficulty",
                        style: TextStyle(
                          fontSize: _height * 0.035,
                        ),
                      )
                  ),
                  const Expanded(
                    child: DropDownDifficultyList(),
                  )
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
                onPressed:(){
                  searchSongData.intensiveSearch();
                  print(songDataController.getIDList());
                },
                child: const Text(
                    "apply"
                )
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownVersionList extends StatefulWidget{
  const DropDownVersionList({Key? key}) : super(key: key);
  @override
  _DropDownVersionListState createState() => _DropDownVersionListState();
}

class _DropDownVersionListState extends State<DropDownVersionList>{
  String? _isSelectedItem = "ALL VERSION";

  @override
  Widget build(BuildContext context){
    return Center(
      child: DropdownButton(
        items: const [
          DropdownMenuItem(child: Text("ALL VERSION"), value: "ALL VERSION",),
          DropdownMenuItem(child: Text("1st Style"), value: "1st Style",),
          DropdownMenuItem(child: Text("substream"), value: "substream",),
          DropdownMenuItem(child: Text("2nd Style"), value: "2nd Style",),
          DropdownMenuItem(child: Text("3rd Style"), value: "3rd Style",),
          DropdownMenuItem(child: Text("4th Style"), value: "4th Style",),
          DropdownMenuItem(child: Text("5th Style"), value: "5th Style",),
          DropdownMenuItem(child: Text("6th Style"), value: "6th Style",),
          DropdownMenuItem(child: Text("7th Style"), value: "7th Style",),
          DropdownMenuItem(child: Text("8th Style"), value: "8th Style",),
          DropdownMenuItem(child: Text("9th Style"), value: "9th Style",),
          DropdownMenuItem(child: Text("10th Style"), value: "10th Style",),
          DropdownMenuItem(child: Text("IIDX RED"), value: "IIDX RED",),
          DropdownMenuItem(child: Text("HAPPY SKY"), value: "HAPPY SKY",),
          DropdownMenuItem(child: Text("Distorted"), value: "Distorted",),
          DropdownMenuItem(child: Text("GOLD"), value: "GOLD",),
          DropdownMenuItem(child: Text("DJ TROOPERS"), value: "DJ TROOPERS",),
          DropdownMenuItem(child: Text("EMPRESS"), value: "EMPRESS",),
          DropdownMenuItem(child: Text("SIRIUS"), value: "SIRIUS",),
          DropdownMenuItem(child: Text("Resort Anthem"), value: "Resort Anthem",),
          DropdownMenuItem(child: Text("Lincle"), value: "Lincle",),
          DropdownMenuItem(child: Text("tricoro"), value: "tricoro",),
          DropdownMenuItem(child: Text("SPADA"), value: "SPADA",),
          DropdownMenuItem(child: Text("PENDUAL"), value: "PENDUAL",),
          DropdownMenuItem(child: Text("copula"), value: "copula",),
          DropdownMenuItem(child: Text("SINOBUZ"), value: "SINOBUZ",),
          DropdownMenuItem(child: Text("CANNON BALLERS"), value: "CANNON BALLERS",),
          DropdownMenuItem(child: Text("Rootage"), value: "Rootage",),
          DropdownMenuItem(child: Text("HEROIC VERSE"), value: "HEROIC VERSE",),
          DropdownMenuItem(child: Text("BISTROVER"), value: "BISTROVER",),
          DropdownMenuItem(child: Text("CastHour"), value: "CastHour",),
        ],
        onChanged: (String? value){
          setState(() {
            _isSelectedItem = value;
            searchSongData.setVersionSelectedItem(value.toString());
          });
        },
        value: _isSelectedItem,
      ),
    );
  }
}

class DropDownDifficultyList extends StatefulWidget{
  const DropDownDifficultyList({Key? key}) : super(key: key);
  @override
  _DropDownDifficultyListState createState() => _DropDownDifficultyListState();
}

class _DropDownDifficultyListState extends State<DropDownDifficultyList>{
  String? _isSelectedItem = "ALL DIFFICULTY";

  @override
  Widget build(BuildContext context){
    return Center(
      child: DropdownButton(
        items: const [
          DropdownMenuItem(child: Text("ALL DIFFICULTY"), value: "ALL DIFFICULTY",),
          DropdownMenuItem(child: Text("BEGINNER"), value: "BEGINNER",),
          DropdownMenuItem(child: Text("NORMAL"), value: "NORMAL",),
          DropdownMenuItem(child: Text("HYPER"), value: "HYPER",),
          DropdownMenuItem(child: Text("ANOTHER"), value: "ANOTHER",),
          DropdownMenuItem(child: Text("LEGGENDARIA"), value: "LEGGENDARIA",),
        ],
        onChanged: (String? value){
          setState(() {
            _isSelectedItem = value;
            searchSongData.setDifficultySelectedItem(value.toString());
          });
        },
        value: _isSelectedItem,
      ),
    );
  }
}


class DropDownLevelList extends StatefulWidget{
  const DropDownLevelList({Key? key}) : super(key: key);
  @override
  _DropDownLevelListState createState() => _DropDownLevelListState();
}

class _DropDownLevelListState extends State<DropDownLevelList>{
  String? _isSelectedItem = "ALL LEVEL";

  @override
  Widget build(BuildContext context){
    return Center(
      child: DropdownButton(
        items: const [
          DropdownMenuItem(child: Text("ALL LEVEL"), value: "ALL LEVEL",),
          DropdownMenuItem(child: Text("LEVEL 1"), value: "1",),
          DropdownMenuItem(child: Text("LEVEL 2"), value: "2",),
          DropdownMenuItem(child: Text("LEVEL 3"), value: "3",),
          DropdownMenuItem(child: Text("LEVEL 4"), value: "4",),
          DropdownMenuItem(child: Text("LEVEL 5"), value: "5",),
          DropdownMenuItem(child: Text("LEVEL 6"), value: "6",),
          DropdownMenuItem(child: Text("LEVEL 7"), value: "7",),
          DropdownMenuItem(child: Text("LEVEL 8"), value: "8",),
          DropdownMenuItem(child: Text("LEVEL 9"), value: "9",),
          DropdownMenuItem(child: Text("LEVEL 10"), value: "10",),
          DropdownMenuItem(child: Text("LEVEL 11"), value: "11",),
          DropdownMenuItem(child: Text("LEVEL 12"), value: "12",),

        ],
        onChanged: (String? value){
          setState(() {
            _isSelectedItem = value;
            searchSongData.setLevelSelectedItem(value.toString());
          });
        },
        value: _isSelectedItem,
      ),
    );
  }
}