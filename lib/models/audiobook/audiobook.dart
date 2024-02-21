import 'package:audicium/models/audiouri/audio_info.dart';
import 'package:audicium/models/source_models/browse_audiobook.dart';
import 'package:audicium/models/time_stamps/time_stamps.dart';
import 'package:isar/isar.dart';

part 'audiobook.g.dart';

@Collection()
class AudioBook extends DisplayBook {
  // modifiable genre string

  AudioBook({
    required this.bookUris,
    required super.coverImage,
    required super.bookUrl,
    required super.title,
    this.progress = 0,
    this.genre,
    super.author,
    super.uploader,
    super.description,
    super.uploadDate,
    super.timeStamps,
    super.durationInSeconds,
  });

  factory AudioBook.fromBrowseAudioBook({
    required DisplayBook book,
    required List<AudioInfo> bookUris,
  }) {
    final dur = book.durationInSeconds ??
        (bookUris.isNotEmpty
            ? bookUris.map((e) => e.duration.inSeconds).reduce((value, element) => value + element)
            : 0);
    return AudioBook(
      title: book.title,
      coverImage: book.coverImage,
      bookUrl: book.bookUrl,
      uploader: book.uploader,
      author: book.author,
      durationInSeconds: dur,
      description: book.description,
      uploadDate: book.uploadDate,
      bookUris: bookUris,
    );
  }

  factory AudioBook.fromJson(Map<String, dynamic> json) => AudioBook(
        author: json['author'] as String?,
        bookUris: List<AudioInfo>.from(
          (json['bookUris'] as List<Map<String, dynamic>>).map(
            AudioInfo.fromJson,
          ),
        ),
        bookUrl: json['bookUrl'] as String,
        coverImage: json['coverImage'] as String?,
        description: json['description'] as String?,
        durationInSeconds: json['durationInSeconds'] as int?,
        genre: json['genre'] as List<String>?,
        progress: json['progress'] as int? ?? 0,
        timeStamps: json['timeStamps'] as List<TimeStamps>?,
        title: json['title'] as String,
        // uploadDate: DateTime.fromMillisecondsSinceEpoch(json["uploadDate"]),
        uploader: json['uploader'] as String?,
      );

  Id get videoHash => fastHash(super.bookUrl);

  final List<AudioInfo> bookUris; // the actually playable link
  final int progress; // last listened duration in seconds
  final List<String>? genre;

  @override
  Map<String, dynamic> toJson() => {
        'author': author,
        'bookUris': List<AudioInfo>.from(bookUris.map((x) => x.toJson())),
        'bookUrl': bookUrl,
        'coverImage': coverImage,
        'description': description,
        'durationInSeconds': durationInSeconds,
        'genre': genre,
        'progress': progress,
        'timeStamps': timeStamps,
        'title': title,
        'uploadDate': uploadDate,
        'uploader': uploader,
        'videoHash': videoHash,
      };

  AudioBook copyWith({
    List<AudioInfo>? bookUris,
    String? coverImage,
    String? bookUrl,
    String? title,
    int? progress,
    List<String>? genre,
    String? author,
    String? uploader,
    String? description,
    DateTime? uploadDate,
    List<TimeStamps>? timeStamps,
    int? durationInSeconds,
  }) {
    return AudioBook(
      bookUris: bookUris ?? this.bookUris,
      coverImage: coverImage ?? this.coverImage,
      bookUrl: bookUrl ?? this.bookUrl,
      title: title ?? this.title,
      progress: progress ?? this.progress,
      genre: genre ?? this.genre,
      author: author ?? this.author,
      uploader: uploader ?? this.uploader,
      description: description ?? this.description,
      uploadDate: uploadDate ?? this.uploadDate,
      timeStamps: timeStamps ?? this.timeStamps,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
    );
  }
}

/// Reference https://isar.dev/recipes/string_ids.html
/// FNV-1a 64bit hash algorithm optimized for Dart Strings
int fastHash(String string) {
  // possible web bug here
  // Integer literal can't be represented exactly when compiled to JavaScript.
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
