// import 'dart:math';
//
// import 'package:audicium/features/player/logic/media_kit_player.dart';
// import 'package:audicium/utils/constants.dart';
// import 'package:audio_service/audio_service.dart';
// import 'package:media_kit/media_kit.dart';
//
// class TestPlayerHandler extends BaseAudioHandler {
//   @override
//   TestPlayerHandler({required this.player}) {
//     initBackgroundPlayer();
//     initListeners();
//   }
//
//   final randomIdGenerator = Random().nextDouble();
//   late final MediaKitPlayer player;
//
//   void initBackgroundPlayer() {
//     playbackState.add(
//       playbackState.value.copyWith(
//         controls: [
//           MediaControl.skipToPrevious,
//           MediaControl.pause,
//           MediaControl.stop,
//           MediaControl.skipToNext,
//         ],
//         systemActions: const {
//           MediaAction.seek,
//         },
//         androidCompactActionIndices: const [0, 1, 3],
//         playing: false,
//         processingState: AudioProcessingState.idle,
//       ),
//     );
//   }
//
//   void initListeners() {
//     _listenToCurrentTrackAndPlaylist();
//     _listenToPlaybackState();
//     _listenToPosition();
//     _listenToBufferedPosition();
//     _listenToIsBuffering();
//     _listenToIsComplete();
//   }
//
//   void _listenToCurrentTrackAndPlaylist() {
//     player.stream.playlist.listen((event) {
//       final playList = event.medias;
//
//       if (playList.isEmpty) {
//         queue.value = [];
//         return;
//       }
//
//       final current = event.index;
//       final title =
//           playList[current].extras?[PlayerConstants.metadataTitle] as String;
//
//       // create a new queue only if the a new playlist is loaded
//       if (queue.value.isEmpty || queue.value[current].title != title) {
//         // set new playlist
//         final items = playList.map(_createMediaItems).toList();
//         queue.value = items;
//         logger.i('New playlist set ${queue.value.length}');
//       }
//       mediaItem.value = queue.value[current];
//       logger.i('Playing ${mediaItem.value?.title}');
//     });
//   }
//
//   void _listenToPlaybackState() {
//     player.stream.playing.listen((event) {
//       playbackState.add(
//         playbackState.value.copyWith(
//           controls: [
//             MediaControl.skipToPrevious,
//             if (event) MediaControl.pause else MediaControl.play,
//             MediaControl.stop,
//             MediaControl.skipToNext,
//           ],
//           playing: event,
//         ),
//       );
//     });
//   }
//
//   void _listenToPosition() {
//     player.stream.position.listen((curPosition) {
//       playbackState.add(
//         playbackState.value.copyWith(
//           updatePosition: curPosition,
//         ),
//       );
//     });
//   }
//
//   void _listenToBufferedPosition() {
//     player.stream.buffer.listen((bufferedPosition) {
//       playbackState.add(
//         playbackState.value.copyWith(
//           bufferedPosition: bufferedPosition,
//         ),
//       );
//     });
//   }
//
//   void _listenToIsBuffering() {
//     player.stream.buffering.listen((event) {
//       playbackState.add(
//         playbackState.value.copyWith(
//           processingState:
//               event ? AudioProcessingState.loading : AudioProcessingState.ready,
//         ),
//       );
//     });
//   }
//
//   void _listenToIsComplete() {
//     player.stream.completed.listen((event) async {
//       final playerState = player.mediaKit.state;
//
//       final currentIndex = playerState.playlist.index;
//       final playlistLastIndex = playerState.playlist.medias.length - 1;
//
//       if (currentIndex == playlistLastIndex) {
//         await stop();
//         // notify the UI that the player is stopped
//         playbackState.add(
//           playbackState.value.copyWith(
//             processingState: AudioProcessingState.idle,
//           ),
//         );
//       }
//     });
//   }
//
//   // void totalDuration() {
//   //   player.stream.duration.listen((totalDuration) {
//   //     mediaItem.add(mediaItem.value.duration = totalDuration);
//   //     playbackState.add(
//   //       playbackState.value.copyWith(
//   //         duration: totalDuration,
//   //       ),
//   //     );
//   //   });
//   // }
//
//   MediaItem _createMediaItems(Media media) {
//     final title = media.extras?[PlayerConstants.metadataTitle] as String;
//     final author = media.extras?[PlayerConstants.metadataAuthor] as String;
//     final cover = media.extras?[PlayerConstants.metadataImage] as String;
//
//     final metaData = {
//       PlayerConstants.metadataAuthor: author,
//       PlayerConstants.metadataImage: cover,
//       PlayerConstants.metadataUri: media.uri
//     };
//
//     return MediaItem(
//       // don't keep the same id or the next and previous buttons wont work
//       id: randomIdGenerator.toString(),
//       title: title,
//       extras: metaData,
//       artUri: Uri.parse(cover),
//     );
//   }
// }
