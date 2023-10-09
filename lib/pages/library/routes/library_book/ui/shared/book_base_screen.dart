import 'package:flutter/material.dart';

class BookBaseScreen extends StatelessWidget {
  const BookBaseScreen({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
