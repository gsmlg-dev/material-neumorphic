import 'package:flutter/material.dart';

import 'box_shape.dart';
import 'box_shape_clipper.dart';
import 'decoration/neumorphic_decorations.dart';
import 'theme.dart';
import 'style.dart';

@immutable
class Neumorphic extends StatelessWidget {
  static const defaultDuration = Duration(milliseconds: 100);
  static const defaultCurve = Curves.linear;

  static const double minDepth = -20.0;
  static const double maxDepth = 20.0;

  static const double minIntensity = 0.0;
  static const double maxIntensity = 1.0;

  static const double minCurve = 0.0;
  static const double maxCurve = 1.0;

  final Widget? child;

  final NeumorphicStyle? style;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Curve curve;
  final Duration duration;
  final bool
      drawSurfaceAboveChild; //if true => boxDecoration & foreground decoration, else => boxDecoration does all the work

  Neumorphic({
    Key? key,
    this.child,
    this.duration = Neumorphic.defaultDuration,
    this.curve = Neumorphic.defaultCurve,
    this.style,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.drawSurfaceAboveChild = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NeumorphicTheme? neumorphicTheme =
        Theme.of(context).extension<NeumorphicTheme>();
    final NeumorphicStyle style = (this.style ?? NeumorphicStyle())
        .copyWithTheme(neumorphicTheme!)
        .applyDisableDepth();

    return _NeumorphicContainer(
      color: style.color!,
      padding: padding,
      drawSurfaceAboveChild: drawSurfaceAboveChild,
      duration: duration,
      style: style,
      curve: curve,
      margin: margin,
      child: child,
    );
  }
}

class _NeumorphicContainer extends StatelessWidget {
  final Color color;
  final NeumorphicStyle style;
  final Widget? child;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;
  final bool drawSurfaceAboveChild;
  final EdgeInsets padding;

  _NeumorphicContainer({
    Key? key,
    this.child,
    required this.color,
    required this.padding,
    required this.margin,
    required this.duration,
    required this.curve,
    required this.style,
    required this.drawSurfaceAboveChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = style.boxShape ?? NeumorphicBoxShape.rect();

    return AnimatedContainer(
      margin: margin,
      duration: duration,
      curve: curve,
      child: NeumorphicBoxShapeClipper(
        shape: shape,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
      foregroundDecoration: NeumorphicDecoration(
        isForeground: true,
        renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
        splitBackgroundForeground: drawSurfaceAboveChild,
        style: style,
        shape: shape,
      ),
      decoration: NeumorphicDecoration(
        isForeground: false,
        renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
        splitBackgroundForeground: drawSurfaceAboveChild,
        style: style,
        shape: shape,
      ),
    );
  }
}
