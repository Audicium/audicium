import 'package:audicium/models/time_stamps/time_stamps.dart';

/// Model to store and display the audiobooks when browsing.
///
/// Used to display the audiobook in a list in the UI
///
/// These do not contain the playable audio urls.
class DisplayBook {
  DisplayBook({
    required this.title,
    required this.bookUrl,
    required this.coverImage,
    this.author,
    this.uploader,
    this.durationInSeconds,
    this.description,
    this.uploadDate,
    this.timeStamps,
  });

  factory DisplayBook.fromJson(Map<String, dynamic> json) {
    return DisplayBook(
      title: json['title'] as String,
      coverImage: json['coverImage'] as String?,
      bookUrl: json['bookUrl'] as String,
      uploader: json['uploader'] as String?,
      durationInSeconds: json['durationInSeconds'] as int?,
      description: json['description'] as String?,
      uploadDate: json['uploadDate'] == null
          ? null
          : DateTime.parse(
              json['uploadDate'] as String,
            ),
    );
  }

  final String title;
  final String bookUrl;
  String? coverImage;
  String? uploader;
  int? durationInSeconds;
  String? description;
  DateTime? uploadDate;
  List<TimeStamps>? timeStamps;
  String? author;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'coverImage': coverImage,
      'bookUrl': bookUrl,
      'uploader': uploader,
      'durationInSeconds': durationInSeconds,
      'description': description,
      'uploadDate': uploadDate?.toIso8601String(),
    };
  }
}
