import 'package:flutter/material.dart';
import 'package:flutter_button/custom/opacity_button.dart';

class AuthButton extends StatefulWidget {
  final Function onTap;
  final Widget child;
  final Color backgroundColor;
  final Border border;
  final List<BoxShadow> shadow;
  final bool wGradient;
  final List<Color> gradientColors;
  final DecorationImage decorationImage;
  final double opacityValue;
  final double height;
  final double width;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  const AuthButton({
    Key key,
    @required this.onTap,
    @required this.child,
    this.backgroundColor,
    this.border,
    this.shadow,
    this.wGradient,
    this.gradientColors,
    this.decorationImage,
    this.opacityValue,
    this.height,
    this.width,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,

    ///
  }) : super(key: key);

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onTap: widget.onTap,
      opacityValue: (widget.opacityValue != null) ? widget.opacityValue : .7,
          child: Container(
        height: (widget.height != null) ? widget.height : 70,
        width: (widget.width != null) ? widget.width : 180,
        decoration: buildBoxDecoration(),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: (widget.backgroundColor != null)
          ? widget.backgroundColor
          : Colors.blue,
      border: widget.border,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
            (widget.topLeftRadius != null) ? widget.topLeftRadius : 30),
        topRight: Radius.circular(
            (widget.topRightRadius != null) ? widget.topRightRadius : 30),
        bottomLeft: Radius.circular(
            (widget.bottomLeftRadius != null) ? widget.bottomLeftRadius : 30),
        bottomRight: Radius.circular(
            (widget.bottomRightRadius != null) ? widget.bottomRightRadius : 30),
      ),
      boxShadow: (widget.shadow != null) ? widget.shadow : [],
      image: widget.decorationImage,
      gradient: (widget.wGradient == null || widget.wGradient == false)
          ? null
          : LinearGradient(colors: widget.gradientColors),
    );
  }
}
