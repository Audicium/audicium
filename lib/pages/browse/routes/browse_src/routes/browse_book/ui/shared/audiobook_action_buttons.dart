import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/controllers/browse_book_details_controller.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';

class AudiobookActionButtons extends StatelessWidget {
  const AudiobookActionButtons({
    required this.book,
    required this.isBookInLibrary,
    super.key,
  });

  final AudioBook book;
  final bool isBookInLibrary;

  @override
  Widget build(BuildContext context) {
    final saveFun = get<BrowseBookDetailController>().saveBook;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildPlayerButton(),
          ElevatedButton(
            onPressed: false ? saveFun : null,
            child: Row(
              children: isBookInLibrary
                  ? [const Icon(Icons.bookmark_outlined), const Text('Remove')]
                  : [const Icon(Icons.bookmark_outline), const Text('Save')],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildPlayerButton() {
    // final playerController = get<PlayerInterface>();
    final buttonReady = ValueNotifier(true); // -1 idle, 0 loading, 1 loaded
    return ElevatedButton(
      onPressed: false
          ? () async {
              // print(book.bookUris);
              buttonReady.value = false;
              logger.i('playing book ${book.title}');
              await Future<void>.delayed(const Duration(seconds: 1));
              // playerController.playBook(book);
              buttonReady.value = true;
            }
          : null,
      child: ValueListenableBuilder(
        valueListenable: buttonReady,
        builder: (context, value, child) {
          return value
              ? const Row(
                  children: [
                    Icon(Icons.play_arrow),
                    Text('Start listening'),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

// checkMetaFile() {}
}

// await playMultipleBooksFromBrowse(book, bookUriList)
