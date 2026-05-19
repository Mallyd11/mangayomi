import 'package:mangayomi/eval/javascript/http.dart';

class Video {
  String url;
  String quality;
  String originalUrl;
  Map<String, String>? headers;
  List<Track>? subtitles;
  List<Track>? audios;
  double? introStart;
  double? introEnd;
  double? outroStart;
  double? outroEnd;

  Video(
    this.url,
    this.quality,
    this.originalUrl, {
    this.headers,
    this.subtitles,
    this.audios,
    this.introStart,
    this.introEnd,
    this.outroStart,
    this.outroEnd,
  });
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      json['url'].toString().trim(),
      json['quality'].toString().trim(),
      json['originalUrl'].toString().trim(),
      headers: (json['headers'] as Map?)?.toMapStringString,
      subtitles: json['subtitles'] != null
          ? (json['subtitles'] as List).map((e) => Track.fromJson(e)).toList()
          : [],
      audios: json['audios'] != null
          ? (json['audios'] as List).map((e) => Track.fromJson(e)).toList()
          : [],
      introStart: (json['introStart'] as num?)?.toDouble(),
      introEnd: (json['introEnd'] as num?)?.toDouble(),
      outroStart: (json['outroStart'] as num?)?.toDouble(),
      outroEnd: (json['outroEnd'] as num?)?.toDouble(),
    );
  }
  Map<String, dynamic> toJson() => {
    'url': url,
    'quality': quality,
    'originalUrl': originalUrl,
    'headers': headers,
    'subtitles': subtitles?.map((e) => e.toJson()).toList(),
    'audios': audios?.map((e) => e.toJson()).toList(),
    if (introStart != null) 'introStart': introStart,
    if (introEnd != null) 'introEnd': introEnd,
    if (outroStart != null) 'outroStart': outroStart,
    if (outroEnd != null) 'outroEnd': outroEnd,
  };
}

class Track {
  String? file;
  String? label;

  Track({this.file, this.label});
  Track.fromJson(Map<String, dynamic> json) {
    file = json['file']?.toString().trim();
    label = json['label']?.toString().trim();
  }
  Map<String, dynamic> toJson() => {'file': file, 'label': label};
}
