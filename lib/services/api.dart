import 'dart:convert';

import 'package:album_list/models/album.dart';
import 'package:http/http.dart' as httpClient;

const API_ALBUMS_PHOTOS =
    'https://jsonplaceholder.typicode.com/albums/1/photos';

// TODO:
// Create a function for fetching data from `API_ALBUMS_PHOTOS`

class Api {
  Future<List<Album>> loadAlbums() async {
    final response = await httpClient.get(API_ALBUMS_PHOTOS);

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((album) => Album.fromJson(album)).toList();
    } else {
      throw Exception("Error in loading data");
    }
  }
}
