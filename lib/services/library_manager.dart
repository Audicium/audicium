import 'package:audicium/constants/utils.dart';
import 'package:audicium/services/isar_service.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:isar/isar.dart';

//todo implement source fields in audiobook so that isar can use as a index and use where instead of filter

class LibraryService {
  final Isar isar = get<IsarService>().isar;

  IsarCollection<AudioBook> get audiobooks => isar.audioBooks;

  // insert new audiobook and update audiobook
  Future<void> saveAudiobook(AudioBook book) async =>
      await isar.writeTxn(() async {
        await audiobooks.put(book);
        // printInfo(info: 'Book updated/inserted : $result', printFunction: print);
      });

  // remove audiobook
  Future<void> removeAudioBook(int videoHash) async =>
      await isar.writeTxn(() async {
        await audiobooks.delete(videoHash);
        // printInfo(info: 'Book deleted : $result', printFunction: print);
      });

  // read audiobooks
  // keep fireImmediately true this will load result else it will wait
  Stream<List<AudioBook>> loadAllAudioBooks() =>
      audiobooks.where().build().watch(fireImmediately: true);

  Stream<List<AudioBook>> loadBySource(String source) => audiobooks
      .filter()
      .bookUrlContains(source)
      .build()
      .watch(fireImmediately: true);

  // helper functions
  Future<AudioBook?> isBookInLibrary(int urlHash) async =>
      await audiobooks.get(urlHash);

//genre modifiers
}
