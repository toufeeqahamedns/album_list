import 'package:album_list/providers/album_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/album_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => AlbumProvider(),
        child: MaterialApp(
          title: 'Album List',
          theme: ThemeData(
            primaryColor: const Color(0xff01046d),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const AlbumList(),
        ));
  }
}
