import 'package:audicium/pages/browse/ui/shared/plugin_listile.dart';
import 'package:audicium/plugins/plugins.dart';
import 'package:audicium_models/audiobook/audiobook.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/navigation_routes.dart';
import '../test.dart';

class MobileLibraryPage extends StatefulWidget {
  const MobileLibraryPage({super.key});

  @override
  State<MobileLibraryPage> createState() => _MobileLibraryPageState();
}

class _MobileLibraryPageState extends State<MobileLibraryPage> {
  int clicked = 0;

  void _incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  final book = AudioBook(
    title: 'The Hobbit',
    bookUris: [],
    coverImage: '',
    bookUrl: '',
  );

  final pathnamed = '$libraryRoute/${TestRoute.routeName}';
  final named = 'test';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Library'),
          ElevatedButton(
            onPressed: () => context.pushNamed(libraryBookRouteName,extra: book),
            child: Text('Browse'),
          ),
          ElevatedButton(onPressed: _incrementCounter, child: Text('increse')),
        ],
      ),
    );
  }
}
