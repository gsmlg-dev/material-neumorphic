import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

/// A container that takes the current [NeumorphicTheme] baseColor as backgroundColor
/// @see [NeumorphicTheme]
///
///
/// It can provide too a roundRect clip of the screen border using [borderRadius], [margin] and [backendColor]
///
/// ```
/// NeumorphicBackground(
///      borderRadius: BorderRadius.circular(12),
///      margin: EdgeInsets.all(12),
///      child: ...`
/// )
/// ```
@immutable
class NeumorphicBackground extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color backendColor;
  final BorderRadius? borderRadius;

  const NeumorphicBackground({
    this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backendColor = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    final NeumorphicTheme? theme =
        Theme.of(context).extension<NeumorphicTheme>();
    return Container(
      padding: margin,
      color: theme?.baseColor,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: AnimatedContainer(
          color: theme?.baseColor,
          padding: padding,
          duration: const Duration(milliseconds: 100),
          child: child,
        ),
      ),
    );
  }
}
