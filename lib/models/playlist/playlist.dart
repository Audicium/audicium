import 'package:isar/isar.dart';

part 'playlist.g.dart';

@Collection()
class BookPlaylist {
  Id id = Isar.autoIncrement;
  
  final String title;

  BookPlaylist({
    required this.id,
    required this.title,
  });
}
