library flutter_button;

import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  // Title takes string and sets to center as a Text.
  final String title;

  /// [onTap] take function.
  /// and in calling this function into [onTapUp].
  final VoidCallback onTap;

  /// As default [HoverButton] haven't border.
  /// and that is custom border for use by user.
  final Border border;

  /// As deafult [HoverButton] has transparent color.
  /// and when user tap on it, this color would change/animate.
  /// So animated color of [HoverButton] is [spashColor]
  final Color spashColor;

  /// color of [title] property
  final Color titleColor;

  /// When user tap on button, this [titleColor] would change/animate with [animatedTitleColor]
  final Color animatedTitleColor;

  /// size of [title] property
  final double titleSize;

  /// weight of [title] property
  final FontWeight titleWeight;

  /// Border Radius of [border] propery
  final BorderRadiusGeometry borderRadius;

  /// Duration of animation, so [splashColor]'s duration.
  final Duration duration;

  HoverButton({
    Key key,

    /// can't go blank [title] property
    @required this.title,

    /// can't go blank [onTap] property
    @required this.onTap,

    // * The use of these properties is user dependent.
    this.border,
    this.spashColor,
    this.titleColor,
    this.animatedTitleColor,
    this.titleSize,
    this.borderRadius,
    this.titleWeight,
    this.duration,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton>
    with SingleTickerProviderStateMixin {
  /// For controle and manage [_colorAnimation] and [_textColorAnimation]
  AnimationController _animationController;

  // * Animations to change/animate spash and title.
  Animation<Color> _colorAnimation;
  Animation<Color> _textColorAnimation;

  @override
  void initState() {
    super.initState();

    // Set Animation controller by default values and make able to customize.
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 300),
    );

    // Set Animation of spash by default values and make able to costumize
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: (widget.spashColor != null) ? widget.spashColor : Colors.black,
    ).animate(_animationController);

    // Set Animation of text by default values and make able to costumize
    _textColorAnimation = ColorTween(
      begin: (widget.titleColor != null) ? widget.titleColor : Colors.black,
      end: (widget.animatedTitleColor != null)
          ? widget.animatedTitleColor
          : Colors.white,
    ).animate(_animationController);

    /// Listen [_animationController].
    /// when detected act in [_animationController] return [setState]
    /// for rebuild the state of screen.
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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

      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Container(
          decoration: decoration(),
          child: Center(child: title()),
        ),
      ),
    );
  }

  Text title() => Text(
        widget.title,
        style: TextStyle(
          fontSize: widget.titleSize,
          color: _textColorAnimation.value,
          fontWeight: widget.titleWeight,
        ),
      );

  Decoration decoration() => BoxDecoration(
        borderRadius: (widget.borderRadius == null)
            ? BorderRadius.circular(0)
            : widget.borderRadius,
        border: (widget.border != null) ? widget.border : Border(),
        color: _colorAnimation.value,
      );
}
