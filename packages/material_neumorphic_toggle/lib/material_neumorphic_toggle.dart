import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

class NeumorphicToggleStyle {
  final double? depth;
  final bool? disableDepth;
  final BorderRadius borderRadius;
  final bool animateOpacity;
  final Color? backgroundColor;
  final NeumorphicBorder border;
  final LightSource? lightSource;

  const NeumorphicToggleStyle({
    this.depth,
    this.animateOpacity = true,
    this.backgroundColor,
    this.lightSource,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.disableDepth,
    this.border = const NeumorphicBorder.none(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicToggleStyle &&
          runtimeType == other.runtimeType &&
          depth == other.depth &&
          border == other.border &&
          backgroundColor == other.backgroundColor &&
          lightSource == other.lightSource &&
          disableDepth == other.disableDepth &&
          borderRadius == other.borderRadius &&
          animateOpacity == other.animateOpacity;

  @override
  int get hashCode =>
      depth.hashCode ^
      backgroundColor.hashCode ^
      lightSource.hashCode ^
      border.hashCode ^
      disableDepth.hashCode ^
      borderRadius.hashCode ^
      animateOpacity.hashCode;
}

/// Direct child of NeumorphicToggle
/// Contains two widgets : background & foreground
///
/// The thumb is displayed between background & foreground
///
/// Expanded(
///  child: NeumorphicToggle(
///    height: 50,
///    selectedIndex: _selectedIndex,
///    displayForegroundOnlyIfSelected: true,
///    children: [
///      ToggleElement(
///        background: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w500),)),
///        foreground: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w700),)),
///      ),
///      ToggleElement(
///        background: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w500),)),
///        foreground: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w700),)),
///      ),
///      ToggleElement(
///        background: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w500),)),
///        foreground: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w700),)),
///      )
///    ],
///    thumb: Neumorphic(
///      boxShape: NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.all(Radius.circular(12))),
///    ),
///    onChanged: (value) {
///      setState(() {
///        _selectedIndex = value;
///        print("_firstSelected: $_selectedIndex");
///      });
///    },
///  ),
///),
class ToggleElement {
  final Widget? background;
  final Widget? foreground;

  ToggleElement({
    this.background,
    this.foreground,
  });
}

///
/// Switch with custom thumb (defined with list of ToggleElements)
///
/// does not save the state
///   - notifies a `ValueChanged<int>` : onChanged
///   - need a `selectedIndex` parameter
///
/// Expanded(
///  child: NeumorphicToggle(
///    height: 50,
///    selectedIndex: _selectedIndex,
///    displayForegroundOnlyIfSelected: true,
///    children: [
///      ToggleElement(
///        background: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w500),)),
///        foreground: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w700),)),
///      ),
///      ToggleElement(
///        background: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w500),)),
///        foreground: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w700),)),
///      ),
///      ToggleElement(
///        background: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w500),)),
///        foreground: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w700),)),
///      )
///    ],
///    thumb: Neumorphic(
///      boxShape: NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.all(Radius.circular(12))),
///    ),
///    onChanged: (value) {
///      setState(() {
///        _selectedIndex = value;
///        print("_firstSelected: $_selectedIndex");
///      });
///    },
///  ),
///),
@immutable
class NeumorphicToggle extends StatelessWidget {
  static const minEmbossDepth = -1.0;

  final EdgeInsets padding;

  final List<ToggleElement> children;
  final Widget thumb;

  final int selectedIndex;
  final ValueChanged<int>? onChanged;
  final Function(int)? onAnimationChangedFinished;

  final NeumorphicToggleStyle? style;
  final double height;
  final double? width;
  final Duration duration;
  final bool isEnabled;

  final Curve movingCurve;

  final Curve alphaAnimationCurve;
  final bool displayForegroundOnlyIfSelected;

  const NeumorphicToggle({
    this.style = const NeumorphicToggleStyle(),
    Key? key,
    required this.children,
    required this.thumb,
    this.padding = const EdgeInsets.all(4),
    this.duration = const Duration(milliseconds: 200),
    this.selectedIndex = 0,
    this.alphaAnimationCurve = Curves.linear,
    this.movingCurve = Curves.linear,
    this.onAnimationChangedFinished,
    this.onChanged,
    this.height = 40,
    this.width,
    this.isEnabled = true,
    this.displayForegroundOnlyIfSelected = true,
  }) : super(key: key);

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        _background(context),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: _generateBackgrounds(),
        ),
        AnimatedAlign(
          curve: movingCurve,
          onEnd: () {
            if (onAnimationChangedFinished != null) {
              onAnimationChangedFinished!(selectedIndex);
            }
          },
          alignment: _alignment(),
          duration: duration,
          child: FractionallySizedBox(
            widthFactor: 1 / children.length,
            heightFactor: 1,
            child: Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(style?.borderRadius ??
                    BorderRadius.all(Radius.circular(8))),
              ),
              margin: padding,
              child: thumb,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: _generateForegrounds(),
        ),
      ],
    );
  }

  List<Widget> _generateBackgrounds() {
    final List<Widget> widgets = [];
    for (int i = 0; i < children.length; ++i) {
      widgets.add(_backgroundAtIndex(i));
    }
    return widgets;
  }

  List<Widget> _generateForegrounds() {
    final List<Widget> widgets = [];
    for (int i = 0; i < children.length; ++i) {
      widgets.add(_foregroundAtIndex(i));
    }
    return widgets;
  }

  Alignment _alignment() {
    double percentX = selectedIndex / (children.length - 1);
    double aligmentX = -1.0 + (2.0 * percentX);
    return Alignment(aligmentX, 0.0);
  }

  Widget _backgroundAtIndex(int index) {
    return Expanded(
        flex: 1, child: children[index].background ?? SizedBox.expand());
  }

  Widget _foregroundAtIndex(int index) {
    Widget? child = (!displayForegroundOnlyIfSelected) ||
            (displayForegroundOnlyIfSelected && selectedIndex == index)
        ? children[index].foreground
        : SizedBox.expand();
    //wrap with opacity animation
    if (style != null && style!.animateOpacity) {
      child = AnimatedOpacity(
        curve: alphaAnimationCurve,
        opacity: selectedIndex == index ? 1 : 0,
        duration: duration,
        child: child,
      );
    }
    return Expanded(
        flex: 1,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _notifyOnChange(index);
          },
          child: child,
        ));
  }

  Widget _background(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return Neumorphic(
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(
              style?.borderRadius ?? BorderRadius.all(Radius.circular(12))),
          color: style?.backgroundColor,
          disableDepth: style?.disableDepth,
          depth: _getTrackDepth(context),
          shape: NeumorphicShape.flat,
          border: style?.border ?? NeumorphicBorder.none(),
          lightSource: style?.lightSource ?? neumorphicTheme.lightSource),
      child: SizedBox.expand(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return SizedBox(
        height: height,
        width: width,
        child: _buildStack(context),
      );
    } else {
      return FractionallySizedBox(
        widthFactor: 1.0,
        child: SizedBox(
          height: height,
          child: _buildStack(context),
        ),
      );
    }
  }

  double _getTrackDepth(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    //force negative to have emboss
    final double depth = -1 * (style?.depth ?? neumorphicTheme.depth).abs();
    return depth.clamp(
        NeumorphicTheme.minDepth, NeumorphicToggle.minEmbossDepth);
  }

  void _notifyOnChange(int newValue) {
    if (onChanged != null) {
      onChanged!(newValue);
    }
  }
}
