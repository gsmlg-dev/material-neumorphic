import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_text/material_neumorphic_text.dart';

class NeumorphicIcons {
  NeumorphicIcons._();

  static const _kFontFam = 'NeumorphicIcons';
  static const _kFontPkg = "flutter_neumorphic";

  static const IconData check =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

@immutable
class NeumorphicIcon extends StatelessWidget {
  final IconData icon;
  final NeumorphicStyle? style;
  final Curve curve;
  final double size;
  final Duration duration;

  NeumorphicIcon(
    this.icon, {
    Key? key,
    this.duration = NeumorphicTheme.defaultDuration,
    this.curve = NeumorphicTheme.defaultCurve,
    this.style,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicText(
      String.fromCharCode(icon.codePoint),
      textStyle: NeumorphicTextStyle(
        fontSize: size,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
      duration: duration,
      style: style,
      curve: curve,
    );
  }
}
