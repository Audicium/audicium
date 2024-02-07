import 'package:flutter/material.dart';

class ExpandedPlayer extends StatelessWidget {
  final double percentage;

  const ExpandedPlayer({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // normalized_value = (x - min) / (max - min)
    var normalizedOpacity = (percentage - 0.2) / (1.0 - 0.2);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Opacity(
        opacity: normalizedOpacity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 80),
            // buildContent(),
            const SizedBox(height: 60),
            // buildPlayerControls(),
          ],
        ),
      ),
    );
  }

  // Widget buildContent() {
  //   return const Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       CurrentSongTitle(),
  //       SizedBox(height: 25),
  //       CurrentSongImage(),
  //       SizedBox(height: 25),
  //       Padding(
  //         padding: EdgeInsets.all(10.0),
  //         child: Text('By - Author name'),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget buildPlayerControls() {
  //   return const Padding(
  //     padding: EdgeInsets.all(20.0),
  //     child: AudioControlButtons(),
  //   );
  // }
}

// class CurrentSongImage extends StatelessWidget {
//   const CurrentSongImage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: CachedNetworkImage(
//         imageUrl: controller.currentImage.value,
//         fit: BoxFit.cover,
//         placeholder: (context, url) => const CircularProgressIndicator(),
//         errorWidget: (context, url, error) => const Icon(Icons.error),
//       ),
//     );
//   }
// }
//
// class AudioControlButtons extends StatelessWidget {
//   const AudioControlButtons({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           AudioProgressBar(),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               PreviousSongButton(),
//               PlayButton(),
//               NextSongButton(),
//               PlaybackSpeedButton(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
