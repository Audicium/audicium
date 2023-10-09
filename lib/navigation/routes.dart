import 'package:audicium/constants/navigation_routes.dart';
import 'package:audicium/navigation/ui/shared/scaffold_selector.dart';
import 'package:audicium/pages/browse/ui/browse.dart';
import 'package:audicium/pages/browse_book/ui/browse_book.dart';
import 'package:audicium/pages/browse_src/ui/browse_src.dart';
import 'package:audicium/pages/library/ui/library.dart';
import 'package:audicium/pages/library/ui/test.dart';
import 'package:audicium/pages/library_book/ui/library_book.dart';
import 'package:audicium/pages/library_book/ui/shared/book_base_screen.dart';
import 'package:audicium/pages/settings/ui/settings.dart';
import 'package:audicium/plugins/plugins.dart';
import 'package:audicium_extension_base/audicium_extension_base.dart';
import 'package:audicium_models/audicium_models.dart';
import 'package:flutter/material.dart';
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
  initialLocation: libraryRoute,
  redirect: (context, state) {
    if (state.fullPath == '/') {
      return libraryRoute;
    }
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BaseScaffoldSelector(
          navShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: libraryNavigatorKey,
          routes: [
            GoRoute(
              path: libraryRoute,
              name: libraryRouteName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: LibraryPage(),
              ),
              routes: [
                GoRoute(
                  path: libraryBookRoute,
                  name: libraryBookRouteName,
                  redirect: (context, state) {
                    if (state.extra == null || state.extra is! AudioBook) {
                      return libraryRoute;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    final book = state.extra! as AudioBook;
                    return BookBaseScreen(
                      body: LibraryBookDetails(book: book),
                    );
                  },
                ),
                GoRoute(
                  path: TestRoute.routeName,
                  name: 'test',
                  builder: (context, state) => const TestRoute(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: browseNavigatorKey,
          routes: [
            GoRoute(
              path: browseRoute,
              name: browseRouteName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: BrowsePage(),
              ),
              routes: [
                GoRoute(
                  path: browseSourceRoute,
                  name: browseSourceRouteName,
                  redirect: (context, state) {
                    if (!state.pathParameters.containsKey(browseSourceIdParam) ||
                        state.pathParameters[browseSourceIdParam] == null) {
                      return browseRoute;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    final srcId = state.pathParameters[browseSourceIdParam]!;
                    final controller = pluginsList[srcId]!.controllerFactory();
                    return Scaffold(
                      body: BrowseSrcPage(srcController: controller),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: ':$browseBookDetailsParam',
                      name: browseSourceBookRouteName,
                      redirect: (context, state) {
                        if (state.pathParameters[browseBookDetailsParam] == null ||
                            state.extra == null ||
                            state.extra is! ExtensionController) {
                          return browseRoute;
                        }
                        return null;
                      },
                      builder: (context, state) {
                        final url = state.pathParameters[browseBookDetailsParam]!;
                        final controller = state.extra! as ExtensionController;
                        return Scaffold(
                          body: BrowseBookDetailsPage(
                            bookDetailsController: controller,
                            url: url,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: settingsNavigatorKey,
          routes: [
            GoRoute(
              path: settingsRoute,
              name: settingsRouteName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsPage(),
              ),
            ),
          ],
        ),
      ],
    ),
    // library

    // browse

    // settings
  ],
);
