import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/library/ui/desktop/desktop_lib_page.dart';
import 'package:audicium/pages/library/ui/mobile/mobile_lib_page.dart';
import 'package:flutter/material.dart';


class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutSwitcher(
      mobileLayout: MobileLibraryPage(),
      desktopLayout: DesktopLibraryPage(),
    );
  }
}
