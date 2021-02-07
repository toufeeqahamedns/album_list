import 'package:album_list/models/album.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.check), onPressed: () => null),
    );
  }
}
