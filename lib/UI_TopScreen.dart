import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otoge_record/main.dart';

import 'Provider_SongDataProvider.dart';

final songDataProvider =
ChangeNotifierProvider((ref) => SongDataProvider());  //provider

class TopScreen extends ConsumerWidget{
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    print(ref.watch(songDataProvider).idListNum);

    return Scaffold(
      appBar: AppBar(
        title: const Text("listview"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Center(
          child: SizedBox(
            width: _width * 0.7,
            height: _height * 0.7,
            child: ListView.builder(
              itemCount: ref.watch(songDataProvider).idListNum,
              itemBuilder: (BuildContext context, index){
                return Container(
                  width: _width * 0.7,
                  height: _height * 0.1,
                  color: Colors.blue,
                );
              },
            ),
          ),
        ),
      ),
    );
  }


}
