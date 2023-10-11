import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/controllers/browse_book_details_controller.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/shared/error_widget.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';

class AudioUriList extends StatelessWidget {
  const AudioUriList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = get<BrowseBookDetailController>();
    return ValueListenableBuilder(
      valueListenable: controller.metaDataState,
      builder: (context, value, child) {
        switch (value) {
          case FutureStates.done:
            logger.i('recived audio uris ${controller.audioUriList.value}');
            return DisplayAudioUri(bookUriList: controller.audioUriList.value);
          case FutureStates.loading:
            return Column(
              children: [
                if (controller.audioUriList.value.isNotEmpty)
                  DisplayAudioUri(bookUriList: controller.audioUriList.value)
                else
                  const SizedBox(),
                const Center(child: CircularProgressIndicator()),
              ],
            );
          case FutureStates.error:
            return DisplayError(
              message: 'Error loading audio uris',
              error: controller.errorMessage,
            );
        }
      },
    );
  }
}

class DisplayAudioUri extends StatelessWidget {
  const DisplayAudioUri({
    required this.bookUriList,
    super.key,
  });

  final List<AudioInfo> bookUriList;

  @override
  Widget build(BuildContext context) {
    return bookUriList.length == 1 ? const SizedBox() : audioColumnList();
  }

  // use column instead of listview for better performance in single child scroll view
  Widget audioColumnList() => Column(
        children: bookUriList
            .map(
              (e) => ListTile(
                title: Text(e.title!),
                subtitle: Text(
                  e.duration.toString().split('.').first,
                ), // remove the milliseconds
                leading: const Icon(Icons.audiotrack),
                onTap: () async => debugPrint(e.webUri),
              ),
            )
            .toList(),
      );
}
