import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/settings/ui/desktop/desktop_settings_page.dart';
import 'package:audicium/pages/settings/ui/mobile/mobile_settings_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return const LayoutSwitcher(
      mobileLayout: MobileSettingsPage(),
      desktopLayout: DesktopSettingsPage(),
    );
  }
}
