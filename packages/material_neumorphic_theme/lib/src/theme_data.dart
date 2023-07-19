import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show IconThemeData, TextTheme, ThemeExtension, Color;
import 'package:flutter/painting.dart';

import 'box_shape.dart';
import 'colors.dart';
import 'container.dart';
import 'light_source.dart';
import 'style.dart';

const double _defaultDepth = 4;
const double _defaultIntensity = 0.7;
const Color _defaultAccent = NeumorphicColors.accent;
const Color _defaultVariant = NeumorphicColors.variant;
const Color _defaultDisabledColor = NeumorphicColors.disabled;
const Color _defaultTextColor = NeumorphicColors.defaultTextColor;
const LightSource _defaultLightSource = LightSource.topLeft;
const Color _defaultBaseColor = NeumorphicColors.background;
const double _defaultBorderSize = 0.3;

/// Used with the NeumorphicTheme
///
/// ```
/// NeumorphicTheme(
///   theme: NeumorphicThemeData(...)
///   darkTheme: : NeumorphicThemeData(...)
///   child: ...
/// )`
/// ``
///
/// Contains all default values used in child Neumorphic Elements as
/// default colors : baseColor, accentColor, variantColor
/// default depth & intensities, used to generate white / dark shadows
/// default lightsource, used to calculate the angle of the shadow
/// @see [LightSource]
///
@immutable
class NeumorphicThemeData extends ThemeExtension<NeumorphicThemeData> {
  final Color baseColor;
  final Color accentColor;
  final Color variantColor;
  final Color disabledColor;

  final Color shadowLightColor;
  final Color shadowDarkColor;
  final Color shadowLightColorEmboss;
  final Color shadowDarkColorEmboss;

  final NeumorphicBoxShape? _boxShape;
  NeumorphicBoxShape get boxShape =>
      _boxShape ?? NeumorphicBoxShape.roundRect(BorderRadius.circular(8));
  final Color borderColor;
  final double borderWidth;

  final Color defaultTextColor; //TODO maybe use TextStyle here
  final double _depth;
  final double _intensity;
  final LightSource lightSource;
  final bool disableDepth;

  /// Default text theme to use and apply across the app
  final TextTheme textTheme;

  /// Default button style to use and apply across the app
  final NeumorphicStyle? buttonStyle;

  /// Default icon theme to use and apply across the app
  final IconThemeData iconTheme;

  /// Get this theme's depth, clamp to min/max neumorphic constants
  double get depth => _depth.clamp(Neumorphic.MIN_DEPTH, Neumorphic.MAX_DEPTH);

  /// Get this theme's intensity, clamp to min/max neumorphic constants
  double get intensity =>
      _intensity.clamp(Neumorphic.MIN_INTENSITY, Neumorphic.MAX_INTENSITY);

  const NeumorphicThemeData({
    this.baseColor = _defaultBaseColor,
    double depth = _defaultDepth,
    NeumorphicBoxShape? boxShape,
    double intensity = _defaultIntensity,
    this.accentColor = _defaultAccent,
    this.variantColor = _defaultVariant,
    this.disabledColor = _defaultDisabledColor,
    this.shadowLightColor = NeumorphicColors.decorationMaxWhiteColor,
    this.shadowDarkColor = NeumorphicColors.decorationMaxDarkColor,
    this.shadowLightColorEmboss = NeumorphicColors.embossMaxWhiteColor,
    this.shadowDarkColorEmboss = NeumorphicColors.embossMaxDarkColor,
    this.defaultTextColor = _defaultTextColor,
    this.lightSource = _defaultLightSource,
    this.textTheme = const TextTheme(),
    this.iconTheme = const IconThemeData(),
    this.buttonStyle,
    this.borderColor = NeumorphicColors.defaultBorder,
    this.borderWidth = _defaultBorderSize,
    this.disableDepth = false,
  })  : _depth = depth,
        _boxShape = boxShape,
        _intensity = intensity;

  const NeumorphicThemeData.dark({
    this.baseColor = NeumorphicColors.darkBackground,
    double depth = _defaultDepth,
    NeumorphicBoxShape? boxShape,
    double intensity = _defaultIntensity,
    this.accentColor = _defaultAccent,
    this.textTheme = const TextTheme(),
    this.buttonStyle,
    this.iconTheme = const IconThemeData(),
    this.variantColor = NeumorphicColors.darkVariant,
    this.disabledColor = NeumorphicColors.darkDisabled,
    this.shadowLightColor = NeumorphicColors.decorationMaxWhiteColor,
    this.shadowDarkColor = NeumorphicColors.decorationMaxDarkColor,
    this.shadowLightColorEmboss = NeumorphicColors.embossMaxWhiteColor,
    this.shadowDarkColorEmboss = NeumorphicColors.embossMaxDarkColor,
    this.defaultTextColor = NeumorphicColors.darkDefaultTextColor,
    this.lightSource = _defaultLightSource,
    this.borderColor = NeumorphicColors.darkDefaultBorder,
    this.borderWidth = _defaultBorderSize,
    this.disableDepth = false,
  })  : _depth = depth,
        _boxShape = boxShape,
        _intensity = intensity;

  @override
  String toString() {
    return 'NeumorphicTheme{baseColor: $baseColor, boxShape: $boxShape, disableDepth: $disableDepth, accentColor: $accentColor, variantColor: $variantColor, disabledColor: $disabledColor, _depth: $_depth, intensity: $intensity, lightSource: $lightSource}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicThemeData &&
          runtimeType == other.runtimeType &&
          baseColor == other.baseColor &&
          boxShape == other.boxShape &&
          textTheme == other.textTheme &&
          iconTheme == other.iconTheme &&
          buttonStyle == other.buttonStyle &&
          accentColor == other.accentColor &&
          shadowDarkColor == other.shadowDarkColor &&
          shadowLightColor == other.shadowLightColor &&
          shadowDarkColorEmboss == other.shadowDarkColorEmboss &&
          shadowLightColorEmboss == other.shadowLightColorEmboss &&
          disabledColor == other.disabledColor &&
          variantColor == other.variantColor &&
          disableDepth == other.disableDepth &&
          defaultTextColor == other.defaultTextColor &&
          borderWidth == other.borderWidth &&
          borderColor == other.borderColor &&
          _depth == other._depth &&
          _intensity == other._intensity &&
          lightSource == other.lightSource;

  @override
  int get hashCode =>
      baseColor.hashCode ^
      textTheme.hashCode ^
      iconTheme.hashCode ^
      buttonStyle.hashCode ^
      accentColor.hashCode ^
      variantColor.hashCode ^
      disabledColor.hashCode ^
      shadowDarkColor.hashCode ^
      shadowLightColor.hashCode ^
      shadowDarkColorEmboss.hashCode ^
      shadowLightColorEmboss.hashCode ^
      defaultTextColor.hashCode ^
      disableDepth.hashCode ^
      borderWidth.hashCode ^
      borderColor.hashCode ^
      _depth.hashCode ^
      boxShape.hashCode ^
      _intensity.hashCode ^
      lightSource.hashCode;

  /// Create a copy of this theme
  /// With possibly new values given from this method's arguments
  @override
  NeumorphicThemeData copyWith({
    Color? baseColor,
    Color? accentColor,
    Color? variantColor,
    Color? disabledColor,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Color? shadowLightColorEmboss,
    Color? shadowDarkColorEmboss,
    Color? defaultTextColor,
    NeumorphicBoxShape? boxShape,
    TextTheme? textTheme,
    NeumorphicStyle? buttonStyle,
    IconThemeData? iconTheme,
    NeumorphicStyle? defaultStyle,
    bool? disableDepth,
    double? depth,
    double? intensity,
    Color? borderColor,
    double? borderSize,
    LightSource? lightSource,
  }) {
    return NeumorphicThemeData(
      baseColor: baseColor ?? this.baseColor,
      textTheme: textTheme ?? this.textTheme,
      iconTheme: iconTheme ?? this.iconTheme,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      boxShape: boxShape ?? this.boxShape,
      accentColor: accentColor ?? this.accentColor,
      variantColor: variantColor ?? this.variantColor,
      disabledColor: disabledColor ?? this.disabledColor,
      defaultTextColor: defaultTextColor ?? this.defaultTextColor,
      disableDepth: disableDepth ?? this.disableDepth,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColorEmboss:
          shadowDarkColorEmboss ?? this.shadowDarkColorEmboss,
      shadowLightColorEmboss:
          shadowLightColorEmboss ?? this.shadowLightColorEmboss,
      depth: depth ?? _depth,
      borderWidth: borderSize ?? borderWidth,
      borderColor: borderColor ?? this.borderColor,
      intensity: intensity ?? _intensity,
      lightSource: lightSource ?? this.lightSource,
    );
  }

  @override
  NeumorphicThemeData lerp(NeumorphicThemeData? other, double t) {
    if (other is! NeumorphicThemeData) {
      return this;
    }
    return NeumorphicThemeData(
      baseColor: Color.lerp(baseColor, other.baseColor, t)!,
      shadowDarkColor: Color.lerp(shadowDarkColor, other.shadowDarkColor, t)!,
      shadowLightColor:
          Color.lerp(shadowLightColor, other.shadowLightColor, t)!,
      shadowDarkColorEmboss:
          Color.lerp(shadowDarkColorEmboss, other.shadowDarkColorEmboss, t)!,
      shadowLightColorEmboss:
          Color.lerp(shadowLightColorEmboss, other.shadowLightColorEmboss, t)!,
    );
  }

  /// Create a copy of this theme
  /// With possibly new values given from the given second theme
  NeumorphicThemeData copyFrom({
    required NeumorphicThemeData other,
  }) {
    return NeumorphicThemeData(
      baseColor: other.baseColor,
      accentColor: other.accentColor,
      variantColor: other.variantColor,
      disableDepth: other.disableDepth,
      disabledColor: other.disabledColor,
      defaultTextColor: other.defaultTextColor,
      shadowDarkColor: other.shadowDarkColor,
      shadowLightColor: other.shadowLightColor,
      shadowDarkColorEmboss: other.shadowDarkColorEmboss,
      shadowLightColorEmboss: other.shadowLightColorEmboss,
      textTheme: other.textTheme,
      iconTheme: other.iconTheme,
      buttonStyle: other.buttonStyle,
      depth: other.depth,
      boxShape: other.boxShape,
      borderColor: other.borderColor,
      borderWidth: other.borderWidth,
      intensity: other.intensity,
      lightSource: other.lightSource,
    );
  }
}
