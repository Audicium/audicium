import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/routes/browse_src/ui/shared/book_tile.dart';
import 'package:audicium/services/library_service.dart';
import 'package:flutter/material.dart';


class MobileLibraryPage extends StatefulWidget {
  const MobileLibraryPage({super.key});

  @override
  State<MobileLibraryPage> createState() => _MobileLibraryPageState();
}

class _MobileLibraryPageState extends State<MobileLibraryPage> {
  @override
  Widget build(BuildContext context) {
    final controller = get<LibraryService>();
    return StreamBuilder(
      stream: controller.loadAllAudioBooks(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No books in library'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final book = snapshot.data![index];
                return BookTile(book: book);
              },
            );
          case ConnectionState.none:
            return const Center(
              child: Text('Whoops something went wrong'),
            );
        }
      },
    );
  }
}
