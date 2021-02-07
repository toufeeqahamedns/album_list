import 'package:album_list/models/album.dart';
import 'package:album_list/services/api.dart';
import 'package:flutter/cupertino.dart';

enum AlbumState { LOADING, LOADED, ERROR }

class AlbumProvider with ChangeNotifier {
  AlbumState _albumState = AlbumState.LOADING;
  AlbumState get albumState => _albumState;

  List<Album> _albums = List();
  List<Album> get albums => _albums;

  AlbumProvider() : super() {
    getAlbums();
  }

  void getAlbums() async {
    try {
      _albums = await Api().loadAlbums();
      _albumState = AlbumState.LOADED;
      notifyListeners();
    } catch (e) {
      _albums = [];
      _albumState = AlbumState.ERROR;
      notifyListeners();
    }
  }

  Future<void> addOrEditAlbum(
      Album album, String albumCover, String albumTitle) async {
    if (albumCover.isEmpty) {
      throw Exception("Album Cover should not be empty");
    } else if (albumTitle.isEmpty) {
      throw Exception("Album Title should not be empty");
    } else {
      try {
        if (album != null) {
          int albumIndexToEdit =
              _albums.indexWhere((element) => element.id == album.id);
          _albums[albumIndexToEdit] = Album(
              albumId: album.id,
              id: album.id,
              thumbnailUrl: albumCover,
              url: albumCover,
              title: albumTitle);
          notifyListeners();
        } else {
          var currentAlbumLenght = _albums.length;
          _albums.insert(
              0,
              Album(
                  albumId: 1,
                  id: currentAlbumLenght + 1,
                  thumbnailUrl: albumCover,
                  url: albumCover,
                  title: albumTitle));
          notifyListeners();
        }
      } catch (e) {
        throw Exception("Something went wrong!!!");
      }
    }
  }
}
