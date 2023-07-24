import 'package:flutter/material.dart';

import 'border.dart';
import 'box_shape.dart';
import 'colors.dart';
import 'container.dart';
import 'light_source.dart';
import 'shape.dart';

const double _defaultDepth = 4;
const double _defaultIntensity = 0.7;
const Color _defaultAccent = NeumorphicColors.accent;
const Color _defaultVariant = NeumorphicColors.variant;
const Color _defaultDisabledColor = NeumorphicColors.disabled;
const Color _defaultTextColor = NeumorphicColors.defaultTextColor;
const Color _defaultBaseColor = NeumorphicColors.background;
const double _defaultBorderSize = 0.3;
const NeumorphicShape _defaultShape = NeumorphicShape.flat;

@immutable
class NeumorphicTheme extends ThemeExtension<NeumorphicTheme> {
  static const defaultSeedColor = Color.fromARGB(255, 221, 230, 232);
  static const defaultDepth = _defaultDepth;
  static const defaultIntensity = _defaultIntensity;

  final Color baseColor;
  final Color accentColor;
  final Color variantColor;
  final Color disabledColor;

  final Color? color;
  final double _depth;
  final double _intensity;
  final double _surfaceIntensity;
  final LightSource lightSource;

  final NeumorphicBorder border;

  final bool oppositeShadowLightSource;

  final Color defaultTextColor;

  final NeumorphicShape shape;
  final NeumorphicBoxShape? boxShape;
  final Color borderColor;
  final double borderWidth;

  //override the "white" color
  final Color? shadowLightColor;

  //override the "white" color
  final Color? shadowLightColorEmboss;

  //override the "dark" color
  final Color? shadowDarkColor;

  //override the "dark" color
  final Color? shadowDarkColorEmboss;

  const NeumorphicTheme({
    this.shape = _defaultShape,
    this.lightSource = LightSource.topLeft,
    this.border = const NeumorphicBorder.none(),
    this.baseColor = _defaultBaseColor,
    this.accentColor = _defaultAccent,
    this.variantColor = _defaultVariant,
    this.disabledColor = _defaultDisabledColor,
    this.color = _defaultBaseColor,
    this.boxShape, //nullable by default, will use the one defined in theme if not set
    this.shadowLightColor = const Color.fromARGB(255, 214, 99, 99),
    this.shadowLightColorEmboss = const Color.fromARGB(153, 228, 133, 133),
    this.shadowDarkColor = const Color.fromARGB(136, 5, 102, 1),
    this.shadowDarkColorEmboss = const Color.fromARGB(115, 21, 63, 26),
    this.oppositeShadowLightSource = false,
    this.borderColor = const Color.fromARGB(51, 203, 110, 110),
    this.borderWidth = _defaultBorderSize,
    this.defaultTextColor = _defaultTextColor,
    double? depth,
    double? intensity,
    double? surfaceIntensity,
  })  : _depth = depth ?? _defaultDepth,
        _intensity = intensity ?? _defaultIntensity,
        _surfaceIntensity = surfaceIntensity ?? 0.25;

  double get depth => _depth.clamp(Neumorphic.minDepth, Neumorphic.maxDepth);

  double get intensity =>
      _intensity.clamp(Neumorphic.minIntensity, Neumorphic.maxIntensity);

  double get surfaceIntensity => _surfaceIntensity.clamp(
      Neumorphic.minIntensity, Neumorphic.maxIntensity);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicTheme &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          boxShape == other.boxShape &&
          border == other.border &&
          shadowDarkColor == other.shadowDarkColor &&
          shadowLightColor == other.shadowLightColor &&
          shadowDarkColorEmboss == other.shadowDarkColorEmboss &&
          shadowLightColorEmboss == other.shadowLightColorEmboss &&
          _depth == other._depth &&
          _intensity == other._intensity &&
          _surfaceIntensity == other._surfaceIntensity &&
          lightSource == other.lightSource &&
          oppositeShadowLightSource == other.oppositeShadowLightSource &&
          shape == other.shape;

  @override
  int get hashCode =>
      color.hashCode ^
      shadowDarkColor.hashCode ^
      boxShape.hashCode ^
      shadowLightColor.hashCode ^
      shadowDarkColorEmboss.hashCode ^
      shadowLightColorEmboss.hashCode ^
      _depth.hashCode ^
      border.hashCode ^
      _intensity.hashCode ^
      _surfaceIntensity.hashCode ^
      lightSource.hashCode ^
      oppositeShadowLightSource.hashCode ^
      shape.hashCode;

  @override
  NeumorphicTheme copyWith({
    Color? color,
    Color? accentColor,
    NeumorphicBorder? border,
    NeumorphicBoxShape? boxShape,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Color? shadowLightColorEmboss,
    Color? shadowDarkColorEmboss,
    double? depth,
    double? intensity,
    double? surfaceIntensity,
    LightSource? lightSource,
    double? borderRadius,
    bool? oppositeShadowLightSource,
    NeumorphicShape? shape,
  }) {
    return NeumorphicTheme(
      color: color ?? this.color,
      accentColor: accentColor ?? this.accentColor,
      border: border ?? this.border,
      boxShape: boxShape ?? this.boxShape,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColorEmboss:
          shadowDarkColorEmboss ?? this.shadowDarkColorEmboss,
      shadowLightColorEmboss:
          shadowLightColorEmboss ?? this.shadowLightColorEmboss,
      depth: depth ?? this.depth,
      intensity: intensity ?? this.intensity,
      surfaceIntensity: surfaceIntensity ?? this.surfaceIntensity,
      lightSource: lightSource ?? this.lightSource,
      oppositeShadowLightSource:
          oppositeShadowLightSource ?? this.oppositeShadowLightSource,
      shape: shape ?? this.shape,
    );
  }

  @override
  NeumorphicTheme lerp(NeumorphicTheme? other, double t) {
    if (other is! NeumorphicTheme) {
      return this;
    }
    return NeumorphicTheme(
      color: Color.lerp(color, other.color, t),
      shadowDarkColor: Color.lerp(shadowDarkColor, other.shadowDarkColor, t),
      shadowLightColor: Color.lerp(shadowLightColor, other.shadowLightColor, t),
      shadowDarkColorEmboss:
          Color.lerp(shadowDarkColorEmboss, other.shadowDarkColorEmboss, t),
      shadowLightColorEmboss:
          Color.lerp(shadowLightColorEmboss, other.shadowLightColorEmboss, t),
    );
  }

  NeumorphicTheme fitWithColorSchema(ColorScheme colorScheme) {
    return copyWith(
      color: colorScheme.secondaryContainer,
      accentColor: colorScheme.primary,
      shadowLightColor: colorScheme.brightness == Brightness.light
          ? colorScheme.surface
          : colorScheme.onSurface,
      shadowLightColorEmboss: colorScheme.brightness == Brightness.light
          ? colorScheme.surfaceVariant
          : colorScheme.onSurfaceVariant,
      shadowDarkColor: colorScheme.brightness == Brightness.light
          ? colorScheme.onSurface
          : colorScheme.surface,
      shadowDarkColorEmboss: colorScheme.brightness == Brightness.light
          ? colorScheme.onSurfaceVariant
          : colorScheme.surfaceVariant,
    );
  }

  @override
  String toString() {
    return 'NeumorphicTheme{color: $color, boxShape: $boxShape, _depth: $_depth, intensity: $intensity, lightSource: $lightSource, shape: $shape, oppositeShadowLightSource: $oppositeShadowLightSource}';
  }
}
