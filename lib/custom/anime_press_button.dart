library flutter_button;

import 'package:flutter/material.dart';

class AnimePressButton extends StatefulWidget {
  /// [onTap] take function. and in calling this function
  /// into [onTapUp] with animation.
  final Function onTap;

  // Title takes string and sets to center as a Text.
  final String title;

  /// Duration of animation, so it's scale's duration.
  final Duration duration;

  // Is it a size which would by default.
  final double size;

  // BorderRadius of button grid.
  final BorderRadius borderRadius;

  // Shadow of button grid.
  final List<Shadow> boxShadow;

  // The color of button (as backgrounColor)
  final Color color;

  /// When [wGradient] is true, then color would be disable.
  /// and [gradientColors] would be enabled.
  /// So it's controller for detect which variant colorizing user neet to use.
  final bool wGradient;

  /// When [wGradient] is equals true, then we could use [gradientColors].
  final List<Color> gradientColors;

  /// Begin and end gradinet is [Alignment] widgets for detect align of gradients.
  final Alignment beginGradient;
  final Alignment endGradient;

  /// [title] strings's customizations.
  final Color titleColor;
  final double titleSize;
  final FontWeight titleWeight;

  AnimePressButton({
    /// can't go blank [onTap] property
    @required this.onTap,

    /// can't go blank [title] property
    @required this.title,

    // * The use of these properties is user dependent.
    this.duration,
    this.size,
    this.borderRadius,
    this.boxShadow,
    this.color,
    this.wGradient,
    this.gradientColors,
    this.beginGradient,
    this.endGradient,
    this.titleColor,
    this.titleSize,
    this.titleWeight,
  });
  @override
  _AnimePressButtonState createState() => _AnimePressButtonState();
}

class _AnimePressButtonState extends State<AnimePressButton>
    with SingleTickerProviderStateMixin {
  // The scale for controle size of widget(button).
  double _scale;

  /// For controle and manage [_scale].
  AnimationController _animationController;

  @override
  void initState() {
    // Set Animation controller by default values and make able to customize.
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 500),

      // Bounds for animate.
      lowerBound: 0,
      upperBound: 0.1,
    );

    /// Listen [_animationController].
    /// when detected act in [_animationController] return [setState]
    /// for rebuild the state of screen.
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Make this [1] customizable and write comment for that
    _scale = 1 - _animationController.value;

    return GestureDetector(
      /// Listen user's [touching/tapingDown] to button and forward animation.
      onTapDown: (details) {
        _animationController.forward();
      },

      /// Listen user's [touching/tapingCancel] to button and reverse animation.
      onTapCancel: () {
        _animationController.reverse();
      },

      /// Listen user's [touching/tapingUp] to button and reverse animation.
      onTapUp: (details) {
        _animationController.reverse();
        widget.onTap();
      },

      //
      child: Transform.scale(
        scale: _scale,
        child: button(),
      ),
    );
  }

  Widget button() => Container(
        height: (widget.size != null) ? widget.size / 2.3 : 70,
        width: (widget.size != null) ? widget.size : 200,
        decoration: decoration(),
        child: buttonBody(),
      );

  Widget buttonBody() => Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: (widget.titleSize != null) ? widget.titleSize : 20,
            fontWeight: (widget.titleWeight != null)
                ? widget.titleWeight
                : FontWeight.w500,
            color:
                (widget.titleColor != null) ? widget.titleColor : Colors.black,
          ),
        ),
      );

  Decoration decoration() => BoxDecoration(
        /// Set the color by listening [widget.color] value.
        color: (widget.color != null) ? widget.color : Colors.white,

        /// Set the borderRadius by listening [widget.borderRadius] value.
        borderRadius: (widget.borderRadius != null)
            ? widget.borderRadius
            : BorderRadius.circular(10),

        /// Set the boxShadow by listening [widget.boxShadow] value.
        boxShadow: (widget.boxShadow != null)
            ? widget.boxShadow
            : [
                BoxShadow(
                  blurRadius: 12.0,
                  offset: Offset(0.0, 5.0),
                ),
              ],

        /// Here we set gradient value by listening value [wGradient]
        gradient: (widget.wGradient == true)
            ? (widget.gradientColors != null)

                /// Custom gradient, use it when [gradientColors] different than null.
                ? LinearGradient(
                    colors: widget.gradientColors,
                    begin: (widget.beginGradient != null)
                        ? widget.beginGradient
                        : Alignment.topRight,
                    end: (widget.endGradient != null)
                        ? widget.beginGradient
                        : Alignment.bottomLeft,
                  )

                /// Default gradient, use it when [gradientColors] equals null.
                : LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Color(0xff4267B2).withOpacity(.7),
                    ],
                  )
            : null,
      );
}
