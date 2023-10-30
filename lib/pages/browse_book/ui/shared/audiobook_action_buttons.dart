import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse_book/controllers/browse_book_details_controller.dart';
import 'package:audicium/pages/player/logic/player_interface.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';

class AudiobookActionButtons extends StatelessWidget {
  const AudiobookActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = get<BrowseBookDetailController>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: ValueListenableBuilder(
        valueListenable: controller.metaDataState,
        builder: (context, value, child) {
          final isMetaDataReady = value == FutureStates.done;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayActionButton(
                book: controller.libraryBook,
                buttonReady: isMetaDataReady,
              ),
              SaveBookButton(
                controller: controller,
                buttonReady: isMetaDataReady,
              ),
            ],
          );
        },
      ),
    );
  }

// checkMetaFile() {}
}

class PlayActionButton extends StatelessWidget {
  const PlayActionButton({
    required this.book,
    required this.buttonReady,
    super.key,
  });

  final AudioBook? book;
  final bool buttonReady;

  @override
  Widget build(BuildContext context) {
    final isPlayButtonReady = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: isPlayButtonReady,
      builder: (context, playReady, child) {
        return ElevatedButton(
          onPressed: buttonReady && playReady && book != null
              ? () async {
                  isPlayButtonReady.value = false;
                  logger.i('playing book ${book!.title}');
                  await get<PlayerInterface>().playBook(book!);
                  isPlayButtonReady.value = true;
                }
              : null,
          child: playReady
              ? const Row(
                  children: [
                    Icon(Icons.play_arrow),
                    Text('Start listening'),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class SaveBookButton extends StatelessWidget {
  const SaveBookButton({
    required this.controller,
    required this.buttonReady,
    super.key,
  });

  final BrowseBookDetailController controller;
  final bool buttonReady;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: get<BrowseBookDetailController>().isBookInLibrary,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: buttonReady ? controller.saveBook : null,
          child: Row(
            children: value
                ? [
                    const Icon(Icons.bookmark_outlined),
                    const Text('Remove'),
                  ]
                : [
                    const Icon(Icons.bookmark_outline),
                    const Text('Save'),
                  ],
          ),
        );
      },
    );
  }
}

// await playMultipleBooksFromBrowse(book, bookUriList)
