import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/routes/browse_src/ui/desktop/desktop_browse_src_page.dart';
import 'package:audicium/pages/browse/routes/browse_src/ui/mobile/mobile_browse_src_page.dart';
import 'package:audicium_extension_base/audicium_extension_base.dart';
import 'package:flutter/material.dart';

class BrowseSrcPage extends StatelessWidget {
  const BrowseSrcPage({
    required this.srcController,
    super.key,
  });

  final ExtensionController srcController;

  @override
  Widget build(BuildContext context) {
    return const LayoutSwitcher(
      mobileLayout: MobileBrowseSrcPage(),

      desktopLayout: DesktopBrowseSrcPage(),
    );
  }
}
