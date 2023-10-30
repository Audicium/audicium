import 'package:audicium/pages/browse_src/ui/shared/book_tile.dart';
import 'package:audicium_extension_base/audicium_extension_base.dart';
import 'package:flutter/material.dart';

class BookDisplayList extends StatelessWidget {
  const BookDisplayList({
    required this.gridCount,
    required this.source,
    super.key,
  });

  final ExtensionController source;
  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: source.booksList,
      builder: (context, value, child) {
        print('rebuilding book display list');
        return source.booksList.value.isNotEmpty
            ? ValueListenableBuilder(
                valueListenable: source.pageState,
                builder: (context, value, child) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: source.scrollController,
                  child: Column(
                    children: [
                      buildGridView(source),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: bottomLoading(),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: ValueListenableBuilder(
                  valueListenable: source.pageState,
                  builder: (context, value, child) {
                    print(source.booksList.value.length);
                    return source.isPageLoading ||
                            source.booksList.value.isEmpty
                        ? const CircularProgressIndicator()
                        : const Text('No results found');
                  },
                ),
              );
      },
    );
  }

  GridView buildGridView(ExtensionController source) {
    return GridView.builder(
      shrinkWrap: true,
      // important renders only visible items
      physics: const NeverScrollableScrollPhysics(),
      itemCount: source.booksList.value.length,
      itemBuilder: (context, index) => BookTile(
        book: source.booksList.value[index],
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
      ),
    );
  }

  Widget buildListView(ExtensionController source) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // important renders only visible items
      itemCount: source.booksList.value.length,
      itemBuilder: (context, index) => BookTile(
        book: source.booksList.value[index],
      ),
    );
  }

  Widget bottomLoading() {
    if (source.isPageComplete) {
      // show nothing if complete
      return const SizedBox();
    }

    if (source.isPageLoading) {
      return const CircularProgressIndicator();
    } else {
      // user has not scrolled to the end
      return const SizedBox();
    }
  }
}
