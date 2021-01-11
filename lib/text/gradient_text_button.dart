library flutter_button;

import 'package:flutter/material.dart';

class GradientTextButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool wOpacity;
  final double opacityValue;
  final double defaultSize;
  final double pressedSize;
  final FontWeight fontWeight;
  final List<Color> gradientColors;
  final AlignmentGeometry beginGradient;
  final AlignmentGeometry endGradient;
  final Locale locale;
  final TextAlign textAlign;
  final String fontFamily;

  GradientTextButton({
    Key key,
    @required this.title,
    @required this.onTap,
    this.wOpacity,
    this.opacityValue,
    this.defaultSize,
    this.pressedSize,
    this.fontWeight,
    this.gradientColors,
    this.beginGradient,
    this.endGradient,
    this.locale,
    this.textAlign,
    this.fontFamily,
  }) : super(key: key);

  @override
  _GradientTextButtonState createState() => _GradientTextButtonState();
}

class _GradientTextButtonState extends State<GradientTextButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// When you tap the button [_isTapped] would be [true] so pressed,
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },

      /// When cancel tapping the button [_isTapped] would be [false] so canceled,
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },

      /// When you remove your finget on the button [_isTapped] would be [false] so didn't pressed,
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      child: (widget.wOpacity != null && widget.wOpacity != false)
          ? buildOpacityProperty()
          : buildText(),
    );
  }

  Opacity buildOpacityProperty() {
    return Opacity(
      opacity: _isTapped ? (widget.opacityValue != null) ? widget.opacityValue : .5 : 1,
      child: buildText(),
    );
  }

  Widget buildText() {
    return Text(
      (widget.title != null) ? widget.title : "button title",
      textAlign:
          (widget.textAlign != null) ? widget.textAlign : TextAlign.center,
      style: TextStyle(
        fontSize: _isTapped
            ? (widget.pressedSize != null)
                ? widget.pressedSize
                : 18
            : (widget.defaultSize != null)
                ? widget.defaultSize
                : 20,
        fontWeight:
            (widget.fontWeight != null) ? widget.fontWeight : FontWeight.w500,
        locale: widget.locale,
        fontFamily: widget.fontFamily,
        foreground: Paint()
          ..shader = LinearGradient(
            begin: (widget.beginGradient != null)
                ? widget.beginGradient
                : Alignment.topRight,
            end: (widget.endGradient != null)
                ? widget.beginGradient
                : Alignment.centerLeft,
            colors: (widget.gradientColors != null)
                ? widget.gradientColors
                : [Colors.black, Colors.blueGrey[700]],
          ).createShader(
            Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
          ),
      ),
    );
  }
}
