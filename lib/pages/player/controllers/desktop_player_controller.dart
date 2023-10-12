import 'dart:async';

import 'package:audicium/constants/player.dart';
import 'package:audicium/pages/player/logic/media_kit_player.dart';
import 'package:audicium/pages/player/logic/player_interface.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:media_kit/media_kit.dart';

class DesktopPlayerController extends PlayerInterface {
  DesktopPlayerController({required MediaKitPlayer player}) {
    _player = player;
    setUpListeners();
  }

  late final MediaKitPlayer _player;

  void setUpListeners() {
    _listenToLogs();
    _listenToCurrentTrack();
    _listenToPlaybackState();
    _listenToCurrentPosition();
    _listenToBufferedPosition();
    _listenToTotalDuration();
    _listenToIsBuffering();
    _listenToIsComplete();
  }

  void _listenToLogs() {
    _player.mediaKit.stream.log.listen((event) {
      print('logsssssss');
      print(event);
    });
  }

  void _listenToIsComplete() {
    _player.mediaKit.stream.completed.listen((event) async {
      final playerState = _player.mediaKit.state;

      final currentIndex = playerState.playlist.index;
      final playlistLastIndex = playerState.playlist.medias.length - 1;

      if (currentIndex == playlistLastIndex) {
        await stop();
      }
    });
  }

  void _listenToCurrentTrack() {
    _player.stream.playlist.listen((event) {
      final playList = event.medias;
      // stopping the player will trigger this event
      if (playList.isEmpty) {
        isLastSong.value = true;
        isFirstSong.value = true;
        return;
      }
      isStopped.value = false;
      final current = event.index;
      final metaData = event.medias[current].extras;

      // for prev,next buttons
      updatePrevNextButts(current, playList, event);
      // for song title and image
      currentSongTitle.value =
          metaData?[PlayerConstants.metadataTitle] as String? ?? 'no title';
      currentImage.value =
          metaData?[PlayerConstants.metadataImage] as String? ?? '';
    });
  }

  void updatePrevNextButts(int current, List<Media> playList, Playlist event) {
    if (current == playList.length - 1 && current == 0) {
      isLastSong.value = true;
      isFirstSong.value = true;
    } else if (current == event.medias.length - 1) {
      isLastSong.value = true;
      isFirstSong.value = false;
    } else if (current == 0) {
      isLastSong.value = false;
      isFirstSong.value = true;
    } else {
      isLastSong.value = false;
      isFirstSong.value = false;
    }
  }

  void _listenToPlaybackState() {
    _player.stream.playing.listen((event) {
      if (event) {
        playButton.value = ButtonState.playing;
      } else {
        playButton.value = ButtonState.paused;
      }
    });
  }

  void _listenToCurrentPosition() {
    _player.stream.position.listen((current) {
      progressState.value = progressState.value.copyWith(
        current: current,
      );
    });
  }

  void _listenToBufferedPosition() {
    _player.stream.buffer.listen((buffered) {
      progressState.value = progressState.value.copyWith(
        buffered: buffered,
      );
    });
  }

  void _listenToTotalDuration() {
    _player.stream.duration.listen((total) {
      progressState.value = progressState.value.copyWith(
        total: total,
      );
    });
  }

  void _listenToIsBuffering() {
    _player.stream.buffering.listen((event) {
      if (event) {
        playButton.value = ButtonState.loading;
      } else {
        playButton.value = ButtonState.playing;
      }
    });
  }

  @override
  Future<void> playBook(
    AudioBook book, {
    Duration listenedPos = Duration.zero,
    int trackIndex = 0,
  }) async {
    final tracks = createMediaItems(book);
    await _player.openTracks(tracks);
    await skipToTrack(trackIndex: trackIndex, position: listenedPos);
    await play();
  }

  List<Media> createMediaItems(AudioBook book) {
    final metaData = {
      PlayerConstants.metadataAuthor: book.author ?? '',
      PlayerConstants.metadataImage: book.coverImage,
    };
    final headers = <String, String>{}; //TODO load from book

    final medias = book.bookUris
        .map(
          (e) => Media(
            e.getUri,
            httpHeaders: headers.isEmpty ? null : headers,
            extras: metaData
              ..addAll({
                PlayerConstants.metadataTitle: e.title ?? book.title ?? '',
              }),
          ),
        )
        .toList();
    return medias;
  }

  @override
  Future<void> next() => _player.next();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> previous() => _player.previous();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> seekBackward(Duration positionOffset) => _player.skipBackwards(
        positionOffset,
      );

  @override
  Future<void> seekForward(Duration positionOffset) => _player.skipForwards(
        positionOffset,
      );

  @override
  Future<void> setSpeed() => _player.setPlaybackRate(playbackSpeed.value);

  @override
  Future<void> stop() async {
    await _player.stop();
    isStopped.value = true;
    currentImage.value = '';
    currentSongTitle.value = '';
  }

  @override
  Future<void> skipToTrack({
    Duration position = Duration.zero,
    int trackIndex = 0,
  }) async {
    await _player.jumpTrack(trackIndex);
    await _player.seek(position);
  }
}
