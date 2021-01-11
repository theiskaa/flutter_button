library flutter_button;

import 'package:flutter/material.dart';

class AnimatedCheckBox extends StatefulWidget {
  final Color inactiveColor;
  final Color activeColor;
  final double defaultSize;
  final double activeSize;
  final Widget child;
  final double borderWidth;
  final BorderRadiusGeometry borderRadius;
  final Color borderColor;
  final Duration duration;

  ///
  AnimatedCheckBox({
    this.inactiveColor,
    this.activeColor,
    this.defaultSize,
    this.activeSize,
    this.child,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.duration,
  });
  @override
  _AnimatedCheckBoxState createState() => _AnimatedCheckBoxState();
}

class _AnimatedCheckBoxState extends State<AnimatedCheckBox>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _sizeAnimation;
  Animation _colorAnimation;
  Animation _curve;

  bool isActive = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 200),
    );

    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _colorAnimation = ColorTween(
      begin: (widget.inactiveColor != null)
          ? widget.inactiveColor
          : Colors.transparent,
      end: (widget.activeColor != null) ? widget.activeColor : Colors.blue,
    ).animate(_animationController);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.defaultSize != null) ? widget.defaultSize : 30,
            end: (widget.activeSize != null) ? widget.activeSize : 35,
          ),
          weight: (widget.activeSize != null) ? widget.activeSize : 35,
        )
      ],
    ).animate(_curve);

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
    return GestureDetector(
      onTap: () {
        _animationController.forward();
      },
      onDoubleTap: () {
        _animationController.reverse();
      },
      child: Container(
        height: _sizeAnimation.value,
        width: _sizeAnimation.value,
        decoration: BoxDecoration(
          color: _colorAnimation.value,
          border: Border.all(
            color:
                (widget.borderColor != null) ? widget.borderColor : Colors.blue,
            width: (widget.borderWidth != null) ? widget.borderWidth : 2,
          ),
          borderRadius: (widget.borderRadius != null)
              ? widget.borderRadius
              : BorderRadius.circular(100),
        ),
      ),
    );
  }
}

///
///
///
///
///
///
///
///
///

// Animated Title CheckBox

class AnimatedTitleCheckBox extends StatefulWidget {
  final String title;
  final Color inactiveColor;
  final Color activeColor;
  final Color inactiveTitleColor;
  final Color activeTitleColor;
  final double defaultSize;
  final double activeSize;
  final double defaultTitleSize;
  final double activeTitleSize;
  final double borderWidth;
  final BorderRadiusGeometry borderRadius;
  final Color borderColor;
  final Duration duration;

  ///
  AnimatedTitleCheckBox({
    @required this.title,
    this.inactiveColor,
    this.activeColor,
    this.inactiveTitleColor,
    this.activeTitleColor,
    this.defaultSize,
    this.activeSize,
    this.activeTitleSize,
    this.defaultTitleSize,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.duration,
  });
  @override
  _AnimatedTitleCheckBoxState createState() => _AnimatedTitleCheckBoxState();
}

class _AnimatedTitleCheckBoxState extends State<AnimatedTitleCheckBox>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _sizeAnimation;
  Animation _colorAnimation;
  Animation _titleColorAnimation;
  Animation _titleSizeAnimation;
  Animation _curve;

  bool isActive = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 200),
    );

    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _colorAnimation = ColorTween(
      begin: (widget.inactiveColor != null)
          ? widget.inactiveColor
          : Colors.transparent,
      end: (widget.activeColor != null) ? widget.activeColor : Colors.blue,
    ).animate(_animationController);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.defaultSize != null) ? widget.defaultSize : 30,
            end: (widget.activeSize != null) ? widget.activeSize : 35,
          ),
          weight: (widget.activeSize != null) ? widget.activeSize : 35,
        )
      ],
    ).animate(_curve);

    _titleColorAnimation = ColorTween(
            begin: (widget.inactiveTitleColor != null)
                ? widget.inactiveTitleColor
                : Colors.black,
            end: (widget.activeColor != null)
                ? widget.activeTitleColor
                : Colors.white)
        .animate(_animationController);

    _titleSizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.defaultTitleSize != null)
                ? widget.defaultTitleSize
                : 14,
            end: (widget.activeTitleSize != null) ? widget.activeTitleSize : 16,
          ),
          weight:
              (widget.activeTitleColor != null) ? widget.activeTitleColor : 16,
        ),
      ],
    ).animate(_curve);

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
    return GestureDetector(
      onTap: () {
        _animationController.forward();
      },
      onDoubleTap: () {
        _animationController.reverse();
      },
      child: Container(
        height: _sizeAnimation.value,
        width: _sizeAnimation.value,
        decoration: BoxDecoration(
          color: _colorAnimation.value,
          border: Border.all(
            color:
                (widget.borderColor != null) ? widget.borderColor : Colors.blue,
            width: (widget.borderWidth != null) ? widget.borderWidth : 2,
          ),
          borderRadius: (widget.borderRadius != null)
              ? widget.borderRadius
              : BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: _titleColorAnimation.value,
              fontSize: _titleSizeAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}

///
///
///
///
///
///
///
///
///
///
///
///
///
///
///

// Animated Icon CheckBox button

class AnimatedIconCheckBox extends StatefulWidget {
  final IconData icon;
  final Color inactiveColor;
  final Color activeColor;
  final Color inactiveIconColor;
  final Color activeIconColor;
  final double defaultSize;
  final double activeSize;
  final double defaultIconSize;
  final double activeIconSize;
  final double borderWidth;
  final BorderRadiusGeometry borderRadius;
  final Color borderColor;
  final Duration duration;

  ///
  AnimatedIconCheckBox({
    @required this.icon,
    this.inactiveColor,
    this.activeColor,
    this.inactiveIconColor,
    this.activeIconColor,
    this.defaultSize,
    this.activeSize,
    this.activeIconSize,
    this.defaultIconSize,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.duration,
  });
  @override
  _AnimatedIconCheckBoxState createState() => _AnimatedIconCheckBoxState();
}

class _AnimatedIconCheckBoxState extends State<AnimatedIconCheckBox>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _sizeAnimation;
  Animation _colorAnimation;
  Animation _iconColorAnimation;
  Animation _iconSizeAnimation;
  Animation _curve;

  bool isActive = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 200),
    );

    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _colorAnimation = ColorTween(
      begin: (widget.inactiveColor != null)
          ? widget.inactiveColor
          : Colors.transparent,
      end: (widget.activeColor != null) ? widget.activeColor : Colors.blue,
    ).animate(_animationController);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.defaultSize != null) ? widget.defaultSize : 30,
            end: (widget.activeSize != null) ? widget.activeSize : 35,
          ),
          weight: (widget.activeSize != null) ? widget.activeSize : 35,
        )
      ],
    ).animate(_curve);

    _iconColorAnimation = ColorTween(
            begin: (widget.inactiveIconColor != null)
                ? widget.inactiveColor
                : Colors.blue,
            end: (widget.activeIconColor != null)
                ? widget.activeIconColor
                : Colors.white)
        .animate(_animationController);

    _iconSizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
        tween: Tween<double>(
          begin: (widget.defaultIconSize != null) ? widget.defaultIconSize : 14,
          end: (widget.activeIconSize != null) ? widget.activeIconSize : 16,
        ),
        weight: (widget.activeIconSize != null) ? widget.activeIconSize : 16,
      ),
    ]).animate(_curve);

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
    return GestureDetector(
      onTap: () {
        _animationController.forward();
      },
      onDoubleTap: () {
        _animationController.reverse();
      },
      child: Container(
        height: _sizeAnimation.value,
        width: _sizeAnimation.value,
        decoration: BoxDecoration(
          color: _colorAnimation.value,
          border: Border.all(
            color:
                (widget.borderColor != null) ? widget.borderColor : Colors.blue,
            width: (widget.borderWidth != null) ? widget.borderWidth : 2,
          ),
          borderRadius: (widget.borderRadius != null)
              ? widget.borderRadius
              : BorderRadius.circular(100),
        ),
        child: Icon(
          widget.icon,
          color: _iconColorAnimation.value,
          size: _iconSizeAnimation.value,
        ),
      ),
    );
  }
}
