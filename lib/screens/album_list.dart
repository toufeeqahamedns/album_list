import 'package:album_list/providers/album_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

// TODO:
// 1. Create a list view to display the album data from the fetching function in `api.dart`
// 2. The item of the list should contain the album's thumbnail and title

class AlbumList extends StatelessWidget {
  const AlbumList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Album List'),
      ),
      body: Consumer(
        builder:
            (BuildContext context, AlbumProvider albumProvider, Widget child) {
          switch (albumProvider.albumState) {
            case AlbumState.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case AlbumState.ERROR:
              return Center(
                child: Text("There was an error loading data"),
              );
              break;
            case AlbumState.LOADED:
              return ListView.builder(
                  itemCount: albumProvider.albums.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: albumProvider.albums[index].thumbnailUrl,
                            placeholder: (_, __) => CircularProgressIndicator(),
                          ),
                          title: Text(albumProvider.albums[index].title),
                          onTap: () => null),
                    );
                  });
              break;
            default:
              return Center(child: Text("Fetching albums"));
          }
        },
      ),
    );
  }
}
