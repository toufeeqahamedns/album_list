import 'package:flutter/material.dart';

import './screens/album_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album List',
      theme: ThemeData(
        primaryColor: const Color(0xff01046d),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AlbumList(),
    );
  }
}
