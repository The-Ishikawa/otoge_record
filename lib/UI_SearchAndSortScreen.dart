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



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}