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

                  for(var _j = 0; _j <= 1; _j++)
                  Expanded(
                    child: Row(
                      children: [
                        for(var _i = 0; _i <= 5; _i++)
                          Expanded(
                            child: Column(
                              children: [
                                const Expanded(
                                    child: SizedBox()
                                ),

                                Expanded(
                                  child: Text(
                                    (_i + 1 + (_j * 6)).toString(),
                                    style: TextStyle(
                                      fontSize: _height * 0.02,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Checkbox(
                                    value: ref.watch(songDataProvider).checkBoxValue[_i + (_j * 6)],
                                    onChanged: (ref){
                                      songDataController.changeCheckBoxValue(_i + (_j * 6));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
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
                        "difficulty",
                        style: TextStyle(
                          fontSize: _height * 0.035,
                        ),
                      )
                  ),
                  const Expanded(
                    child: DropDownList(),
                  )



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropDownList extends StatefulWidget{
  const DropDownList({Key? key}) : super(key: key);
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList>{
  String? isSelectedItem = "ALL VERSION";

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
            isSelectedItem = value;
            songDataController.setDifficultySelectedItem(value.toString());
          });
        },
        value: isSelectedItem,
      ),
    );
  }
}