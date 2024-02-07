import 'package:audicium/pages/player/ui/mobile/expanded_player.dart';
import 'package:audicium/pages/player/ui/mobile/minimized_player.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:vinyl/vinyl.dart';

class MobilePlayer extends StatelessWidget {
  // final MiniplayerController miniPlayerController;
  // final RxDouble currentPlayerPercent;

  const MobilePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final player = vinyl.player;
    return LayoutBuilder(
      builder: (_, constraints) {
        return Miniplayer(
          onDismiss: () async {
            await player.stop();
          },
          // controller: miniPlayerController,
          minHeight: constraints.maxHeight * 0.08,
          maxHeight: constraints.maxHeight,
          builder: (height, percentage) {
            final percent = percentage.abs();
            // currentPlayerPercent.value = percent;
            return percent >= 0.2
                ? ExpandedPlayer(percentage: percent)
                : MinimizedPlayer(percentage: percent);
          },
        );
      },
    );
  }
}

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final player = vinyl.player;
    return const MobilePlayer();
    // TODO add this later
    return ValueListenableBuilder(
      valueListenable: player.currentSongTitle,
      builder: (context, value, child) {
        print('rebuilding');
        return const MobilePlayer();
      },
    );
  }
}
