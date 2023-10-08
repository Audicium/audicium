import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  static const String routeName = '/library';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Library'),
          ElevatedButton(
            onPressed: () => context.go("/browse"),
            child: Text('Browse   $clicked'),
          ),
          ElevatedButton(onPressed: _incrementCounter, child: Text('increse')),
        ],
      ),
    );
  }
}
