import 'dart:async';
import 'dart:math';
import 'package:audicium/constants/player.dart';
import 'package:audicium/pages/player/logic/mediakit_background_player.dart';
import 'package:audicium/pages/player/logic/player_interface.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

class MobilePlayerController extends PlayerInterface {
  MobilePlayerController(MediaKitBackgroundPlayer audioHandler) {
    _audioHandler = audioHandler;
    init();
  }

  late final MediaKitBackgroundPlayer _audioHandler;

  void init() {
    try {
      _listenToChangesInPlaylist();
      _listenToPlaybackState();
      _listenToCurrentPosition();
      _listenToBufferedPosition();
      _listenToTotalDuration();
      _listenToChangesInSong();
    } catch (e) {
      debugPrint('error initializing player-controller $e');
    }
  }

  final queue = ValueNotifier<List<String>>([]);

  void _listenToChangesInPlaylist() {
    _audioHandler.queue.listen((playlist) {
      if (playlist.isEmpty) {
        queue.value = [];
        currentSongTitle.value = '';
      } else {
        // keep this in a separate variable to avoid
        // weird bug with ui not update
        final newList = playlist.map((item) => item.title).toList();
        queue.value = newList;
      }
      _updateSkipButtons();
    });
  }

  void _listenToPlaybackState() {
    _audioHandler.playbackState.listen((playbackState) {
      if (queue.value.isNotEmpty) {
        final isPlaying = playbackState.playing;
        final processingState = playbackState.processingState;
        if (processingState == AudioProcessingState.loading ||
            processingState == AudioProcessingState.buffering) {
          playButton.value = ButtonState.loading;
        } else if (!isPlaying) {
          playButton.value = ButtonState.paused;
        } else if (processingState != AudioProcessingState.completed) {
          playButton.value = ButtonState.playing;
        }
      } else {
        playButton.value = ButtonState.paused;
      }
    });
  }

  void _listenToCurrentPosition() {
    AudioService.position.listen((position) {
      progressState.value = progressState.value.copyWith(
        current: position,
      );
    });
  }

  void _listenToBufferedPosition() {
    _audioHandler.playbackState.listen((playbackState) {
      progressState.value = progressState.value.copyWith(
        buffered: playbackState.bufferedPosition,
      );
    });
  }

  void _listenToTotalDuration() {
    _audioHandler.mediaItem.listen((mediaItem) {
      progressState.value = progressState.value.copyWith(
        total: mediaItem?.duration ?? Duration.zero,
      );
    });
  }

  void _listenToChangesInSong() {
    _audioHandler.mediaItem.listen((mediaItem) {
      currentSongTitle.value = mediaItem?.title ?? '';
      currentImage.value =
          mediaItem?.artUri.toString() ?? Icons.music_note.toString();
      _updateSkipButtons();
    });
  }

  void _updateSkipButtons() {
    final mediaItem = _audioHandler.mediaItem.value;
    final playlist = _audioHandler.queue.value;

    if (playlist.length < 2 || mediaItem == null) {
      isFirstSong.value = true;
      isLastSong.value = true;
    } else {
      isFirstSong.value = playlist.first == mediaItem;
      isLastSong.value = playlist.last == mediaItem;
    }
  }

  @override
  Future<void> play() async {
    await _audioHandler.play();
  }

  @override
  Future<void> pause() async {
    await _audioHandler.pause();
  }

  @override
  Future<void> seek(Duration position, {int? trackIndex}) async {
    await _audioHandler.seek(position);
  }

  @override
  Future<void> seekForward(Duration positionOffset) async {
    final seekVal = progressState.value.current + positionOffset;
    if (seekVal >= progressState.value.total) {
      await _audioHandler.seek(progressState.value.total);
      return;
    }
    await _audioHandler.seek(seekVal);
  }

  @override
  Future<void> seekBackward(Duration positionOffset) async {
    final seekVal = progressState.value.current - positionOffset;
    if (seekVal <= Duration.zero) {
      await _audioHandler.seek(Duration.zero);
      return;
    }
    await _audioHandler.seek(seekVal);
  }

  @override
  Future<void> previous() async => _audioHandler.skipToPrevious();

  @override
  Future<void> next() async => _audioHandler.skipToNext();

  @override
  Future<void> setSpeed() async => _audioHandler.setSpeed(playbackSpeed.value);

  Future<void> customDispose() async => _audioHandler.customAction('dispose');

  @override
  Future<void> stop() async => _audioHandler.stop();

  Future<List<Media>> createMedia(AudioBook book) async {
    final rand = Random();
    final mediaItems = <MediaItem>[];
    final mediaKitItems = <Media>[];

    final headers = <String, String>{}; //TODO add headers to audiobook model

    for (final track in book.bookUris) {
      final metaData = {
        PlayerConstants.metadataTitle: track.title ?? book.title,
        PlayerConstants.metadataAuthor: book.author ?? '',
        PlayerConstants.metadataImage: book.coverImage ??
            'https://wallpapers.com/images/hd/rick-and-morty-under-the-cosmic-sky-s4sbibvafaybc47x.webp',
      };

      final mediaKitItem = Media(
        track.getUri,
        extras: metaData,
        httpHeaders: headers.isEmpty ? null : headers,
      );

      mediaKitItems.add(mediaKitItem);
    }

    return mediaKitItems;
  }

  @override
  Future<void> playBook(
    AudioBook book, {
    Duration listenedPos = Duration.zero,
    int trackIndex = 0,
  }) async {
    final items = await createMedia(book);
    await _audioHandler.player.openTracks(items);
    await skipToTrack(position: listenedPos, trackIndex: trackIndex);
    await play();
  }

  @override
  Future<void> skipToTrack({
    Duration position = Duration.zero,
    int trackIndex = 0,
  }) async {
    await _audioHandler.skipToQueueItem(trackIndex);
    await seek(position);
  }
}
