library flutter_button;

import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Duration duration;
  final Curve curve;
  final Color deactiveColor;
  final Color activeColor;
  final double deactiveSize;
  final double activeSize;

  LikeButton({
    @required this.onTap,
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
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  Animation _curve;

  bool isTapped = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 250),
    );

    _curve = CurvedAnimation(
      parent: _animationController,
      curve: (widget.curve != null) ? widget.curve : Curves.bounceInOut,
    );

    _colorAnimation = ColorTween(
      begin: (widget.deactiveColor != null)
          ? widget.deactiveColor
          : Colors.grey[400],
      end: (widget.activeColor != null) ? widget.activeColor : Colors.red,
    ).animate(_curve);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
        tween: Tween<double>(
          begin: (widget.deactiveSize != null) ? widget.deactiveSize : 30,
          end: (widget.activeSize != null) ? widget.activeSize : 33,
        ),
        weight: (widget.activeSize != null) ? widget.activeSize : 33,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: (widget.activeSize != null) ? widget.activeSize : 33,
          end: (widget.deactiveSize != null) ? widget.deactiveSize : 30,
        ),
        weight: (widget.activeSize != null) ? widget.activeSize : 33,
      ),
    ]).animate(_curve);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isTapped = false;
        });
      } else if (status == AnimationStatus.completed) {
        setState(() {
          isTapped = true;
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
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            isTapped
                ? _animationController.reverse()
                : _animationController.forward();
            widget.onTap();
          },
          child: Icon(
            (widget.icon != null) ? widget.icon : Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
        );
      },
    );
  }
}
