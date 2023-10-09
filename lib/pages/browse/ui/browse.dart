import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/ui/desktop/desktop_browse_page.dart';
import 'package:audicium/pages/browse/ui/mobile/mobile_browse_page.dart';
import 'package:flutter/material.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutSwitcher(
      mobileLayout: MobileBrowsePage(),
      desktopLayout: DesktopBrowsePage(),
    );
  }
}
