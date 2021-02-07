import 'dart:math';

import 'package:album_list/models/album.dart';
import 'package:album_list/providers/album_provider.dart';
import 'package:album_list/screens/album_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final Album album;

  EditScreen({this.album});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController albumCoverController;
  TextEditingController albumTitleController;

  @override
  void initState() {
    super.initState();
    albumCoverController =
        TextEditingController(text: widget.album?.thumbnailUrl);
    albumTitleController = TextEditingController(text: widget.album?.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: widget.album != null
              ? Text("Id: ${widget.album.id}")
              : Text('New Album')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              maxLines: null,
              controller: albumCoverController,
              decoration: InputDecoration(labelText: "Album cover url"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              maxLines: null,
              controller: albumTitleController,
              decoration: InputDecoration(labelText: "Album title"),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: Consumer(builder:
          (BuildContext context, AlbumProvider albumProvider, Widget child) {
        return FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () async {
              await albumProvider
                  .addOrEditAlbum(widget.album, albumCoverController.text,
                      albumTitleController.text)
                  .then((_) => handleBackToHome(),
                      onError: (e) =>
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e.message),
                          )));
            });
      }),
    );
  }

  void handleBackToHome() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      handleBackToHome();
    }
  }
}
