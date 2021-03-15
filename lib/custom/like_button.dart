import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  /// [onTap] take function.
  /// and it would call into [onTapUp].
  final VoidCallback onTap;

  /// In default [LikeButton] takes: [Icons.favorite]
  /// If wanna change this, should use [icon] property
  final IconData icon;

  // Duration of Size, Color and Curves animation.
  final Duration duration;

  /// In default [LikeButton] takes: [Curves.bounceInOut] curve.
  /// If wanna change this, should use [curve] property.
  final Curve curve;

  /// In default [deactiveColor] equals [Colors.grey[400]].
  /// And user can cutomize it by using [deactiveColor].
  final Color deactiveColor;

  /// In default [activeColor] equals [Colors.red].
  /// And user can cutomize it by using [activeColor].
  final Color activeColor;

  /// In default size of [LikeButton] is [30]
  /// And user can customize it by using [deactiveSize] property.
  final double deactiveSize;

  /// In default [activeSize] of [LikeButton] is [33]
  /// And user can customize it by using [activeSize] property.
  final double activeSize;

  LikeButton({
    /// can't go blank [title] property
    @required this.onTap,

    // * The use of these properties is user dependent.
    this.icon,
    this.duration,
    this.curve,
    this.deactiveColor,
    this.activeColor,
    this.deactiveSize,
    this.activeSize,
  });
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  /// For controle and manage [_colorAnimation], [_sizeAnimation] and [_curve].
  AnimationController _animationController;

  // * Animations to change/animate Icon's color and size.
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;

  // Curve to change color and size with folowing animation path.
  Animation _curve;

  bool _isTapped = false;

  @override
  void initState() {
    super.initState();

    // Set Animation controller by default values and make able to customize.
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 250),
    );

    /// Set Curve of [_animationController] by default values and make able to costumize
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: (widget.curve != null) ? widget.curve : Curves.bounceInOut,
    );

    /// Set color animation by default values and make able to costumize
    _colorAnimation = ColorTween(
      begin: (widget.deactiveColor != null)
          ? widget.deactiveColor
          : Colors.grey[400],
      end: (widget.activeColor != null) ? widget.activeColor : Colors.red,
    ).animate(_curve);

    /// Set size animation by default values and make able to costumize
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      /// First act is animating [widget.deactiveSize] to [widget.activeSize]
      /// If these variables equals to null, then aniamtion would be [30] to [33]
      TweenSequenceItem(
        tween: Tween<double>(
          begin: (widget.deactiveSize != null) ? widget.deactiveSize : 30,
          end: (widget.activeSize != null) ? widget.activeSize : 33,
        ),
        weight: (widget.activeSize != null) ? widget.activeSize : 33,
      ),

      /// First act is animating [widget.activeSize] to [widget.deactiveSize]
      /// If these variables equals to null, then aniamtion would be [33] to [30]
      TweenSequenceItem(
        tween: Tween<double>(
          begin: (widget.activeSize != null) ? widget.activeSize : 33,
          end: (widget.deactiveSize != null) ? widget.deactiveSize : 30,
        ),
        weight: (widget.activeSize != null) ? widget.activeSize : 33,
      ),

      /// animate by [_curve]
    ]).animate(_curve);

    /// Listen status changes of [_animationController].
    /// and by following status of [_animationController] change [_isTapped].
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isTapped = false;
        });
      } else if (status == AnimationStatus.completed) {
        setState(() {
          _isTapped = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => GestureDetector(
        onTap: animeAct,
        child: icon(),
      ),
    );
  }

  // * Animation Acter of LikeButton
  void animeAct() {
    _isTapped ? _animationController.reverse() : _animationController.forward();
    widget.onTap();
  }

  // * body of LikeButton
  Icon icon() => Icon(
        (widget.icon != null) ? widget.icon : Icons.favorite,
        color: _colorAnimation.value,
        size: _sizeAnimation.value,
      );
}
