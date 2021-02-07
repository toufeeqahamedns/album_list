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
}
