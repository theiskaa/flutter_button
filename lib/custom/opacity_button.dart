import 'package:flutter/material.dart';

class OpacityButton extends StatefulWidget {
  /// [child] take widget and build opacity on this widget
  final Widget child;

  /// user can use default [opacityValue] as [0.5].
  /// if user wanna set custom [opacityValue] then should use it.
  final double opacityValue;

  // * for call onTap function when (onTapUp)
  final VoidCallback onTap;

  // * for call onLongPress function when (onLongPressEnd)
  final VoidCallback onLongPress;

  /// [alwaysIncludeSemantics] defaultly was setted to [false]
  /// if user wanna change it to [ture] then should use it.
  final bool alwaysIncludeSemantics;

  const OpacityButton({
    Key key,

    /// can't go blank [child] property
    @required this.child,

    // * The use of these properties is user dependent.
    this.opacityValue,
    this.onTap,
    this.onLongPress,
    this.alwaysIncludeSemantics,
  }) : super(key: key);

  @override
  _OpacityButtonState createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> {
  bool _isTapped = false;

  /// For change opacity value of button [1 to (.5 or custom)].
  void setToTrue() => setState(() => _isTapped = true);

  /// For change opacity value of button [(.5 or custom) to 1].
  void setToFalse() => setState(() => _isTapped = false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Listen user's [touching/tapingDown] to button and make it true.
      onTapDown: (d) => (widget.onTap != null) ? setToTrue() : null,

      /// Listen user's [touching/tapingCancel]
      onTapCancel: () => (widget.onTap != null) ? setToFalse() : null,

      /// Listen user's [touching/tapingUp] to button
      onTapUp: (d) {
        if (widget.onTap != null) {
          setToFalse();
          return widget.onTap();
        }
      },

      /// When Long Press Start set [_isTapped] to true.
      onLongPressStart: (d) =>
          (widget.onLongPress != null) ? setToTrue() : null,

      /// When Long press end set [_isTapped] to false & call [onLongPress] function.
      onLongPressEnd: (d) {
        if (widget.onLongPress != null) {
          setToFalse();
          return widget.onLongPress();
        }
      },

      child: buildBody(),
    );
  }

  /// The body of [OpacityButton]
  buildBody() => Opacity(
        opacity: getTrueOpacityValue(),
        child: widget.child,
        alwaysIncludeSemantics: (widget.alwaysIncludeSemantics != null)
            ? widget.alwaysIncludeSemantics
            : false,
      );

  // To controle and get opacity true result.
  double getTrueOpacityValue() {
    if (_isTapped) {
      if (widget.opacityValue != null) {
        return widget.opacityValue;
      } else {
        return .5;
      }
    } else {
      return 1;
    }
  }
}
