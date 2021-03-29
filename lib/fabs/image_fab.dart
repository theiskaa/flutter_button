import 'package:flutter/material.dart';

class ImageFAB extends StatefulWidget {
  final ImageProvider<Object> image;
  final Function onTap;
  final Widget child;
  final double size;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder border;
  final List<BoxShadow> shadows;
  final bool wOpacity;
  final double opacityValue;

  ///
  final void Function(Object, StackTrace) onImageError;
  final ColorFilter imageColorFilter;
  final BoxFit imageFit;
  final AlignmentGeometry imageAlignment;
  final Rect imageCenterSlice;
  final ImageRepeat imageRepeat;
  final bool imageMatchTextDirection;
  final double imageScale;

  const ImageFAB({
    Key key,
    @required this.image,
    @required this.onTap,
    this.child,
    this.size,
    this.borderRadius,
    this.border,
    this.shadows,
    this.wOpacity,
    this.opacityValue,

    ///
    this.onImageError,
    this.imageColorFilter,
    this.imageFit,
    this.imageAlignment,
    this.imageCenterSlice,
    this.imageRepeat,
    this.imageMatchTextDirection,
    this.imageScale,
  }) : super(key: key);

  @override
  _ImageFABState createState() => _ImageFABState();
}

class _ImageFABState extends State<ImageFAB> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (det) {
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (det) {
        setState(() {
          isTapped = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      child: (widget.wOpacity != null && widget.wOpacity != false)
          ? buildButtonBodyWOpacity()
          : buildButtonBody(),
    );
  }

  Opacity buildButtonBodyWOpacity() {
    return Opacity(
      opacity: isTapped
          ? (widget.opacityValue != null)
              ? widget.opacityValue
              : 0.5
          : 1,
      child: buildButtonBody(),
    );
  }

  Container buildButtonBody() {
    return Container(
      height: (widget.size != null) ? widget.size : 60,
      width: (widget.size != null) ? widget.size : 60,
      decoration: buildBoxDecoration(),
      child: (widget.child != null) ? Center(child: widget.child) : Container(),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius != null)
          ? widget.borderRadius
          : BorderRadius.circular(100),
      border: (widget.border != null) ? widget.border : Border.all(),
      boxShadow: (widget.shadows != null)
          ? widget.shadows
          : [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 10),
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(.2),
              ),
            ],
      image: buildImage(),
    );
  }

  DecorationImage buildImage() {
    return DecorationImage(
      image: widget.image,
      onError: widget.onImageError,
      colorFilter: widget.imageColorFilter,
      fit: widget.imageFit,
      alignment: (widget.imageAlignment != null)
          ? widget.imageAlignment
          : Alignment.center,
      centerSlice: widget.imageCenterSlice,
      repeat: (widget.imageRepeat != null)
          ? widget.imageRepeat
          : ImageRepeat.noRepeat,
      matchTextDirection: (widget.imageMatchTextDirection != null)
          ? widget.imageMatchTextDirection
          : false,
      scale: (widget.imageScale != null) ? widget.imageScale : 1.0,
    );
  }
}

class AnimatedImageFAB extends StatefulWidget {
  final ImageProvider<Object> image;
  final Function onTap;
  final Widget child;
  final double defaultSize;
  final double tappedSize;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder border;
  final List<BoxShadow> shadows;
  final Duration duration;

  final void Function(Object, StackTrace) onImageError;
  final ColorFilter imageColorFilter;
  final BoxFit imageFit;
  final AlignmentGeometry imageAlignment;
  final Rect imageCenterSlice;
  final ImageRepeat imageRepeat;
  final bool imageMatchTextDirection;
  final double imageScale;

  const AnimatedImageFAB({
    Key key,
    @required this.image,
    @required this.onTap,
    this.child,
    this.defaultSize,
    this.tappedSize,
    this.borderRadius,
    this.border,
    this.shadows,
    this.duration,

    this.onImageError,
    this.imageColorFilter,
    this.imageFit,
    this.imageAlignment,
    this.imageCenterSlice,
    this.imageRepeat,
    this.imageMatchTextDirection,
    this.imageScale,
  }) : super(key: key);

  @override
  _AnimatedImageFABState createState() => _AnimatedImageFABState();
}

class _AnimatedImageFABState extends State<AnimatedImageFAB>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation _sizeAnimation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: (widget.duration != null)
          ? widget.duration
          : Duration(milliseconds: 300),
    );

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: (widget.defaultSize != null) ? widget.defaultSize : 60,
            end: (widget.tappedSize != null) ? widget.tappedSize : 55,
          ),
          weight: (widget.defaultSize != null) ? widget.defaultSize : 60,
        ),
      ],
    ).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
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
      onTapUp: (det) {
        _animationController.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      child: buildButtonBody(),
    );
  }

  Container buildButtonBody() {
    return Container(
      height: _sizeAnimation.value,
      width: _sizeAnimation.value,
      decoration: buildBoxDecoration(),
      child: (widget.child != null) ? Center(child: widget.child) : Container(),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius != null)
          ? widget.borderRadius
          : BorderRadius.circular(100),
      border: (widget.border != null) ? widget.border : Border.all(),
      boxShadow: (widget.shadows != null)
          ? widget.shadows
          : [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 10),
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(.2),
              ),
            ],
      image: buildImage(),
    );
  }

  DecorationImage buildImage() {
    return DecorationImage(
      image: widget.image,
      onError: widget.onImageError,
      colorFilter: widget.imageColorFilter,
      fit: widget.imageFit,
      alignment: (widget.imageAlignment != null)
          ? widget.imageAlignment
          : Alignment.center,
      centerSlice: widget.imageCenterSlice,
      repeat: (widget.imageRepeat != null)
          ? widget.imageRepeat
          : ImageRepeat.noRepeat,
      matchTextDirection: (widget.imageMatchTextDirection != null)
          ? widget.imageMatchTextDirection
          : false,
      scale: (widget.imageScale != null) ? widget.imageScale : 1.0,
    );
  }
}
