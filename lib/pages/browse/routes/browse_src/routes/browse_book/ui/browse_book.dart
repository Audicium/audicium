import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/desktop/desktop_browse_book_page.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/mobile/mobile_browse_book_page.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';

class BrowseBookDetailsPage extends StatelessWidget {
  const BrowseBookDetailsPage({
    required this.url,
    required this.book,
    super.key,
  });

  final String url;
  final DisplayBook book;

  @override
  Widget build(BuildContext context) {
    return const LayoutSwitcher(
      mobileLayout: MobileBrowseBookPage(),
      // TODO implement desktop browse book
      desktopLayout: DesktopBrowseBookPage(),
    );
  }
}
