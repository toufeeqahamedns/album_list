import 'package:album_list/models/album.dart';
import 'package:album_list/screens/edit_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Album album;

  DetailsScreen(this.album);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Id: ${album.id}")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: album.thumbnailUrl,
                placeholder: (_, __) => CircularProgressIndicator(),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                album.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              Spacer()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditScreen(
                        album: album,
                      )))),
    );
  }
}
