import 'package:audicium_extension_base/audicium_extension_base.dart';
import 'package:audicium_youtube/constants.dart';
import 'package:hotaudiobooks/constants.dart';

final pluginsList = {
  youtubePlugin.name.toLowerCase(): youtubePlugin,
  hotAudioBooksPlugin.name.toLowerCase(): hotAudioBooksPlugin,
};

ExtensionController getController(String source) =>
    pluginsList[source]!.controllerFactory();
