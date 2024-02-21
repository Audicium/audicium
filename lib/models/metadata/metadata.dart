import 'package:audicium/models/audiouri/audio_info.dart';
import 'package:audicium/models/time_stamps/time_stamps.dart';

/// Temporary model to store and display
/// audiobook metadata when browsing.
class BookMetaData {
  BookMetaData({
    this.title,
    this.author,
    this.description,
    this.coverImage,
    this.uploader,
    this.uploadDate,
    this.timeStamps,
    this.bookUris,
  });

  final String? title;
  final String? author;
  final String? description;
  final String? coverImage;
  final String? uploader;
  final DateTime? uploadDate;
  final List<TimeStamps>? timeStamps;
  final Stream<AudioInfo>? bookUris;
}
