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

    return Scaffold(
      appBar: AppBar(
        title: const Text("listview"),
      ),
      body: Container(
        height: _height,
        width: _width,
        color: Colors.grey,

      ),
    );
  }


}
