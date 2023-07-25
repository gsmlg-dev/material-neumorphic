import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'theme.dart';

/// Defines default colors used in Neumorphic theme & shadows generators
@immutable
class NeumorphicColors {
  static const Color decorationMaxWhiteColor =
      Color(0xFFFFFFFF); //for intensity = 1
  static const Color decorationMaxDarkColor =
      Color(0x8A000000); //for intensity = 1

  static const Color embossMaxWhiteColor =
      Color(0x99FFFFFF); //for intensity = 1
  static const Color embossMaxDarkColor = Color(0x73000000); //for intensity = 1

  static const Color _gradientShaderDarkColor = Color(0x8A000000);
  static const Color _gradientShaderWhiteColor = Color(0xFFFFFFFF);

  NeumorphicColors._();

  static Color decorationWhiteColor(Color color, {required double intensity}) {
    // intensity act on opacity;
    return _applyPercentageOnOpacity(
      maxColor: color,
      percent: intensity,
    );
  }

  static Color decorationDarkColor(Color color, {required double intensity}) {
    // intensity act on opacity;
    return _applyPercentageOnOpacity(
      maxColor: color,
      percent: intensity,
    );
  }

  static Color embossWhiteColor(Color color, {required double intensity}) {
    // intensity act on opacity;
    return _applyPercentageOnOpacity(
      maxColor: color,
      percent: intensity,
    );
  }

  static Color embossDarkColor(Color color, {required double intensity}) {
    // intensity act on opacity;
    return _applyPercentageOnOpacity(
      maxColor: color,
      percent: intensity,
    );
  }

  static Color gradientShaderDarkColor({required double intensity}) {
    // intensity act on opacity;
    return _applyPercentageOnOpacity(
        maxColor: NeumorphicColors._gradientShaderDarkColor,
        percent: intensity);
  }

  static Color gradientShaderWhiteColor({required double intensity}) {
    // intensity act on opacity;
    return _applyPercentageOnOpacity(
        maxColor: NeumorphicColors._gradientShaderWhiteColor,
        percent: intensity);
  }

  static Color _applyPercentageOnOpacity(
      {required Color maxColor, required double percent}) {
    final maxOpacity = maxColor.opacity;
    final maxIntensity = NeumorphicTheme.maxIntensity;
    final newOpacity = percent * maxOpacity / maxIntensity;
    final newColor =
        maxColor.withOpacity(newOpacity); //<-- intensity act on opacity;
    return newColor;
  }
}
