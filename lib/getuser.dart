
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;

  Photo({this.albumId, this.id, this.title, this.url,});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }
}
