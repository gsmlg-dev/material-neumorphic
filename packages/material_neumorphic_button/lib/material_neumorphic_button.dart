import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

/// A Neumorphic Button
///
/// When pressed, it will fire a call to its [VoidCallback] `onPressed` click parameter
/// The animation starts from style.depth (or theme.depth is not defined in the style)
/// @see [NeumorphicStyle]
///
/// And finished to `minDistance`, in [duration] (time)
///
/// You can force the pressed state using [pressed]
/// - true : forced as pressed
/// - false : forced as unpressed
/// - null : can be pressed by user
///
/// It takes a [padding], default EdgeInsets.symmetric(horizontal: 8, vertical: 4)`
///
/// It takes a [NeumorphicStyle] @see [Neumorphi]
///
/// ```
///  NeumorphicButton(
///          onClick: () {
///            setState(() {
///               ...
///            });
///          },
///          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
///          style: NeumorphicStyle(
///            shape: NeumorphicShape.flat,
///          ),
///          child: ...
///  )
/// ```
///
@immutable
class NeumorphicButton extends StatefulWidget {
  static const double pressedScale = 0.98;
  static const double unpressedScale = 1.0;

  final Widget? child;
  final NeumorphicStyle? style;
  final double minDistance;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool? pressed; //null, true, false
  final Duration duration;
  final Curve curve;
  final VoidCallback? onPressed;
  final bool drawSurfaceAboveChild;
  final bool provideHapticFeedback;
  final String? tooltip;

  NeumorphicButton({
    Key? key,
    this.padding,
    this.margin,
    this.child,
    this.tooltip,
    this.drawSurfaceAboveChild = true,
    this.pressed, //true/false if you want to change the state of the button
    this.duration = NeumorphicTheme.defaultDuration,
    this.curve = NeumorphicTheme.defaultCurve,
    this.onPressed,
    this.minDistance = 0,
    this.style,
    this.provideHapticFeedback = true,
  }) : super(key: key);

  bool get isEnabled => onPressed != null;

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  late NeumorphicStyle initialStyle;

  late double depth;
  bool pressed = false; //overwrite widget.pressed when click for animation

  void updateInitialStyle() {
    final theme = Theme.of(context).extension<NeumorphicTheme>();
    initialStyle = widget.style ?? const NeumorphicStyle();
    depth = widget.style?.depth ?? theme?.depth ?? 0.0;

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateInitialStyle();
  }

  @override
  void didUpdateWidget(NeumorphicButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateInitialStyle();
  }

  Future<void> _handlePress() async {
    hasFinishedAnimationDown = false;
    setState(() {
      pressed = true;
      depth = widget.minDistance;
    });

    await Future.delayed(widget.duration); //wait until animation finished
    hasFinishedAnimationDown = true;

    //haptic vibration
    if (widget.provideHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    _resetIfTapUp();
  }

  bool hasDisposed = false;

  @override
  void dispose() {
    super.dispose();
    hasDisposed = true;
  }

  //used to stay pressed if no tap up
  void _resetIfTapUp() {
    if (hasFinishedAnimationDown == true && hasTapUp == true && !hasDisposed) {
      final theme = Theme.of(context).extension<NeumorphicTheme>();
      setState(() {
        pressed = false;
        depth = initialStyle.depth ?? theme?.depth ?? 0.0;

        hasFinishedAnimationDown = false;
        hasTapUp = false;
      });
    }
  }

  bool get clickable {
    return widget.isEnabled && widget.onPressed != null;
  }

  bool hasFinishedAnimationDown = false;
  bool hasTapUp = false;

  @override
  Widget build(BuildContext context) {
    final result = _build(context);
    if (widget.tooltip != null) {
      return Tooltip(
        message: widget.tooltip!,
        child: result,
      );
    } else {
      return result;
    }
  }

  Widget _build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail) {
        hasTapUp = false;
        if (clickable && !pressed) {
          _handlePress();
        }
      },
      onTapUp: (details) {
        if (clickable) {
          widget.onPressed!();
        }
        hasTapUp = true;
        _resetIfTapUp();
      },
      onTapCancel: () {
        hasTapUp = true;
        _resetIfTapUp();
      },
      child: NeumorphicAnimatedScale(
        scale: _getScale(),
        child: MouseRegion(
          cursor: widget.isEnabled
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: Neumorphic(
            margin: widget.margin ?? const EdgeInsets.all(0),
            drawSurfaceAboveChild: widget.drawSurfaceAboveChild,
            duration: widget.duration,
            curve: widget.curve,
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            style: initialStyle.copyWith(
              depth: _getDepth(),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  double _getDepth() {
    if (widget.isEnabled) {
      return depth;
    } else {
      return 0;
    }
  }

  double _getScale() {
    if (widget.pressed != null) {
      //defined by the widget that use it
      return widget.pressed!
          ? NeumorphicButton.pressedScale
          : NeumorphicButton.unpressedScale;
    } else {
      return pressed
          ? NeumorphicButton.pressedScale
          : NeumorphicButton.unpressedScale;
    }
  }
}
