import 'package:audicium/pages/library/ui/test.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/navigation_routes.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
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
