import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otoge_record/main.dart';

import 'Provider_SongDataProvider.dart';

final songDataProvider =
ChangeNotifierProvider((ref) => SongDataProvider());  //provider

class HomeScreen extends ConsumerWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    songDataController.setReference(ref.read(songDataProvider));

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              width: _width * 0.95,
              height: _height * 0.20,
              margin: EdgeInsets.only(
                top: _height * 0.01
              ),
              color: Colors.white,
              child: Text(
                ref.watch(songDataProvider).songDataMap.toString(),
              ),
            ),

            Container(
              width: _width,
              height: _height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed:(){

                      },
                      child: const Text(
                        "search level12"
                      )
                  ),

                ],
              ),
            ),

            Expanded(
              child: SizedBox(
                width: _width * 0.95,
                child: ListView.builder(
                  itemCount: ref.watch(songDataProvider).idList.length,
                  itemBuilder: (BuildContext context, index){
                    return Card(
                      elevation: _height * 0.005,
                      margin: EdgeInsets.only(bottom: _height * 0.005),
                      child: SizedBox(
                        width: _width * 0.8,
                        height: _height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: _height * 0.05,
                              width: _width * 0.03,
                              color: Color.fromRGBO(
                                  ref.watch(songDataProvider).songDataMap["IIdx"]
                                  [ref.watch(songDataProvider).idList[index]]["red"],
                                  ref.watch(songDataProvider).songDataMap["IIdx"]
                                  [ref.watch(songDataProvider).idList[index]]["green"],
                                  ref.watch(songDataProvider).songDataMap["IIdx"]
                                  [ref.watch(songDataProvider).idList[index]]["blue"],
                                  1
                              ),

                            ),

                            Container(
                              height: _height * 0.05,
                              width: _width * 0.1,
                              color: Colors.black.withOpacity(0.6),
                              child: Center(
                                child: Text(
                                  ref.watch(songDataProvider).
                                  songDataMap["IIdx"][ref.watch(songDataProvider)
                                      .idList[index]]["level"].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _height * 0.035,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                height: _height * 0.05,
                                color: Colors.black.withOpacity(0.6),
                                child: Align(
                                  alignment: const Alignment(-0.95, 0),
                                  child: Text(
                                    ref.watch(songDataProvider).
                                    songDataMap["IIdx"][ref.watch(songDataProvider)
                                        .idList[index]]["name"].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _height * 0.035,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


}
