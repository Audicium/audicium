import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';

class LibraryBookDetails extends StatelessWidget {
  const LibraryBookDetails({super.key, required this.book});

  final AudioBook book;

  @override
  Widget build(BuildContext context) {
    return Text(book.title);
  }
}
