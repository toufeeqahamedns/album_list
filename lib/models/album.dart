class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Album({this.albumId, this.id, this.thumbnailUrl, this.title, this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumId: json["albumId"],
      id: json["id"],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"],
    );
  }
}