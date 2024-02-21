import 'package:isar/isar.dart';

part 'audio_info.g.dart';

@embedded
class AudioInfo {
  AudioInfo({
    this.webUri,
    this.title,
    this.fileUri,
    this.durationInMilliseconds,
  });

  factory AudioInfo.fromJson(Map<String, dynamic> json) => AudioInfo(
        durationInMilliseconds: json['durationInMilliseconds'] as int?,
        title: json['title'] as String?,
        webUri: json['webUri'] as String,
        fileUri: json['fileUri'] as String?,
      );

  String? title;
  String? webUri;
  String? fileUri;
  int? durationInMilliseconds;

  @ignore
  Duration get duration => Duration(milliseconds: durationInMilliseconds ?? 0);

  String get getTitle => title ?? '';

  String get getUri => fileUri ?? webUri!;

  Map<String, dynamic> toJson() => {
        'durationInMilliseconds': durationInMilliseconds,
        'title': title,
        'webUri': webUri,
        'fileUri': fileUri,
      };
}
