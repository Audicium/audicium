import 'package:audicium/constants/assets.dart';
import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/controllers/browse_book_details_controller.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/shared/audio_book_cover.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/shared/audio_uri_list.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/shared/audiobook_action_buttons.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/shared/audiouri_details.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/shared/author_details.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/shared/description_details.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';

import '../shared/error_widget.dart';

class MobileBrowseBookPage extends StatefulWidget {
  const MobileBrowseBookPage({super.key});

  @override
  State<MobileBrowseBookPage> createState() => _MobileBrowseBookPageState();
}

class _MobileBrowseBookPageState extends State<MobileBrowseBookPage> {
  final controller = get<BrowseBookDetailController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final scrollController = ScrollController();
    return Column(
      children: [
        AppBar(title: const Text('Audiobook Details')),
        Expanded(
          child: SingleChildScrollView(
            // controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: AudioBookCover(
                    coverImageUrl: controller.selectedBook.coverImage ??
                        AppAssets.defaultIcon,
                    heightPercent: 0.3,
                    widthPercent: 1,
                  ),
                ),
                buildTitle(controller.selectedBook!),
                buildAsyncBody(),
              ],
            ),
          ),
        ),
        AudiobookActionButtons(
          isBookInLibrary: controller.isBookInLibrary.value,
          book: AudioBook.fromBrowseAudioBook(
            book: controller.selectedBook,
            bookUris: controller.audioUriList.value,
          ),
        ),
      ],

    );
  }

  Widget buildAsyncBody() {
    return ValueListenableBuilder(
      valueListenable: controller.metaDataState,
      builder: (context, value, child) {
        switch (value) {
          case FutureStates.loading:
            return const Center(child: CircularProgressIndicator());
          case FutureStates.error:
            return DisplayError(
              message: 'Failed to retrieve metadata',
              error: controller.errorMessage,
            );
          case FutureStates.done:
            return buildMetadataBody(controller.selectedBook);
        }
      },
    );
  }

  Widget buildMetadataBody(DisplayBook book) {
    return Column(
      children: [
        buildAuthor(book.uploader ?? book.author ?? ''),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: CollapsibleTextBox(description: book.description),
        ),
        const AudioUriList(),
      ],
    );
  }

  Widget buildTitle(DisplayBook book) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Text(
        book.title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildAuthor(String author) => Padding(
        padding: const EdgeInsets.all(8),
        child: AuthorDetails(author: author),
      );
}
