import 'package:flutter/material.dart';

class MobileBrowseBookPage extends StatelessWidget {
  const MobileBrowseBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Browsing Book details'),
        ),
        const Center(
          child: Text('You are Browsing the book inside the selected src'),
        ),
      ],
    );
  }
}
