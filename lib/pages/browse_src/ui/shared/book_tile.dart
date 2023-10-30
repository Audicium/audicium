import 'package:audicium/constants/assets.dart';
import 'package:audicium/constants/extensions.dart';
import 'package:audicium/navigation/navigation_routes.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookTile extends StatelessWidget {
  const BookTile({
    required this.book,
    super.key,
  });

  final DisplayBook book;

  @override
  Widget build(BuildContext context) {
    final coverImage = book.coverImage;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => gotoDetailsScreen(context),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: thumbnailBuilder(coverImage ?? AppAssets.defaultIcon),
        ),
      ),
    );
  }

  CachedNetworkImage thumbnailBuilder(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: (context, url, error) =>
          buildGridBox(const AssetImage(AppAssets.defaultIcon)),
      placeholder: (context, url) =>
          buildGridBox(const AssetImage(AppAssets.defaultIcon)),
      imageBuilder: (context, imageProvider) => buildGridBox(imageProvider),
      useOldImageOnUrlChange: true,
    );
  }

  Container buildGridBox(ImageProvider<Object> imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: buildBody(),
    );
  }

  Stack buildBody() {
    final bookTitle = book.title;
    final uploader = book.uploader;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  bookTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                if (uploader != null && uploader.isNotEmpty)
                  Text(
                    'Uploaded by $uploader',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void gotoDetailsScreen(BuildContext context) {
    if (book is AudioBook) {
      context.pushNamed(
        libraryBookRouteName,
        extra: book,
      );
      return;
    }

    final srcId =
        GoRouter.of(context).currentPathParameters()[browseSourceIdParam]!;

    context.pushNamed(
      browseSourceBookRouteName,
      pathParameters: {
        browseBookUrlParam: book.bookUrl,
        browseSourceIdParam: srcId,
      },
      extra: book,
    );
  }
}
