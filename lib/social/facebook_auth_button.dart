library flutter_button;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookAuthButton extends StatefulWidget {
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
  final bool wGradientColors;
  final double opacityValue;
  final List<Color> gradientColors;
  final AlignmentGeometry beginGradient;
  final AlignmentGeometry endGradient;

  FacebookAuthButton({
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
    this.fontWeight,
    this.wGradientColors,
    this.opacityValue,
    this.gradientColors,
    this.beginGradient,
    this.endGradient,
  });
  @override
  _FacebookAuthButtonState createState() => _FacebookAuthButtonState();
}

class _FacebookAuthButtonState extends State<FacebookAuthButton> {
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
              FontAwesomeIcons.facebook,
              color:
                  (widget.iconColor == null) ? Colors.white : widget.iconColor,
              size: (widget.iconSize != null) ? widget.iconSize : 25,
            ),
            SizedBox(width: 10),

            ///
            Text(
              (widget.title != null) ? widget.title : "Facebook",
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
                    Color(0xff4267B2),
                    Color(0xff4267B2).withOpacity(.7),
                  ],
                )
          : null,
      color: (widget.backgroundColor != null)
          ? widget.backgroundColor
          : Color(0xff4267B2),
      boxShadow: (widget.shadows != null) ? widget.shadows : [],
    );
  }
}

///
///
///
///
///
///

class CircularFBAuthButton extends StatefulWidget {
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

  CircularFBAuthButton({
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
  CircularFBAuthButtonState createState() => CircularFBAuthButtonState();
}

class CircularFBAuthButtonState extends State<CircularFBAuthButton> {
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
        FontAwesomeIcons.facebook,
        color: (widget.iconColor != null) ? widget.iconColor : Colors.white,
        size: (widget.iconSize == null) ? 35 : widget.iconSize,
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius == null) ? null : widget.borderRadius,
      color: (widget.backgorundColor != null)
          ? widget.backgorundColor
          : Color(0xff4267B2),
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
///

class MagicalFBButton extends StatefulWidget {
  final String title;
  final double opacityValue;
  final VoidCallback onTap;

  MagicalFBButton({
    @required this.title,
    @required this.onTap,
    this.opacityValue,
  });

  @override
  _MagicalFBButtonState createState() => _MagicalFBButtonState();
}

class _MagicalFBButtonState extends State<MagicalFBButton> {
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
        color: Colors.blue[800].withOpacity(.7),
        borderRadius: BorderRadius.circular(30),
      ),
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildFacebookCard(),
          Text(
            (widget.title != null) ? widget.title : "Magical FB Auth Button",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          ghost(),
        ],
      ),
    );
  }

  Opacity ghost() {
    return Opacity(
      child: buildFacebookCard(),
      opacity: 0,
    );
  }

  Container buildFacebookCard() {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff1D5BB0),
            Color(0xff1F5079),
          ],
        ),
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.facebook,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
