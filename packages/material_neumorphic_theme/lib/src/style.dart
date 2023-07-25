import 'package:flutter/material.dart';

import 'border.dart';
import 'box_shape.dart';
import 'container.dart';
import 'theme.dart';
import 'light_source.dart';
import 'shape.dart';

//region style
const NeumorphicShape _defaultShape = NeumorphicShape.flat;
//const double _defaultBorderRadius = 5;

class NeumorphicStyle {
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

  //override the "white" color
  final Color? shadowLightColor;

  //override the "dark" color
  final Color? shadowDarkColor;

  //override the "white" color
  final Color? shadowLightColorEmboss;

  //override the "dark" color
  final Color? shadowDarkColorEmboss;

  const NeumorphicStyle({
    this.shape = _defaultShape,
    this.lightSource = LightSource.topLeft,
    this.color,
    this.boxShape, //nullable by default, will use the one defined in theme if not set
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
  })  : _depth = depth,
        _intensity = intensity,
        _surfaceIntensity = surfaceIntensity;

  double? get depth =>
      _depth?.clamp(NeumorphicTheme.minDepth, Neumorphic.maxDepth);

  double? get intensity =>
      _intensity?.clamp(Neumorphic.minIntensity, Neumorphic.maxIntensity);

  double get surfaceIntensity =>
      _surfaceIntensity.clamp(Neumorphic.minIntensity, Neumorphic.maxIntensity);

  NeumorphicStyle copyWithTheme(NeumorphicTheme theme) {
    return NeumorphicStyle(
        color: color ?? theme.color,
        boxShape: boxShape ?? theme.boxShape,
        shape: shape,
        border: border.copyWithThemeIfNull(
            color: theme.borderColor, width: theme.borderWidth),
        shadowDarkColor: shadowDarkColor ?? theme.shadowDarkColor,
        shadowLightColor: shadowLightColor ?? theme.shadowLightColor,
        shadowDarkColorEmboss:
            shadowDarkColorEmboss ?? theme.shadowDarkColorEmboss,
        shadowLightColorEmboss:
            shadowLightColorEmboss ?? theme.shadowLightColorEmboss,
        depth: depth ?? theme.depth,
        intensity: intensity ?? theme.intensity,
        disableDepth: disableDepth,
        surfaceIntensity: surfaceIntensity,
        oppositeShadowLightSource: oppositeShadowLightSource,
        lightSource: lightSource);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicStyle &&
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

  NeumorphicStyle copyWith({
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
    return NeumorphicStyle(
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
  String toString() {
    return 'NeumorphicStyle{color: $color, boxShape: $boxShape, _depth: $_depth, intensity: $intensity, disableDepth: $disableDepth, lightSource: $lightSource, shape: $shape, oppositeShadowLightSource: $oppositeShadowLightSource}';
  }

  NeumorphicStyle applyDisableDepth() {
    if (disableDepth == true) {
      return copyWith(depth: 0);
    } else {
      return this;
    }
  }
}
//endregion
