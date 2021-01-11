library flutter_button;

import 'dart:async';

import 'package:flutter/material.dart';

class InstaLoveButton extends StatefulWidget {
  final ImageProvider<Object> image;
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final double height;
  final double width;
  final Duration duration;
  final Curve curve;
  final double size;

  InstaLoveButton({
    @required this.image,
    @required this.onTap,
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
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  Animation _curve;

  bool _isTapped = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 500),
    );

    _curve = CurvedAnimation(
      parent: _animationController,
      curve: (widget.curve != null) ? widget.curve : Curves.easeInOut,
    );

    // Curves.easeOut,

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.size != null) ? widget.size - 20 : 100,
            end: (widget.size != null) ? widget.size : 120,
          ),
          weight: (widget.size != null) ? widget.size : 120,
        ),
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
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onDoubleTap: () => onDoubleTapFun(),
          onDoubleTapCancel: () => onDoubleTapCancelFun(),
          child: Container(
            height: (widget.height != null) ? widget.height : 300,
            width: (widget.width != null)
                ? widget.width
                : MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.image,
              ),
            ),
            child: Center(
              child: buildIconButton(),
            ),
          ),
        );
      },
    );
  }

  AnimatedOpacity buildIconButton() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 100),
      opacity: _isTapped ? 1 : 0,
      child: Icon(
        (widget.icon != null) ? widget.icon : Icons.favorite,
        size: _sizeAnimation.value,
        color: (widget.iconColor != null) ? widget.iconColor : Colors.grey[200],
      ),
    );
  }

  void onDoubleTapFun() {
    setState(() {
      _isTapped = true;
    });
    Timer(Duration(milliseconds: 80), () {
      _animationController.forward();
    });

    widget.onTap();

    Timer(Duration(seconds: 1), () {
      setState(() {
        _isTapped = false;
      });
      _animationController.reverse();
    });
  }

  void onDoubleTapCancelFun() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        _isTapped = false;
      });
      _animationController.reverse();
    });
  }
}
