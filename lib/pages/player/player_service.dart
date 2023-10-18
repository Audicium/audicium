import 'dart:io';

import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/player/controllers/desktop_player_controller.dart';
import 'package:audicium/pages/player/controllers/mobile_player_controller.dart';
import 'package:audicium/pages/player/logic/background_service/just_audio_background_player.dart';
import 'package:audicium/pages/player/logic/media_kit_player.dart';
import 'package:audicium/pages/player/logic/player_interface.dart';
import 'package:media_kit/media_kit.dart';

Future<void> initMediaPlayer() async {
  // TODO: figure out media-kit with background play using audio service
  // until then use just audio for android and ios, web
  final isJustAudioNotCompatible = Platform.isWindows || Platform.isLinux;

  if (isJustAudioNotCompatible) {
    MediaKit.ensureInitialized();
    final mediaKitService = MediaKitPlayer(mediaKit: Player());
    getIt.registerSingleton<PlayerInterface>(
      DesktopPlayerController(player: mediaKitService),
    );
  } else {
    final justAudioService = await initJustAudioService();
    getIt.registerSingleton<PlayerInterface>(
      MobilePlayerController(audioHandler: justAudioService),
    );
  }
}
