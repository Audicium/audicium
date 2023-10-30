import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse_book/ui/desktop/desktop_browse_book_page.dart';
import 'package:audicium/pages/browse_book/ui/mobile/mobile_browse_book_page.dart';
import 'package:flutter/material.dart';

class BrowseBookDetailsPage extends StatelessWidget {
  const BrowseBookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutSwitcher(
      mobileLayout: MobileBrowseBookPage(),
      // TODO implement desktop browse book
      desktopLayout: DesktopBrowseBookPage(),
    );
  }
}
