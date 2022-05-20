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
            SizedBox(
              width: _width * 0.9,
              height: _height * 0.2,
              child: Column(
                children: [
                  Container(
                    width: _width * 0.9,
                    height: _height * 0.1,
                    color: Colors.grey,
                    child: Text(
                      "Level",
                      style: TextStyle(
                        fontSize: _height * 0.035,
                      ),
                    )
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        for(var _i = 1; _i <= 6; _i++)
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    _i.toString(),
                                    style: TextStyle(
                                      fontSize: _height * 0.02,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Checkbox(

                                  ),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
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