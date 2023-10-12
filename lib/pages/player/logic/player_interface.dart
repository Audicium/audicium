import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/cupertino.dart';

enum ButtonState {
  paused,
  playing,
  loading,
}

class ProgressBarState {
  const ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });

  final Duration current;
  final Duration buffered;
  final Duration total;

  ProgressBarState copyWith({
    Duration? current,
    Duration? buffered,
    Duration? total,
  }) {
    return ProgressBarState(
      current: current ?? this.current,
      buffered: buffered ?? this.buffered,
      total: total ?? this.total,
    );
  }
}

abstract class PlayerInterface {
  final isStopped = ValueNotifier(true);
  final currentSongTitle = ValueNotifier('');
  final currentImage = ValueNotifier('');
  final playbackSpeed = ValueNotifier<double>(1);
  // final currentIndex = ValueNotifier('');
  final progressState = ValueNotifier(
    const ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  final isFirstSong = ValueNotifier(true);
  final isLastSong = ValueNotifier(true);
  final playButton = ValueNotifier(ButtonState.paused);

  // final isShuffleModeEnabled = ValueNotifier(false);

  Future<void> playBook(
    AudioBook book, {
    Duration listenedPos = Duration.zero,
    int trackIndex = 0,
  });

  Future<void> play();

  Future<void> pause();

  Future<void> next();

  Future<void> previous();

  Future<void> setSpeed();

  Future<void> seek(Duration position);

  Future<void> skipToTrack({
    Duration position = Duration.zero,
    int trackIndex = 0,
  });

  Future<void> seekForward(Duration positionOffset);

  Future<void> seekBackward(Duration positionOffset);

  Future<void> stop();
}
