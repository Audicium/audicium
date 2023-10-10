import 'package:audicium_models/audicium_models.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late final Isar isar;

  Future<IsarService> init() async {
    isar = await Isar.open(
      [BookPlaylistSchema, AudioBookSchema, SettingsSchema],
      directory: (await getApplicationDocumentsDirectory()).path,
    );
    return this;
  }
}
