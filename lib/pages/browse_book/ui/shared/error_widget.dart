// widget to display error message
import 'package:flutter/material.dart';

class DisplayError extends StatelessWidget {
  const DisplayError({super.key, required this.message, this.error});

  final String? message;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.error_outline),
          Text(message ?? ''),
          Text(error ?? ''),
        ],
      ),
    );
  }
}
