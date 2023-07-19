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
const LightSource _defaultLightSource = LightSource.topLeft;
const Color _defaultBaseColor = NeumorphicColors.background;
const double _defaultBorderSize = 0.3;
const NeumorphicShape _defaultShape = NeumorphicShape.flat;

class NeumorphicTheme extends ThemeExtension<NeumorphicTheme> {
  final Color? color;
  final double? _depth;
  final double? _intensity;
  final double _surfaceIntensity;
  final LightSource lightSource;
  final bool? disableDepth;

  final NeumorphicBorder border;

  final bool oppositeShadowLightSource;

  final NeumorphicShape shape;
  final NeumorphicBoxShape? boxShape;
  final Color borderColor;
  final double borderWidth;

  //override the "white" color
  final Color? shadowLightColor;

  //override the "dark" color
  final Color? shadowDarkColor;

  //override the "white" color
  final Color? shadowLightColorEmboss;

  //override the "dark" color
  final Color? shadowDarkColorEmboss;

  const NeumorphicTheme({
    this.shape = _defaultShape,
    this.lightSource = LightSource.topLeft,
    this.border = const NeumorphicBorder.none(),
    this.color,
    this.boxShape, //nullable by default, will use the one defined in theme if not set
    this.shadowLightColor,
    this.shadowDarkColor,
    this.shadowLightColorEmboss,
    this.shadowDarkColorEmboss,
    double? depth,
    double? intensity,
    double surfaceIntensity = 0.25,
    this.disableDepth,
    this.oppositeShadowLightSource = false,
    this.borderColor = NeumorphicColors.defaultBorder,
    this.borderWidth = _defaultBorderSize,
  })  : _depth = depth,
        _intensity = intensity,
        _surfaceIntensity = surfaceIntensity;

  // with theme constructor is only available privately, please use copyWithThemeIfNull
  const NeumorphicTheme._withTheme({
    this.shape = _defaultShape,
    this.lightSource = LightSource.topLeft,
    this.color,
    this.boxShape,
    this.border = const NeumorphicBorder.none(),
    this.shadowLightColor,
    this.shadowDarkColor,
    this.shadowLightColorEmboss,
    this.shadowDarkColorEmboss,
    this.oppositeShadowLightSource = false,
    this.disableDepth,
    double? depth,
    double? intensity,
    double surfaceIntensity = 0.25,
    this.borderColor = NeumorphicColors.defaultBorder,
    this.borderWidth = _defaultBorderSize,
  })  : _depth = depth,
        _intensity = intensity,
        _surfaceIntensity = surfaceIntensity;

  double? get depth =>
      _depth?.clamp(Neumorphic.MIN_DEPTH, Neumorphic.MAX_DEPTH);

  double? get intensity =>
      _intensity?.clamp(Neumorphic.MIN_INTENSITY, Neumorphic.MAX_INTENSITY);

  double get surfaceIntensity => _surfaceIntensity.clamp(
      Neumorphic.MIN_INTENSITY, Neumorphic.MAX_INTENSITY);

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
          disableDepth == other.disableDepth &&
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
      disableDepth.hashCode ^
      _surfaceIntensity.hashCode ^
      lightSource.hashCode ^
      oppositeShadowLightSource.hashCode ^
      shape.hashCode;

  @override
  NeumorphicTheme copyWith({
    Color? color,
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
    bool? disableDepth,
    double? borderRadius,
    bool? oppositeShadowLightSource,
    NeumorphicShape? shape,
  }) {
    return NeumorphicTheme._withTheme(
      color: color ?? this.color,
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
      disableDepth: disableDepth ?? this.disableDepth,
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

  @override
  String toString() {
    return 'NeumorphicTheme{color: $color, boxShape: $boxShape, _depth: $_depth, intensity: $intensity, disableDepth: $disableDepth, lightSource: $lightSource, shape: $shape, oppositeShadowLightSource: $oppositeShadowLightSource}';
  }

  NeumorphicTheme applyDisableDepth() {
    if (disableDepth == true) {
      return copyWith(depth: 0);
    } else {
      return this;
    }
  }
}
