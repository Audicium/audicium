import 'package:go_router/go_router.dart';

// ref: https://github.com/flutter/flutter/issues/129833#issuecomment-1725216727
extension GoRouterExtension on GoRouter {
  RouteMatchList extractMatchList() {
    final lastMatch = routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList;
  }

  String location() {
    final location = extractMatchList().uri.toString();
    return location;
  }

  Map<String, String> currentPathParameters() {
    final pathParameters = extractMatchList().pathParameters;
    return pathParameters;
  }

  // Here, we use regex to check if the input path has sub-paths.
  // If the regular expression matches (i.e., it has sub-paths),
  // the function returns true. Otherwise, false.
  bool isParentPath(String path) {
    final regex = RegExp(r'^/[^/]+/.*$');
    return regex.hasMatch(path);
  }
}
