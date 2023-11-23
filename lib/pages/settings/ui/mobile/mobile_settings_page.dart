import 'package:flutter/material.dart';

class MobileSettingsPage extends StatefulWidget {
  const MobileSettingsPage({super.key});

  @override
  State<MobileSettingsPage> createState() => _MobileSettingsPageState();
}

class _MobileSettingsPageState extends State<MobileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Center(
        child: Text('Settings'),
      ),
    );
  }
}
