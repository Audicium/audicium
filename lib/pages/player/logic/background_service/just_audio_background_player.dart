import 'package:audicium/constants/player.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

Future<JustAudioBackgroundPlayer> initJustAudioService() async {
  return AudioService.init(
    builder: JustAudioBackgroundPlayer.new,
    config: const AudioServiceConfig(
      androidNotificationChannelId:
          PlayerConstants.androidNotificationChannelId,
      androidNotificationChannelName:
          PlayerConstants.androidNotificationChannelName,
      androidNotificationOngoing: true,
      // todo add androidNotificationIcon
    ),
  );
}

class JustAudioBackgroundPlayer extends BaseAudioHandler {
  JustAudioBackgroundPlayer() {
    try {
      _loadEmptyPlaylist().then((value) => debugPrint('Playlist loaded'));
      _notifyAudioHandlerAboutPlaybackEvents();
      _listenForDurationChanges();
      _listenForCurrentSongIndexChanges();
      _listenForSequenceStateChanges();
    } catch (e) {
      debugPrint('Error initializing audio handler: $e');
    }
  }

  final player = AudioPlayer();
  final _playlist = ConcatenatingAudioSource(children: []);

  Future<void> _loadEmptyPlaylist() async {
    try {
      await player.setAudioSource(_playlist, preload: false);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _notifyAudioHandlerAboutPlaybackEvents() {
    player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
          MediaControl.skipToNext,
        ],
        systemActions: const {
          MediaAction.seek,
        },
        androidCompactActionIndices: const [0, 1, 3],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[player.processingState]!,
        repeatMode: const {
          LoopMode.off: AudioServiceRepeatMode.none,
          LoopMode.one: AudioServiceRepeatMode.one,
          LoopMode.all: AudioServiceRepeatMode.all,
        }[player.loopMode]!,
        shuffleMode: (player.shuffleModeEnabled)
            ? AudioServiceShuffleMode.all
            : AudioServiceShuffleMode.none,
        playing: playing,
        updatePosition: player.position,
        bufferedPosition: player.bufferedPosition,
        speed: player.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  void _listenForDurationChanges() {
    player.durationStream.listen((duration) {
      var index = player.currentIndex;
      final newQueue = queue.value;
      if (index == null || newQueue.isEmpty) return;
      if (player.shuffleModeEnabled) {
        index = player.shuffleIndices!.indexOf(index);
      }
      final oldMediaItem = newQueue[index];
      final newMediaItem = oldMediaItem.copyWith(duration: duration);
      newQueue[index] = newMediaItem;
      queue.add(newQueue);
      mediaItem.add(newMediaItem);
    });
  }

  void _listenForCurrentSongIndexChanges() {
    player.currentIndexStream.listen((index) {
      final playlist = queue.value;
      if (index == null || playlist.isEmpty) return;
      if (player.shuffleModeEnabled) {
        index = player.shuffleIndices!.indexOf(index);
      }
      mediaItem.add(playlist[index]);
    });
  }

  void _listenForSequenceStateChanges() {
    player.sequenceStateStream.listen((SequenceState? sequenceState) {
      final sequence = sequenceState?.effectiveSequence;
      if (sequence == null || sequence.isEmpty) return;
      final items = sequence.map((source) => source.tag as MediaItem);
      queue.add(items.toList());
    });
  }

  // queue controls
  @override
  Future<void> addQueueItems(List<MediaItem> mediaItems) async {
    await _playlist.clear();

    final sources = mediaItems.map(_createAudioSource).toList();
    await _playlist.addAll(sources);

    // notify system
    clearQueue();
    final newQueue = queue.value..addAll(mediaItems);
    queue.add(newQueue);
  }

  void clearQueue() {
    while (queue.value.isNotEmpty) {
      queue.value.removeLast();
    }
  }

  UriAudioSource _createAudioSource(MediaItem mediaItem) {
    return AudioSource.uri(
      // headers: mediaItem.extras!['headers'] as Map<String, String>?,
      Uri.parse(mediaItem.extras!['url'] as String),
      tag: mediaItem,
    );
  }

  // Direct Controls
  @override
  Future<void> play() async => player.play();

  @override
  Future<void> pause() async => player.pause();

  @override
  Future<void> seek(Duration position) async => player.seek(position);

  Future<void> seekToSpecificTrack(Duration position, int? index) async =>
      player.seek(position, index: index);

  @override
  Future<void> skipToNext() async => player.seekToNext();

  @override
  Future<void> skipToPrevious() async => player.seekToPrevious();

  @override
  Future<void> setSpeed(double speed) async => player.setSpeed(speed);

  // dispose methods
  @override
  Future<void> customAction(String name, [Map<String, dynamic>? extras]) async {
    if (name == 'dispose') {
      await player.dispose();
      await super.stop();
    }
  }

  @override
  Future<void> stop() async {
    await player.stop();
    return super.stop();
  }
}
