library flutter_button;

import 'package:flutter/material.dart';

class StarFAB extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final Color backgroundColor;
  final double elevation;
  final Color hoverColor;
  final Color splashColor;

  const StarFAB({
    Key key,
    @required this.child,
    @required this.onTap,
    this.backgroundColor,
    this.elevation,
    this.hoverColor,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      hoverColor: hoverColor,
      splashColor: splashColor,
      onPressed: onTap,
      elevation: elevation,
      backgroundColor: backgroundColor,
      child: child,
      shape: _StarShape(),
    );
  }
}

class _StarShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2, rect.top)
      ..lineTo(rect.right - rect.width / 3, rect.top + rect.height / 3)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.right - rect.width / 3, rect.top + 2 * rect.height / 3)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left + rect.width / 3, rect.top + 2 * rect.height / 3)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 3, rect.top + rect.height / 3)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override

  /// So this border doesn't contains scaling
  ShapeBorder scale(double t) {
    return null;
  }
}
