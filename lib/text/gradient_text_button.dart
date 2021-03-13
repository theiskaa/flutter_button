import 'package:flutter/material.dart';

class GradientTextButton extends StatefulWidget {
  /// The maint point of button,
  /// So everything would build on [title]
  final String title;

  /// The method wich would call in [onTapUp]
  final VoidCallback onTap;

  /// when [wOpacity] equals true, then Opacity widget would be enabled.
  /// and [opacityValue] would be able to usage.
  final bool wOpacity;

  /// In default [opacityValue] equals [.5], user can customize it.
  /// and this propertys usage is dependent by [wOpacity].
  final double opacityValue;

  /// In default size of [GradientTextButton] is [20]
  /// And user can customize it by using [defaultSize] property.
  final double defaultSize;

  /// In default [tappedSize] of [GradientTextButton] is [18]
  /// And user can customize it by using [tappedSize] property.
  final double tappedSize;

  /// As default [titleWeight] is [FontWeight.w500]
  /// user can customize it by set custom weight with [titleWeight] property
  final FontWeight titleWeight;

  /// The gradient colors of main [title] widget
  final List<Color> gradientColors;

  /// The Aligments of `gradientColors` property
  final AlignmentGeometry beginGradient;
  final AlignmentGeometry endGradient;

  /// As default [GradientTextButton] doesn't use animation.
  /// But user can enable it and start using
  final bool wAnimation;

  // To localization title.
  final Locale titleLocale;

  // To work move title around the screen
  final TextAlign titleAlign;

  // Custom font property.
  final String fontFamily;

  /// As default duration equals [milliseconds: 300],
  /// and user can customize it by [duration] property.
  final Duration duration;

  GradientTextButton({
    Key key,

    /// can't go blank [title] property
    @required this.title,

    /// can't go blank [onTap] property
    @required this.onTap,

    // * The use of these properties is user dependent.
    this.wOpacity,
    this.opacityValue,
    this.defaultSize,
    this.tappedSize,
    this.titleWeight,
    this.gradientColors,
    this.beginGradient,
    this.endGradient,
    this.wAnimation,
    this.titleLocale,
    this.titleAlign,
    this.fontFamily,
    this.duration,
  }) : super(key: key);

  @override
  _GradientTextButtonState createState() => _GradientTextButtonState();
}

class _GradientTextButtonState extends State<GradientTextButton>
    with SingleTickerProviderStateMixin {
  bool _isTapped = false;

  // For manage/animate size of button.
  AnimationController _animationController;

  Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 300),
    );

    _sizeAnimation = Tween<double>(
      begin: (widget.defaultSize != null) ? widget.defaultSize : 20,
      end: (widget.tappedSize != null) ? widget.tappedSize : 18,
    ).animate(_animationController);

    _animationController.addListener(() {});
  }

  /// the right method for [onTapDown],
  /// Getting by following [wAnimation].
  getTrueOnTapDown() {
    if (widget.wAnimation != null && widget.wAnimation != false) {
      _animationController.forward();
    } else {
      setState(() {
        _isTapped = true;
      });
    }
  }

  /// the right method for [onTapCancel],
  /// Getting by following [wAnimation].
  getTrueOnTapCancel() {
    if (widget.wAnimation != false && widget.wAnimation != null) {
      _animationController.reverse();
    } else {
      setState(() {
        _isTapped = false;
      });
    }
  }

  /// the right method for [onTapUp],
  /// Getting by following [wAnimation].
  getTrueOnTapUp() {
    if (widget.wAnimation != false && widget.wAnimation != null) {
      _animationController.reverse();
      widget.onTap();
    } else {
      setState(() {
        _isTapped = false;
      });
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// When you tap the button [_isTapped] would be [true] so pressed,
      onTapDown: (d) => getTrueOnTapDown(),

      /// When cancel tapping the button [_isTapped] would be [false] so canceled,
      onTapCancel: () => getTrueOnTapCancel(),

      /// When you remove your finget on the button [_isTapped] would be [false] so didn't pressed,
      onTapUp: (d) => getTrueOnTapUp(),

      // Get the right child by following properties.
      child: getTrueTitle(),
    );
  }

  /// the right title widget for button's child.
  /// Getting by following [wAnimation] and [wOpacity].
  Widget getTrueTitle() {
    if (widget.wAnimation != false && widget.wAnimation != null) {
      return animatedTitle();
    } else {
      if (widget.wOpacity != false && widget.wOpacity != null) {
        return Opacity(
          opacity: _isTapped
              ? (widget.opacityValue == null)
                  ? .5
                  : widget.opacityValue
              : 1,
          child: title(),
        );
      } else {
        return title();
      }
    }
  }

  /// Title prepared by [AnimatedBuilder].
  /// Make usable when [wAnimation] is equals true.
  Widget animatedTitle() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Text(
        widget.title,
        textAlign:
            (widget.titleAlign != null) ? widget.titleAlign : TextAlign.center,
        style: TextStyle(
          fontSize: _sizeAnimation.value,
          fontWeight: (widget.titleWeight != null)
              ? widget.titleWeight
              : FontWeight.w500,
          locale: widget.titleLocale,
          fontFamily: widget.fontFamily,
          foreground: paintGradient(),
        ),
      ),
    );
  }

  Widget title() => Text(
        widget.title,
        textAlign:
            (widget.titleAlign != null) ? widget.titleAlign : TextAlign.center,
        style: TextStyle(
          fontSize: _isTapped
              ? (widget.tappedSize != null)
                  ? widget.tappedSize
                  : 18
              : (widget.defaultSize != null)
                  ? widget.defaultSize
                  : 20,
          fontWeight: (widget.titleWeight != null)
              ? widget.titleWeight
              : FontWeight.w500,
          locale: widget.titleLocale,
          fontFamily: widget.fontFamily,
          foreground: paintGradient(),
        ),
      );

  Paint paintGradient() => Paint()
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
    );
}
