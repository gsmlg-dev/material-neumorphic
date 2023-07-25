import 'package:flutter/material.dart';

import 'box_shape.dart';
import 'box_shape_clipper.dart';
import 'decoration/neumorphic_decorations.dart';
import 'theme.dart';
import 'style.dart';

@immutable
class Neumorphic extends StatelessWidget {
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
    this.style,
    this.duration = NeumorphicTheme.defaultDuration,
    this.curve = NeumorphicTheme.defaultCurve,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.drawSurfaceAboveChild = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NeumorphicTheme? neumorphicTheme =
        Theme.of(context).extension<NeumorphicTheme>();
    final NeumorphicStyle style =
        (neumorphicTheme?.getNeumorphicStyle() ?? NeumorphicStyle())
            .merge(this.style);

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
