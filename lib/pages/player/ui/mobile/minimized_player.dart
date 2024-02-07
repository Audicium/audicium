import 'package:flutter/material.dart';

/*
maybe reimplement mini-progress bar
*/

class MinimizedPlayer extends StatelessWidget {
  final double percentage;
  const MinimizedPlayer({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // normalized_value = (x - min) / (max - min)
    var max = 0.2;
    var min = 0.0;
    var normalizedOpacity = (percentage - min) / (max - min);
    var invert = 1 - normalizedOpacity;
    return Container();
  }
}

// Opacity(
// opacity: invert,
// child: const Column(
// children: [
// Row(
// mainAxisSize: MainAxisSize.max,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Expanded(
// child: Padding(
// padding: EdgeInsets.only(left: 10),
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: CurrentSongTitle(),
// ),
// ),
// ),
// Row(
// children: [
// Row(
// children: [
// PreviousSongButton(),
// PlayButton(),
// NextSongButton(),
// ],
// ),
// ],
// ),
// ],
// ),
// MiniProgressBar(),
// ],
// ),
// );
