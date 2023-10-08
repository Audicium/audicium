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
    return const Text('BrowseSrcPage');
  }
}
