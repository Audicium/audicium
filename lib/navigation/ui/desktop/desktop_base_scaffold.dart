import 'package:audicium/pages/player/ui/desktop_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopBaseScaffold extends StatelessWidget {
  const DesktopBaseScaffold({
    required this.navShell,
    required this.bottomNav,
    super.key,
  });

  final StatefulNavigationShell navShell;
  final Widget bottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                bottomNav,
                Expanded(child: navShell),
              ],
            ),
          ),
          const DesktopPlayer(),
        ],
      ),
    );
  }
}
