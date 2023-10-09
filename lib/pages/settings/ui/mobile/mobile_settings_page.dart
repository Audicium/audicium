import 'package:audicium/navigation/navigation_routes.dart';
import 'package:audicium/pages/browse/ui/shared/plugin_listile.dart';
import 'package:audicium/plugins/plugins.dart';
import 'package:audicium_models/audiobook/audiobook.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileSettingsPage extends StatefulWidget {
  const MobileSettingsPage({super.key});

  @override
  State<MobileSettingsPage> createState() => _MobileSettingsPageState();
}

class _MobileSettingsPageState extends State<MobileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Center(
        child: Text('Settings'),
      ),
    );
  }
}
