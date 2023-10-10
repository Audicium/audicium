import 'package:audicium/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;
final get = getIt.get;
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 3,
    lineLength: 80,
  ),
);

class LayoutSwitcher extends StatelessWidget {
  const LayoutSwitcher({
    required this.mobileLayout,
    required this.desktopLayout,
    super.key,
  });

  final Widget mobileLayout;
  final Widget desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use for tablets and desktops
        if (constraints.maxWidth > mobileMaxWidth) {
          return desktopLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}
