import 'package:audicium/pages/browse/ui/shared/plugin_listile.dart';
import 'package:audicium/plugins/plugins.dart';
import 'package:flutter/material.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Src'),
      ),
      body: Column(
        children:
            pluginsList.values.map((e) => PluginListTile(plugin: e)).toList(),
      ),
    );
  }
}
