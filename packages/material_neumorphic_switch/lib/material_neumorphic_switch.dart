import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

/// A style to customize the [NeumorphicSwitch]
///
/// you can define the track : [activeTrackColor], [inactiveTrackColor], [trackDepth]
///
/// you can define the thumb : [activeTrackColor], [inactiveTrackColor], [thumbDepth]
/// and [thumbShape] @see [NeumorphicShape]
///
class NeumorphicSwitchStyle {
  final double? trackDepth;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final NeumorphicShape? thumbShape;
  final double? thumbDepth;
  final LightSource? lightSource;
  final bool disableDepth;

  final NeumorphicBorder thumbBorder;
  final NeumorphicBorder trackBorder;

  const NeumorphicSwitchStyle({
    this.trackDepth,
    this.thumbShape = NeumorphicShape.concave,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.thumbDepth,
    this.lightSource,
    this.disableDepth = false,
    this.thumbBorder = const NeumorphicBorder.none(),
    this.trackBorder = const NeumorphicBorder.none(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicSwitchStyle &&
          runtimeType == other.runtimeType &&
          trackDepth == other.trackDepth &&
          trackBorder == other.trackBorder &&
          thumbBorder == other.thumbBorder &&
          lightSource == other.lightSource &&
          activeTrackColor == other.activeTrackColor &&
          inactiveTrackColor == other.inactiveTrackColor &&
          activeThumbColor == other.activeThumbColor &&
          inactiveThumbColor == other.inactiveThumbColor &&
          thumbShape == other.thumbShape &&
          thumbDepth == other.thumbDepth &&
          disableDepth == other.disableDepth;

  @override
  int get hashCode =>
      trackDepth.hashCode ^
      activeTrackColor.hashCode ^
      trackBorder.hashCode ^
      thumbBorder.hashCode ^
      lightSource.hashCode ^
      inactiveTrackColor.hashCode ^
      activeThumbColor.hashCode ^
      inactiveThumbColor.hashCode ^
      thumbShape.hashCode ^
      thumbDepth.hashCode ^
      disableDepth.hashCode;
}

/// Used to toggle the on/off state of a single setting.
///
/// The switch itself does not maintain any state. Instead, when the state of the switch changes, the widget calls the onChanged callback.
/// Most widgets that use a switch will listen for the onChanged callback and rebuild the switch with a new value to update the visual appearance of the switch.
///
/// ```
///  bool _switch1Value = false;
///  bool _switch2Value = false;
///
///  Widget _buildSwitches() {
///    return Row(children: <Widget>[
///
///      NeumorphicSwitch(
///        value: _switch1Value,
///        style: NeumorphicSwitchStyle(
///          thumbShape: NeumorphicShape.concave,
///        ),
///        onChanged: (value) {
///          setState(() {
///            _switch1Value = value;
///          });
///        },
///      ),
///
///      NeumorphicSwitch(
///        value: _switch2Value,
///        style: NeumorphicSwitchStyle(
///          thumbShape: NeumorphicShape.flat,
///        ),
///        onChanged: (value) {
///          setState(() {
///            _switch2Value = value;
///          });
///        },
///      ),
///
///    ]);
///  }
///  ```
///
@immutable
class NeumorphicSwitch extends StatelessWidget {
  static const minEmbossDepth = -1.0;

  final bool value;
  final ValueChanged<bool>? onChanged;
  final NeumorphicSwitchStyle style;
  final double height;
  final Duration duration;
  final Curve curve;
  final bool isEnabled;

  const NeumorphicSwitch({
    this.style = const NeumorphicSwitchStyle(),
    Key? key,
    this.curve = NeumorphicTheme.defaultCurve,
    this.duration = const Duration(milliseconds: 200),
    this.value = false,
    this.onChanged,
    this.height = 40,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: GestureDetector(
          onTap: () {
            if (!isEnabled) {
              return;
            }
            if (onChanged != null) {
              onChanged!(!value);
            }
          },
          child: Neumorphic(
            drawSurfaceAboveChild: false,
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.stadium(),
              lightSource: style.lightSource ?? neumorphicTheme.lightSource,
              border: style.trackBorder,
              disableDepth: style.disableDepth,
              depth: _getTrackDepth(neumorphicTheme.depth),
              color: _getTrackColor(neumorphicTheme, isEnabled),
              shape: NeumorphicShape.flat,
            ),
            child: NeumorphicAnimatedScale(
              scale: isEnabled ? 1 : 0,
              alignment: value ? Alignment(0.5, 0) : Alignment(-0.5, 0),
              child: AnimatedThumb(
                curve: curve,
                disableDepth: style.disableDepth,
                depth: _thumbDepth,
                duration: duration,
                alignment: _alignment,
                shape: _getThumbShape,
                lightSource: style.lightSource ?? neumorphicTheme.lightSource,
                border: style.thumbBorder,
                thumbColor: _getThumbColor(neumorphicTheme),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Alignment get _alignment {
    if (value) {
      return Alignment.centerRight;
    } else {
      return Alignment.centerLeft;
    }
  }

  double get _thumbDepth {
    if (!isEnabled) {
      return 0;
    } else {
      return style.thumbDepth ?? NeumorphicTheme.defaultDepth;
    }
  }

  NeumorphicShape get _getThumbShape {
    return style.thumbShape ?? NeumorphicShape.flat;
  }

  double? _getTrackDepth(double? themeDepth) {
    if (themeDepth == null) return themeDepth;
    //force negative to have emboss
    final double depth = -1 * (style.trackDepth ?? themeDepth).abs();
    return depth.clamp(
        NeumorphicTheme.minDepth, NeumorphicSwitch.minEmbossDepth);
  }

  Color _getTrackColor(NeumorphicTheme theme, bool enabled) {
    if (!enabled) {
      return style.inactiveTrackColor ?? theme.baseColor;
    }

    return value == true
        ? style.activeTrackColor ?? theme.accentColor
        : style.inactiveTrackColor ?? theme.baseColor;
  }

  Color _getThumbColor(NeumorphicTheme theme) {
    Color? color =
        value == true ? style.activeThumbColor : style.inactiveThumbColor;
    return color ?? theme.baseColor;
  }
}

class AnimatedThumb extends StatelessWidget {
  final Color? thumbColor;
  final Alignment alignment;
  final Duration duration;
  final NeumorphicShape shape;
  final double? depth;
  final Curve curve;
  final bool disableDepth;
  final NeumorphicBorder border;
  final LightSource lightSource;

  AnimatedThumb({
    Key? key,
    this.thumbColor,
    required this.alignment,
    required this.duration,
    required this.shape,
    this.depth,
    this.curve = Curves.linear,
    this.border = const NeumorphicBorder.none(),
    this.lightSource = LightSource.topLeft,
    this.disableDepth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      curve: curve,
      alignment: alignment,
      duration: duration,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            disableDepth: disableDepth,
            shape: shape,
            depth: depth,
            color: thumbColor,
            border: border,
            lightSource: lightSource,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}
