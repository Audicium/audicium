import 'package:audicium/constants/navigation_routes.dart';
import 'package:audicium_models/plugins.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PluginListTile extends StatelessWidget {
  const PluginListTile({required this.plugin, super.key});

  final Plugin plugin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        browseSourceRouteName,
        pathParameters: {browseSourceIdParam: plugin.name.toLowerCase()},
      ),
      child: ListTile(
        title: Text(plugin.name),
        subtitle: Text(plugin.version),
      ),
    );
  }
}
