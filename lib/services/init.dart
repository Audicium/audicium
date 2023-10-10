import 'package:audicium/constants/utils.dart';
import 'package:audicium/services/isar_service.dart';
import 'package:audicium/services/library_manager.dart';

Future<void> initServices() async {
  getIt
    ..registerSingleton<IsarService>(await IsarService().init())
    ..registerSingleton<LibraryService>(LibraryService());
}
