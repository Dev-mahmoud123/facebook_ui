import 'package:flutter/material.dart';

class ResponsiveUi extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveUi(
      {Key key, @required this.mobile, this.tablet, @required this.desktop}) : super(key: key);

  static bool isMobile(context) => MediaQuery.of(context).size.width < 800;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 800) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
