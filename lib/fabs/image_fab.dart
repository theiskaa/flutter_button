library flutter_button;

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
      opacity: isTapped ? (widget.opacityValue != null) ? widget.opacityValue : 0.5 : 1,
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
