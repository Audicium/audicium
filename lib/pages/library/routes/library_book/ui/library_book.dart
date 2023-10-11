import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/library/routes/library_book/ui/desktop/desktop_lib_book_page.dart';
import 'package:audicium/pages/library/routes/library_book/ui/mobile/mobile_lib_book_page.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';

class LibraryBookDetails extends StatelessWidget {
  const LibraryBookDetails({super.key, required this.book});

  final AudioBook book;

  @override
  Widget build(BuildContext context) {
    return const LayoutSwitcher(
      mobileLayout: MobileLibraryBookPage(),
      desktopLayout: DesktopLibraryBookPage(),
    );
  }
}
