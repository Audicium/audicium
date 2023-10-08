import 'package:audicium_extension_base/audicium_extension_base.dart';
import 'package:audicium_galaxy_audiobooks/constants.dart';
import 'package:audicium_youtube/constants.dart';

final pluginsList = {
  youtubePlugin.name.toLowerCase(): youtubePlugin,
  galaxyPlugin.name.toLowerCase(): galaxyPlugin,
};

ExtensionController getController(String source) =>
    pluginsList[source]!.controllerFactory();
