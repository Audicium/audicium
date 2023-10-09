import 'package:audicium/constants/responsive.dart';
import 'package:flutter/material.dart';

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
