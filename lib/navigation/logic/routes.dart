import 'package:audicium/navigation/ui/shared/base_screen.dart';
import 'package:audicium/navigation/ui/shared/mobile_bottom_nav.dart';
import 'package:audicium/pages/browse/ui/browse.dart';
import 'package:audicium/pages/library/ui/library.dart';
import 'package:audicium/pages/settings/ui/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

// ref:https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart

// router key
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

// page keys
final GlobalKey<NavigatorState> libraryNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'libNav');
final GlobalKey<NavigatorState> browseNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'browNav');
final GlobalKey<NavigatorState> settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settNav');

final mobileRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/library',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MobileScaffoldWithPlayer(
          navShell: navigationShell,
          bottomNav: MobileNavBar(navShell: navigationShell),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: libraryNavigatorKey,
          routes: [
            GoRoute(
              path: LibraryPage.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: LibraryPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: browseNavigatorKey,
          routes: [
            GoRoute(
              path: BrowsePage.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: BrowsePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: settingsNavigatorKey,
          routes: [
            GoRoute(
              path: SettingsPage.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsPage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
