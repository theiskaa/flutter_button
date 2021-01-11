library flutter_button;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterAuthButton extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> shadows;
  final double fontSize;
  final double iconSize;
  final FontWeight fontWeight;
  final bool wOpacity;
  final double opacityValue;
  final bool wGradientColors;
  final List<Color> gradientColors;
  final AlignmentGeometry beginGradient;
  final AlignmentGeometry endGradient;

  TwitterAuthButton({
    @required this.onTap,
    this.title,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.borderRadius,
    this.shadows, 
    this.fontSize,
    this.iconSize,
    this.wOpacity,
    this.opacityValue,
    this.gradientColors,
    this.wGradientColors,
    this.beginGradient,
    this.endGradient,
    this.fontWeight,
  });
  @override
  _TwitterAuthButtonState createState() => _TwitterAuthButtonState();
}

class _TwitterAuthButtonState extends State<TwitterAuthButton> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      child: (widget.wOpacity != false && widget.wOpacity != null)
          ? buildButtonWOpacity()
          : buildButton(),
    );
  }

  Opacity buildButtonWOpacity() {
    return Opacity(
      opacity: _isTapped
          ? (widget.opacityValue == null)
              ? .7
              : widget.opacityValue
          : 1,
      child: buildButton(),
    );
  }

  Container buildButton() {
    return Container(
      decoration: buildBoxDecoration(),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.twitter,
              color:
                  (widget.iconColor == null) ? Colors.white : widget.iconColor,
              size: (widget.iconSize != null) ? widget.iconSize : 25,
            ),
            SizedBox(width: 10),

            ///
            Text(
              (widget.title != null) ? widget.title : "Twitter",
              style: TextStyle(
                color: (widget.titleColor == null)
                    ? Colors.white
                    : widget.titleColor,
                fontSize: (widget.fontSize != null) ? widget.fontSize : 25,
                fontWeight: (widget.fontWeight != null)
                    ? widget.fontWeight
                    : FontWeight.w500,
              ),
            ),

            ///
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius != null)
          ? widget.borderRadius
          : BorderRadius.circular(10),
      gradient: (widget.wGradientColors == true)
          ? (widget.gradientColors != null)
              ? LinearGradient(
                  colors: widget.gradientColors,
                  begin: (widget.beginGradient != null)
                      ? widget.beginGradient
                      : Alignment.topRight,
                  end: (widget.endGradient != null)
                      ? widget.beginGradient
                      : Alignment.bottomLeft,
                )
              : LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff1DA1F2),
                    Color(0xff1DA1F2).withOpacity(.7)
                  ],
                )
          : null,
      color: (widget.backgroundColor != null)
          ? widget.backgroundColor
          : Color(0xff1DA1F2),
      boxShadow: (widget.shadows != null) ? widget.shadows : [],
    );
  }
}

///
///
///
///
///

class CircularTWAuthButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color backgorundColor;
  final Color iconColor;
  final bool wOpacity;
  final bool wBorder;
  final Color borderColor;
  final double opacityValue;
  final double size;
  final double iconSize;
  final List<BoxShadow> shadows;
  final BorderRadiusGeometry borderRadius;

  CircularTWAuthButton({
    @required this.onTap,
    this.backgorundColor,
    this.iconColor,
    this.wOpacity,
    this.wBorder,
    this.borderColor,
    this.opacityValue,
    this.size,
    this.iconSize,
    this.shadows,
    this.borderRadius,
  });

  @override
  CircularTWAuthButtonState createState() => CircularTWAuthButtonState();
}

class CircularTWAuthButtonState extends State<CircularTWAuthButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      child: (widget.wOpacity == null || widget.wOpacity == false)
          ? body()
          : Opacity(
              opacity: _isTapped
                  ? (widget.opacityValue != null)
                      ? widget.opacityValue
                      : .7
                  : 1,
              child: body(),
            ),
    );
  }

  Container body() {
    return Container(
      height: (widget.size != null) ? widget.size : 50,
      width: (widget.size != null) ? widget.size : 50,
      decoration: buildBoxDecoration(),
      child: buildButtonBody(),
    );
  }

  Center buildButtonBody() {
    return Center(
      child: FaIcon(
        FontAwesomeIcons.twitter,
        color: (widget.iconColor != null) ? widget.iconColor : Colors.white,
        size: (widget.iconSize == null) ? 30 : widget.iconSize,
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius == null) ? null : widget.borderRadius,
      color: (widget.backgorundColor != null)
          ? widget.backgorundColor
          : Color(0xff1DA1F2),
      border: (widget.wBorder != null && widget.wBorder != false)
          ? Border.all(
              color: (widget.borderColor == null)
                  ? Colors.black
                  : widget.borderColor,
            )
          : null,
      boxShadow: (widget.shadows == null) ? [] : widget.shadows,
    );
  }
}

///
///
///
///
///

class MagicalTWButton extends StatefulWidget {
  final String title;
  final double opacityValue;
  final VoidCallback onTap;

  MagicalTWButton({
    @required this.title,
    this.opacityValue,
    @required this.onTap,
  });

  @override
  _MagicalTWButtonState createState() => _MagicalTWButtonState();
}

class _MagicalTWButtonState extends State<MagicalTWButton> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Opacity(
        opacity: _isTapped
            ? (widget.opacityValue != null)
                ? widget.opacityValue
                : .7
            : 1,
        child: buildContainer(context),
      ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xff1DA1F2).withOpacity(.6),
        borderRadius: BorderRadius.circular(30),
      ),
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTwitterCard(),
          Text(
            (widget.title != null)
                ? widget.title
                : "Magical Twitter Auth Button",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Opacity(
            opacity: 0,
            child: buildTwitterCard(),
          )
        ],
      ),
    );
  }

  Container buildTwitterCard() {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff1DA1F2),
            Color(0xFF0094F0),
          ],
        ),
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
          size: 33,
        ),
      ),
    );
  }
}
