library flutter_button;

import 'package:flutter/material.dart';

class FlutterTextButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool wOpacity;
  final double opacityValue;
  final double defaultSize;
  final double pressedSize;
  final Color color;
  final FontWeight fontWeight;
  final Locale locale;
  final TextAlign textAlign;
  final String fontFamily;

  FlutterTextButton({
    Key key,
    @required this.title,
    @required this.onTap,
    this.wOpacity,
    this.opacityValue,
    this.defaultSize,
    this.pressedSize,
    this.color,
    this.fontWeight,
    this.locale,
    this.textAlign,
    this.fontFamily,
  }) : super(key: key);

  @override
  _FlutterTextButtonState createState() => _FlutterTextButtonState();
}

class _FlutterTextButtonState extends State<FlutterTextButton> {
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
      child: (widget.wOpacity != false && widget.wOpacity != null)
          ? Opacity(
              opacity: _isTapped
                  ? (widget.opacityValue == null)
                      ? .7
                      : widget.opacityValue
                  : 1,
              child: buildText(),
            )
          : buildText(),
    );
  }

  Widget buildText() {
    return Text(
      (widget.title != null) ? widget.title : "button title",
      textAlign:
          (widget.textAlign != null) ? widget.textAlign : TextAlign.center,
      style: TextStyle(
        /// When [_isTapped] is [true] the font size is smalling
        fontSize: _isTapped
            ? (widget.pressedSize != null)
                ? widget.pressedSize
                : 18
            : (widget.defaultSize != null)
                ? widget.defaultSize
                : 20,
        color: (widget.color != null) ? widget.color : Colors.black,
        fontWeight:
            (widget.fontWeight != null) ? widget.fontWeight : FontWeight.w500,
        fontFamily: widget.fontFamily,
      ),
    );
  }
}
