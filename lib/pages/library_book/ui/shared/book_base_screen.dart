import 'package:flutter/material.dart';

class BookBaseScreen extends StatelessWidget {
  const BookBaseScreen({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
