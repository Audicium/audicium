import 'package:flutter/material.dart';

class AuthorDetails extends StatelessWidget {

  const AuthorDetails({
    required this.author, super.key,
    this.isAuthor = false,
  });
  //todo finish this uploader/author/none thing

  final String author;
  final bool isAuthor;

  @override
  Widget build(BuildContext context) {
    final message = isAuthor ? 'By':'Uploaded By';
    return Text(
      '$message $author',
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}
