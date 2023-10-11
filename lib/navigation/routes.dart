import 'package:audicium/constants/utils.dart';
import 'package:audicium/navigation/navigation_routes.dart';
import 'package:audicium/navigation/ui/shared/scaffold_selector.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/controllers/browse_book_details_controller.dart';
import 'package:audicium/pages/browse/routes/browse_src/routes/browse_book/ui/browse_book.dart';
import 'package:audicium/pages/browse/routes/browse_src/ui/browse_src.dart';
import 'package:audicium/pages/browse/ui/browse.dart';
import 'package:audicium/pages/library/routes/library_book/ui/library_book.dart';
import 'package:audicium/pages/library/ui/library.dart';
import 'package:audicium/pages/library/ui/test.dart';
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
  debugLogDiagnostics: true,
  initialLocation: browseRoute,
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
                    return LibraryBookDetails(book: book);
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
                    if (!state.pathParameters
                            .containsKey(browseSourceIdParam) ||
                        state.pathParameters[browseSourceIdParam] == null) {
                      return browseRoute;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    final srcId = state.pathParameters[browseSourceIdParam]!;
                    if (!getIt.isRegistered<ExtensionController>()) {
                      logger.i('Registering browse source controller');
                      getIt.registerSingleton<ExtensionController>(
                        pluginsList[srcId]!.controllerFactory(),
                      );
                    }
                    return const BrowseSrcPage();
                  },
                  routes: [
                    GoRoute(
                      path: browseSourceBookRoute,
                      name: browseSourceBookRouteName,
                      redirect: (context, state) {
                        if (state.pathParameters[browseBookUrlParam] == null ||
                            state.extra == null ||
                            state.extra is! DisplayBook) {
                          return browseRoute;
                        }
                        return null;
                      },
                      builder: (context, state) {
                        final url = state.pathParameters[browseBookUrlParam]!;
                        final displayBook = state.extra! as DisplayBook;
                        // register controller
                        if (!getIt.isRegistered<BrowseBookDetailController>()) {
                          logger
                              .i('Registering browse book details controller');
                          getIt.registerSingleton<BrowseBookDetailController>(
                            BrowseBookDetailController(
                              selectedBook: displayBook,
                            ),
                          );
                        }
                        return const BrowseBookDetailsPage();
                      },
                    ),
                  ],
                ),
              ],
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
  ],
);
