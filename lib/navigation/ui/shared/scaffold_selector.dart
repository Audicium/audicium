import 'package:audicium/constants/extensions.dart';
import 'package:audicium/navigation/ui/desktop/desktop_base_scaffold.dart';
import 'package:audicium/navigation/ui/desktop/desktop_nav_rail.dart';
import 'package:audicium/navigation/ui/mobile/mobile_bottom_bar.dart';
import 'package:audicium/navigation/ui/mobile/mobile_base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScaffoldSelector extends StatelessWidget {
  const BaseScaffoldSelector({
    required this.navShell,
    super.key,
  });

  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);
    // invert here to conform to the naming convention
    // true means that the page has a nav bar
    final isPageWithNavBar = !goRouter.isParentPath(goRouter.location());

    return LayoutBuilder(
      builder: (context, constraints) {
        // Use for tablets and desktops
        if (constraints.maxWidth > 450) {
          return DesktopBaseScaffold(
            navShell: navShell,
            bottomNav: DesktopNavRail(
              navShell: navShell,
              switchPage: _pageSelector,
            ),
          );
        } else {
          return MobileBaseScaffold(
            navShell: navShell,
            bottomNav: isPageWithNavBar
                ? MobileNavBar(
                    navShell: navShell,
                    switchPage: _pageSelector,
                  )
                : const SizedBox(),
          );
        }
      },
    );
  }

  void _pageSelector(int page) {
    navShell.goBranch(
      page,
      initialLocation: page == navShell.currentIndex,
    );
  }
}
