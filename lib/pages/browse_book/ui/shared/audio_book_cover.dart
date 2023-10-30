import 'package:audicium/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AudioBookCover extends StatelessWidget {
  const AudioBookCover({
    required this.coverImageUrl,
    required this.heightPercent,
    required this.widthPercent,
    super.key,
  });

  final String coverImageUrl;
  final double heightPercent;
  final double widthPercent;

  // final BuildContext ctx;
  // final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: coverImageUrl,
      placeholder: (context, url) => imageContainer(
        ctx: context,
        image: const AssetImage(AppAssets.defaultIcon),
      ),
      errorWidget: (context, url, error) => imageContainer(
        ctx: context,
        image: const AssetImage(AppAssets.defaultIcon),
      ),
      imageBuilder: (context, imageProvider) =>
          imageContainer(ctx: context, image: imageProvider),
    );
  }

  Container imageContainer({
    required BuildContext ctx,
    required ImageProvider<Object> image,
  }) {
    return Container(
      height: MediaQuery.of(ctx).size.height * heightPercent,
      width: MediaQuery.of(ctx).size.height * widthPercent,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
    );
  }
}
