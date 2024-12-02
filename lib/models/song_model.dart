class SongModel {
  final String? id;
  final String? title;
  final String? album;
  final String? artist;
  final String? genre;
  final String? source;
  final String? image;
  final int? trackNumber;
  final int? totalTrackCount;
  final int? duration;
  final String? site;

  SongModel({
    this.id,
    this.title,
    this.album,
    this.artist,
    this.genre,
    this.source,
    this.image,
    this.trackNumber,
    this.totalTrackCount,
    this.duration,
    this.site,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      title: json['title'],
      album: json['album'],
      artist: json['artist'],
      genre: json['genre'],
      source: json['source'],
      image: json['image'],
      trackNumber: json['trackNumber'],
      totalTrackCount: json['totalTrackCount'],
      duration: json['duration'],
      site: json['site'],
    );
  }
}
