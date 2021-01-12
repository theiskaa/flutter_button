import 'package:flutter/material.dart';

class StoryButton extends StatelessWidget {
  final _PaintGradient _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final double size;
  final HitTestBehavior behavior;
  final double childRadius;

  StoryButton({
    this.size,
    this.behavior,
    double strokeWidth,
    double radius,
    this.childRadius,
    @required Gradient gradient,
    @required Widget child,
    @required VoidCallback onPressed,
  })  : this._painter = _PaintGradient(
          strokeWidth: strokeWidth,
          radius: radius,
          gradient: gradient,
        ),
        this._child = child,
        this._callback = onPressed,
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: (behavior != null) ? behavior : HitTestBehavior.translucent,
        onTap: _callback,
        child: Container(
          height: (size != null) ? size : 70,
          width: (size != null) ? size : 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  (childRadius != null) ? childRadius : 300,
                ),
                child: _child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaintGradient extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _PaintGradient({
    @required double strokeWidth,
    @required double radius,
    @required Gradient gradient,
  })  : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    double defaultStroke = (strokeWidth != null) ? strokeWidth : 2;
    double defaultRadius = (radius != null) ? radius : 200;

    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(defaultRadius));

    Rect innerRect = Rect.fromLTWH(
      defaultStroke,
      defaultStroke,
      size.width - defaultStroke * 2,
      size.height - defaultStroke * 2,
    );
    var innerRRect = RRect.fromRectAndRadius(
      innerRect,
      Radius.circular(
        defaultRadius - defaultStroke,
      ),
    );

    _paint.shader = gradient.createShader(outerRect);

    Path firstPath = Path()..addRRect(outerRRect);
    Path seccondPath = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, firstPath, seccondPath);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
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

class AnimatedStoryButton extends StatefulWidget {
  final StoryButton storyButton;
  final Duration duration;
  AnimatedStoryButton({
    @required this.storyButton,
    this.duration,
  });
  @override
  _AnimatedStoryButtonState createState() => _AnimatedStoryButtonState();
}

class _AnimatedStoryButtonState extends State<AnimatedStoryButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 200),
    );

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.storyButton.size,
          end: widget.storyButton.size - 5,
        ),
        weight: widget.storyButton.size,
      ),
    ]).animate(_animationController);

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
      onTapDown: (det) {
        _animationController.forward();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      onTapUp: (det) {
        _animationController.reverse();
      },
      child: Container(
        height: _sizeAnimation.value,
        width: _sizeAnimation.value,
        child: widget.storyButton,
      ),
    );
  }
}
