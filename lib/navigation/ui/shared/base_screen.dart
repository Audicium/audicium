import 'package:audicium/constants/debug.dart';
import 'package:audicium/navigation/ui/shared/mobile_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileScaffoldWithPlayer extends StatelessWidget {
  const MobileScaffoldWithPlayer({
    required this.bottomNav,
    required this.navShell,
    super.key,
  });

  final StatefulNavigationShell navShell;
  final Widget bottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: navShell),
          bottomNav,
        ],
      ),
    );
  }
}

