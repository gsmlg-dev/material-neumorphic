import 'package:flutter/material.dart';
import 'package:material_neumorphic_button/material_neumorphic_button.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

/// A Style used to customize a NeumorphicCheckbox
///
/// selectedDepth : the depth when checked
/// unselectedDepth : the depth when unchecked (default : theme.depth)
/// selectedColor : the color when checked (default: theme.accent)
///
class NeumorphicCheckboxStyle {
  final double? selectedDepth;
  final double? unselectedDepth;
  final bool? disableDepth;
  final double? selectedIntensity;
  final double unselectedIntensity;
  final Color? selectedColor;
  final Color? disabledColor;
  final LightSource? lightSource;
  final NeumorphicBorder border;
  final NeumorphicBoxShape? boxShape;

  const NeumorphicCheckboxStyle({
    this.selectedDepth,
    this.border = const NeumorphicBorder.none(),
    this.selectedColor,
    this.unselectedDepth,
    this.disableDepth,
    this.lightSource,
    this.disabledColor,
    this.boxShape,
    this.selectedIntensity = 1,
    this.unselectedIntensity = 0.7,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicCheckboxStyle &&
          runtimeType == other.runtimeType &&
          selectedDepth == other.selectedDepth &&
          border == other.border &&
          unselectedDepth == other.unselectedDepth &&
          disableDepth == other.disableDepth &&
          selectedIntensity == other.selectedIntensity &&
          lightSource == other.lightSource &&
          unselectedIntensity == other.unselectedIntensity &&
          boxShape == other.boxShape &&
          selectedColor == other.selectedColor &&
          disabledColor == other.disabledColor;

  @override
  int get hashCode =>
      selectedDepth.hashCode ^
      unselectedDepth.hashCode ^
      border.hashCode ^
      lightSource.hashCode ^
      disableDepth.hashCode ^
      selectedIntensity.hashCode ^
      unselectedIntensity.hashCode ^
      boxShape.hashCode ^
      selectedColor.hashCode ^
      disabledColor.hashCode;
}

/// A Neumorphic Checkbox
///
/// takes a NeumorphicCheckboxStyle as `style`
/// takes the current checked state as `value`
///
/// notifies the parent when user interact with this widget with `onChanged`
///
/// ```
///  bool check1 = false;
///  bool check2 = false;
///  bool check3 = false;
///
///  Widget _buildChecks() {
///    return Row(
///      children: <Widget>[
///
///        NeumorphicCheckbox(
///          value: check1,
///          onChanged: (value) {
///            setState(() {
///              check1 = value;
///            });
///          },
///        ),
///
///        NeumorphicCheckbox(
///          value: check2,
///          onChanged: (value) {
///            setState(() {
///              check2 = value;
///            });
///          },
///        ),
///
///        NeumorphicCheckbox(
///          value: check3,
///          onChanged: (value) {
///            setState(() {
///              check3 = value;
///            });
///          },
///        ),
///
///      ],
///    );
///  }
/// ```
///
@immutable
class NeumorphicCheckbox extends StatelessWidget {
  final bool value;
  final NeumorphicCheckboxStyle style;
  final ValueChanged<bool> onChanged;
  final bool isEnabled;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;

  NeumorphicCheckbox({
    this.style = const NeumorphicCheckboxStyle(),
    required this.value,
    required this.onChanged,
    this.curve = NeumorphicTheme.defaultCurve,
    this.duration = NeumorphicTheme.defaultDuration,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.margin = const EdgeInsets.all(0),
    this.isEnabled = true,
  });

  bool get isSelected => value;

  void _onClick() {
    onChanged(!value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;
    final selectedColor = style.selectedColor ?? theme.colorScheme.primary;

    final double selectedDepth =
        -1 * (style.selectedDepth ?? neumorphicTheme.depth).abs();
    final double unselectedDepth =
        (style.unselectedDepth ?? neumorphicTheme.depth).abs();
    final double selectedIntensity =
        (style.selectedIntensity ?? neumorphicTheme.intensity)
            .abs()
            .clamp(NeumorphicTheme.minIntensity, NeumorphicTheme.maxIntensity);
    final double unselectedIntensity = style.unselectedIntensity
        .clamp(NeumorphicTheme.minIntensity, NeumorphicTheme.maxIntensity);

    double depth = isSelected ? selectedDepth : unselectedDepth;
    if (!isEnabled) {
      depth = 0;
    }

    Color? color = isSelected ? selectedColor : null;
    if (!isEnabled) {
      color = null;
    }

    Color iconColor = isSelected ? neumorphicTheme.baseColor : selectedColor;
    if (!isEnabled) {
      iconColor = neumorphicTheme.disabledColor;
    }

    return NeumorphicButton(
      padding: padding,
      pressed: isSelected,
      margin: margin,
      duration: duration,
      curve: curve,
      onPressed: isEnabled ? _onClick : null,
      drawSurfaceAboveChild: true,
      minDistance: selectedDepth.abs(),
      child: Icon(
        Icons.check,
        color: iconColor,
      ),
      style: NeumorphicStyle(
        boxShape: style.boxShape,
        border: style.border,
        color: color,
        depth: depth,
        lightSource: style.lightSource ?? neumorphicTheme.lightSource,
        disableDepth: style.disableDepth,
        intensity: isSelected ? selectedIntensity : unselectedIntensity,
        shape: NeumorphicShape.flat,
      ),
    );
  }
}
