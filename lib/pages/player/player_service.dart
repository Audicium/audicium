import 'dart:io';

import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/player/controllers/desktop_player_controller.dart';
import 'package:audicium/pages/player/logic/mediakit_background_player.dart';
import 'package:audicium/pages/player/controllers/mobile_player_controller.dart';
import 'package:audicium/pages/player/logic/media_kit_player.dart';
import 'package:audicium/pages/player/logic/player_interface.dart';
import 'package:media_kit/media_kit.dart';

Future<void> initMediaPlayer() async {
  MediaKit.ensureInitialized();
  final player = MediaKitPlayer(mediaKit: Player());
  if (Platform.isWindows || Platform.isLinux) {
    getIt.registerSingleton<PlayerInterface>(
      DesktopPlayerController(player: player),
    );
  } else {
    final service = await initAudioService(player);
    getIt.registerSingleton<PlayerInterface>(
      MobilePlayerController(service),
    );
  }
}
