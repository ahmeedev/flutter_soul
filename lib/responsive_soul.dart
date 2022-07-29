library responsive_soul;

import 'package:flutter/material.dart';

/// A responsive widget.
class ResponsiveSoul extends StatelessWidget {
  static const Widget defaultW = Center(
      child: Text('Not Handled Yet',
          style: TextStyle(
              color: Colors.red, fontSize: 16, fontWeight: FontWeight.w900)));

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveSoul({
    Key? key,
    this.mobile = defaultW,
    this.tablet = defaultW,
    this.desktop = defaultW,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  /// retuns [widget] based on screen size.
  @override
  Widget build(BuildContext context) {
    // If our width is more than 1100 then we consider it a desktop
    if (isDesktop(context)) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (isTablet(context)) {
      return tablet;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
