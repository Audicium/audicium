// model to store the settings for the app
import 'dart:ffi';

import 'package:isar/isar.dart';

part 'settings.g.dart';

@Collection()
class Settings {
  Id id = 0;
  final bool isDarkMode;
  final List<String> genreList;
  List<double> playbackSpeeds;
  // const initList =
  // [
  //   'Action',
  //   'Adventure',
  //   'Comedy',
  //   'Drama',
  //   'Fantasy',
  //   'Horror',
  //   'Mystery',
  //   'Romance',
  //   'Sci-Fi',
  //   'Thriller'
  // ];

  Settings({
    this.playbackSpeeds = const [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0],
    this.isDarkMode = true,
    this.genreList = const [
      'Action',
      'Adventure',
      'Comedy',
      'Drama',
      'Fantasy',
      'Horror',
      'Mystery',
      'Romance',
      'Sci-Fi',
      'Thriller'
    ],
  });
}
