import 'package:audicium/pages/browse/ui/shared/plugin_listile.dart';
import 'package:audicium/plugins/plugins.dart';
import 'package:flutter/material.dart';

class MobileBrowsePage extends StatelessWidget {
  const MobileBrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pluginsList.values
          .map(
            (e) => PluginListTile(plugin: e),
          )
          .toList(),
    );
  }
}
