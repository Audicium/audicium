import 'package:flutter/cupertino.dart';

class TestRoute extends StatelessWidget {
  const TestRoute({super.key});

  static const String routeName = 'test';

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('This is a test route'));
  }
}
