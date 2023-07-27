import 'package:flutter/material.dart';

import 'border.dart';
import 'box_shape.dart';
import 'light_source.dart';
import 'shape.dart';
import 'style.dart';

const double _defaultBorderSize = 0.3;
const NeumorphicShape _defaultShape = NeumorphicShape.flat;
const Color _defaultSeedColor = Color.fromARGB(255, 221, 230, 232);
final _defaultColorScheme = ColorScheme.fromSeed(seedColor: _defaultSeedColor);

@immutable
class NeumorphicTheme extends ThemeExtension<NeumorphicTheme> {
  static const defaultSeedColor = _defaultSeedColor;
  static final defaultColorScheme = _defaultColorScheme;

  static const double defaultDepth = 4;
  static const double defaultIntensity = 0.7;

  static const defaultDuration = Duration(milliseconds: 100);
  static const defaultCurve = Curves.linear;

  static const double minDepth = -20.0;
  static const double maxDepth = 20.0;

  static const double minIntensity = 0.0;
  static const double maxIntensity = 1.0;

  static const double minCurve = 0.0;
  static const double maxCurve = 1.0;

  final Color? _baseColor;
  final Color? _accentColor;
  final Color? _variantColor;
  final Color? _disabledColor;

  // final Color? color;
  final double _depth;
  final double _intensity;
  final double _surfaceIntensity;
  final LightSource lightSource;

  final bool oppositeShadowLightSource;

  final NeumorphicShape shape;
  final NeumorphicBoxShape boxShape;
  final Color borderColor;
  final double borderWidth;

  final Color shadowLightColor;
  final Color shadowLightColorEmboss;

  final Color shadowDarkColor;
  final Color shadowDarkColorEmboss;

  const NeumorphicTheme({
    this.shape = _defaultShape,
    this.lightSource = LightSource.topLeft,
    this.boxShape = const NeumorphicBoxShape.rect(),
    this.shadowLightColor = const Color.fromARGB(255, 214, 99, 99),
    this.shadowLightColorEmboss = const Color.fromARGB(153, 228, 133, 133),
    this.shadowDarkColor = const Color.fromARGB(136, 5, 102, 1),
    this.shadowDarkColorEmboss = const Color.fromARGB(115, 21, 63, 26),
    this.oppositeShadowLightSource = false,
    this.borderColor = const Color.fromARGB(51, 203, 110, 110),
    this.borderWidth = _defaultBorderSize,
    Color? baseColor,
    Color? accentColor,
    Color? variantColor,
    Color? disabledColor,
    double? depth,
    double? intensity,
    double? surfaceIntensity,
  })  : _depth = depth ?? NeumorphicTheme.defaultDepth,
        _intensity = intensity ?? NeumorphicTheme.defaultIntensity,
        _surfaceIntensity = surfaceIntensity ?? 0.25,
        _baseColor = baseColor,
        _accentColor = accentColor,
        _variantColor = variantColor,
        _disabledColor = disabledColor;

  double get depth =>
      _depth.clamp(NeumorphicTheme.minDepth, NeumorphicTheme.maxDepth);

  double get intensity => _intensity.clamp(
      NeumorphicTheme.minIntensity, NeumorphicTheme.maxIntensity);

  double get surfaceIntensity => _surfaceIntensity.clamp(
      NeumorphicTheme.minIntensity, NeumorphicTheme.maxIntensity);

  Color get baseColor =>
      _baseColor ?? NeumorphicTheme.defaultColorScheme.secondaryContainer;
  Color get accentColor =>
      _accentColor ?? NeumorphicTheme.defaultColorScheme.primary;
  Color get variantColor =>
      _variantColor ?? NeumorphicTheme.defaultColorScheme.primaryContainer;
  Color get disabledColor =>
      _disabledColor ?? NeumorphicTheme.defaultColorScheme.surfaceVariant;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicTheme &&
          runtimeType == other.runtimeType &&
          boxShape == other.boxShape &&
          shadowDarkColor == other.shadowDarkColor &&
          shadowLightColor == other.shadowLightColor &&
          shadowDarkColorEmboss == other.shadowDarkColorEmboss &&
          shadowLightColorEmboss == other.shadowLightColorEmboss &&
          depth == other.depth &&
          intensity == other.intensity &&
          surfaceIntensity == other.surfaceIntensity &&
          lightSource == other.lightSource &&
          oppositeShadowLightSource == other.oppositeShadowLightSource &&
          shape == other.shape;

  @override
  int get hashCode =>
      shadowDarkColor.hashCode ^
      boxShape.hashCode ^
      shadowLightColor.hashCode ^
      shadowDarkColorEmboss.hashCode ^
      shadowLightColorEmboss.hashCode ^
      _depth.hashCode ^
      _intensity.hashCode ^
      _surfaceIntensity.hashCode ^
      lightSource.hashCode ^
      oppositeShadowLightSource.hashCode ^
      shape.hashCode;

  @override
  NeumorphicTheme copyWith({
    Color? baseColor,
    Color? accentColor,
    NeumorphicShape? shape,
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
  }) {
    return NeumorphicTheme(
      baseColor: baseColor ?? this.baseColor,
      accentColor: accentColor ?? this.accentColor,
      boxShape: boxShape ?? this.boxShape,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColorEmboss:
          shadowDarkColorEmboss ?? this.shadowDarkColorEmboss,
      shadowLightColorEmboss:
          shadowLightColorEmboss ?? this.shadowLightColorEmboss,
      shape: shape ?? this.shape,
      depth: depth ?? this.depth,
      intensity: intensity ?? this.intensity,
      surfaceIntensity: surfaceIntensity ?? this.surfaceIntensity,
      lightSource: lightSource ?? this.lightSource,
      oppositeShadowLightSource:
          oppositeShadowLightSource ?? this.oppositeShadowLightSource,
    );
  }

  @override
  NeumorphicTheme lerp(NeumorphicTheme? other, double t) {
    if (other is! NeumorphicTheme) {
      return this;
    }
    return NeumorphicTheme(
      shadowDarkColor: Color.lerp(shadowDarkColor, other.shadowDarkColor, t)!,
      shadowLightColor:
          Color.lerp(shadowLightColor, other.shadowLightColor, t)!,
      shadowDarkColorEmboss:
          Color.lerp(shadowDarkColorEmboss, other.shadowDarkColorEmboss, t)!,
      shadowLightColorEmboss:
          Color.lerp(shadowLightColorEmboss, other.shadowLightColorEmboss, t)!,
    );
  }

  NeumorphicTheme fitWithColorSchema(ColorScheme colorScheme) {
    return copyWith(
      baseColor: colorScheme.secondaryContainer,
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

  NeumorphicStyle getNeumorphicStyle() {
    return NeumorphicStyle(
        color: baseColor,
        boxShape: boxShape,
        shape: shape,
        border: NeumorphicBorder(color: borderColor, width: borderWidth),
        shadowDarkColor: shadowDarkColor,
        shadowLightColor: shadowLightColor,
        shadowDarkColorEmboss: shadowDarkColorEmboss,
        shadowLightColorEmboss: shadowLightColorEmboss,
        depth: depth,
        intensity: intensity,
        disableDepth: false,
        surfaceIntensity: surfaceIntensity,
        oppositeShadowLightSource: oppositeShadowLightSource,
        lightSource: lightSource);
  }

  @override
  String toString() {
    return 'NeumorphicTheme{boxShape: $boxShape, _depth: $_depth, intensity: $intensity, lightSource: $lightSource, shape: $shape, oppositeShadowLightSource: $oppositeShadowLightSource}';
  }
}
