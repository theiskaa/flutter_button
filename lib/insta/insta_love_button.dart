import 'dart:async';

import 'package:flutter/material.dart';

class InstaLoveButton extends StatefulWidget {
  /// The image of Button/Card,
  /// All the functions, animations would build on this [image].
  final ImageProvider<Object> image;

  /// The func. which would call with following animation.
  final VoidCallback onTap;

  /// In deafult [icon] equals [Icons.favorite].
  /// And user can cutomize it by using [icon] property.
  final IconData icon;

  /// As deafult [iconColor] was [Colors.grey[200]].
  /// and so user can customize it by [iconColor].
  final Color iconColor;

  // Height of Button card (image).
  final double height;

  // Width of Button card (image).
  final double width;

  /// The duration property to customize,
  /// duration of [_animationController]/
  final Duration duration;

  /// As default [curve] is [Curves.easeInOut],
  /// And user can customize/change it by using [curve] property.
  final Curve curve;

  /// As default size is [120]
  /// User can customize it, (make small or large).
  final double size;

  InstaLoveButton({
    /// can't go blank [image] property
    @required this.image,

    /// can't go blank [onTap] property
    @required this.onTap,

    // * The use of these properties is user dependent.
    this.icon,
    this.iconColor,
    this.height,
    this.width,
    this.duration,
    this.curve,
    this.size,
  });
  @override
  _InstaLoveButtonState createState() => _InstaLoveButtonState();
}

class _InstaLoveButtonState extends State<InstaLoveButton>
    with TickerProviderStateMixin {
  /// To controle [_sizeAnimation] and [_curve].
  AnimationController _animationController;

  // Animation to change size
  Animation<double> _sizeAnimation;

  // Curve to change color and size with folowing animation path.
  Animation _curve;

  bool _isTapped = false;

  @override
  void initState() {
    // Set Animation controller by default values and make able to customize.
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 500),
    );

    /// Set Curve of [_animationController] by default values and make able to costumize
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: (widget.curve != null) ? widget.curve : Curves.easeInOut,
    );

    /// Set size animation by default values and make able to costumize
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        /// First act is animating [widget.size - 20] to [widget.size]
        /// If these variables equals to null, then aniamtion would be [100] to [120]
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.size != null) ? widget.size - 20 : 100,
            end: (widget.size != null) ? widget.size : 120,
          ),
          weight: (widget.size != null) ? widget.size : 120,
        ),

        /// First act is animating [widget.size] to [widget.size - 20]
        /// If these variables equals to null, then aniamtion would be [120] to [100]
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.size != null) ? widget.size : 120,
            end: (widget.size != null) ? widget.size - 20 : 100,
          ),
          weight: (widget.size != null) ? widget.size : 120,
        ),
      ],
    ).animate(_curve);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => GestureDetector(
          onDoubleTap: () => onAct(),
          onDoubleTapCancel: () => onActCancel(),
          child: button(context),
        ),
      );

  // The body of InstaLoveButton
  button(BuildContext context) => Container(
        height: (widget.height != null) ? widget.height : 300,
        width: (widget.width != null)
            ? widget.width
            : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: widget.image),
        ),
        child: Center(child: buildIcon()),
      );

  // The body's child so Animated icon.
  buildIcon() => AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: _isTapped ? 1 : 0,
        child: Icon(
          (widget.icon != null) ? widget.icon : Icons.favorite,
          size: _sizeAnimation.value,
          color:
              (widget.iconColor != null) ? widget.iconColor : Colors.grey[200],
        ),
      );

  void onAct() {
    /// First make [_isTapped] true.
    setState(() {
      _isTapped = true;
    });

    /// Wait 80 milisecond and forward [_animationController]
    Timer(Duration(milliseconds: 80), () {
      _animationController.forward();
    });

    /// Then would call [widget.onTap] func.
    widget.onTap();

    /// Wait one sec.
    /// then make [_isTapped] false.
    /// and reverse the [_animationController].
    Timer(Duration(seconds: 1), () {
      setState(() {
        _isTapped = false;
      });
      _animationController.reverse();
    });
  }

  void onActCancel() {
    /// Wait one sec.

    Timer(Duration(seconds: 1), () {
      /// then make [_isTapped] false.
      setState(() {
        _isTapped = false;
      });

      /// and reverse the [_animationController].
      _animationController.reverse();
    });
  }
}
