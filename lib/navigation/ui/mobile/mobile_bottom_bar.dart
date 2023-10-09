import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({required this.navShell, super.key});

  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.3,
      width: double.infinity,
      child: NavigationBar(
        onDestinationSelected: _pageSelector,
        selectedIndex: navShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.browse_gallery),
            label: 'Browse',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _pageSelector(int page) {
    navShell.goBranch(
      page,
      initialLocation: page == navShell.currentIndex,
    );
  }
}
