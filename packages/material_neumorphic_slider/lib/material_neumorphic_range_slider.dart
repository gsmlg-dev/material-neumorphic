import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_progress/material_neumorphic_progress.dart';

/// A style to customize the [NeumorphicSlider]
///
/// the gradient will use [accent] and [variant]
///
/// the gradient shape will be a roundrect, using [borderRadius]
///
/// you can define a custom [depth] for the roundrect
///
@immutable
class RangeSliderStyle {
  final double depth;
  final bool disableDepth;
  final BorderRadius borderRadius;
  final Color? accent;
  final Color? variant;
  final LightSource? lightSource;

  final NeumorphicBorder border;
  final NeumorphicBorder thumbBorder;

  const RangeSliderStyle({
    this.depth = 4,
    this.disableDepth = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.accent,
    this.lightSource,
    this.variant,
    this.border = const NeumorphicBorder.none(),
    this.thumbBorder = const NeumorphicBorder.none(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RangeSliderStyle &&
          runtimeType == other.runtimeType &&
          depth == other.depth &&
          lightSource == other.lightSource &&
          disableDepth == other.disableDepth &&
          borderRadius == other.borderRadius &&
          thumbBorder == other.thumbBorder &&
          border == other.border &&
          accent == other.accent &&
          variant == other.variant;

  @override
  int get hashCode =>
      depth.hashCode ^
      disableDepth.hashCode ^
      borderRadius.hashCode ^
      lightSource.hashCode ^
      accent.hashCode ^
      border.hashCode ^
      thumbBorder.hashCode ^
      variant.hashCode;
}

/// A Neumorphic Design range slider.
///
/// Used to select a range of values.
///
///
/// listeners : [onChangedLow], [onChangeHigh]
///
/// ```
///  //in a statefull widget
///
///  double minPrice = 20;
///  double maxPrice = 90;
///
///  Widget _buildSlider() {
///    return Row(
///      children: <Widget>[
///
///        Flexible(
///          child: NeumorphicRangeSlider(
///              valueLow: minPrice,
///              valueHigh: maxPrice,
///              min: 18,
///              max: 99,
///              onChangedLow: (value) {
///                setState(() {
///                  minPrice = value;
///                });
///              },
///              onChangeHigh: (value) {
///                setState(() {
///                  maxPrice = value;
///                });
///              },
///            ),
///          ),
///          Text(
///            "${minPrice.round()} - ${maxPrice.round()}",
///            style: TextStyle(color:  NeumorphicTheme.defaultTextColor(context)),
///          ),
///
///      ],
///    );
///  }
///  ```
///
@immutable
class NeumorphicRangeSlider extends StatefulWidget {
  final RangeSliderStyle style;
  final double min;
  final double valueLow;
  final double valueHigh;
  final double max;
  final double height;
  final double? sliderHeight;
  final ValueChanged<double>? onChangedLow;
  final ValueChanged<double>? onChangeHigh;
  final Function(ActiveThumb)? onPanStarted;
  final Function(ActiveThumb)? onPanEnded;
  final Widget? thumb;

  NeumorphicRangeSlider({
    Key? key,
    this.style = const RangeSliderStyle(),
    this.min = 0,
    this.max = 10,
    this.valueLow = 0,
    this.valueHigh = 10,
    this.height = 15,
    this.onChangedLow,
    this.onChangeHigh,
    this.onPanStarted,
    this.onPanEnded,
    this.sliderHeight,
    this.thumb,
  });

  double get percentLow => (((valueLow.clamp(min, max)) - min) / ((max - min)));

  double get percentHigh =>
      (((valueHigh.clamp(min, max)) - min) / ((max - min)));

  @override
  State<NeumorphicRangeSlider> createState() => _NeumorphicRangeSliderState();
}

class _NeumorphicRangeSliderState extends State<NeumorphicRangeSlider> {
  late ActiveThumb _activeThumb;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return _widget(context, constraints);
    });
  }

  _panUpdateLow(DragUpdateDetails details, BoxConstraints constraints) {
    final tapPos = details.delta;
    final newPercent = widget.percentLow + tapPos.dx / constraints.maxWidth;
    final newValue = ((widget.min + (widget.max - widget.min) * newPercent))
        .clamp(widget.min, widget.max);

    if (newValue < widget.valueHigh) {
      if (widget.onChangedLow != null) {
        widget.onChangedLow!(newValue);
      }
    } else if (newValue >= widget.valueHigh) {
      if (widget.onChangeHigh != null) {
        widget.onChangeHigh!(newValue);
      }
    }
  }

  _panUpdateHigh(DragUpdateDetails details, BoxConstraints constraints) {
    final tapPos = details.delta;
    final newPercent = widget.percentHigh + tapPos.dx / constraints.maxWidth;
    final newValue = ((widget.min + (widget.max - widget.min) * newPercent))
        .clamp(widget.min, widget.max);

    if (newValue > widget.valueLow) {
      if (widget.onChangeHigh != null) {
        widget.onChangeHigh!(newValue);
      }
    } else if (newValue <= widget.valueLow) {
      if (widget.onChangedLow != null) {
        widget.onChangedLow!(newValue);
      }
    }
  }

  Widget _widget(BuildContext context, BoxConstraints constraints) {
    double thumbSize = widget.height * 1.5;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: thumbSize / 2, right: thumbSize / 2),
          child: _generateSlider(context),
        ),
        _lowThumb(context, constraints),
        _highThumb(context, constraints),
      ],
    );
  }

  Widget _lowThumb(BuildContext context, BoxConstraints constraints) {
    double thumbSize = widget.height * 1.5;

    return Align(
      alignment: Alignment((widget.percentLow * 2) - 1, 0),
      child: GestureDetector(
          onHorizontalDragStart: (DragStartDetails details) {
            _activeThumb = ActiveThumb.low;
            if (widget.onPanStarted != null) {
              widget.onPanStarted!(_activeThumb);
            }
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            _panUpdateLow(details, constraints);
          },
          onHorizontalDragEnd: (details) {
            if (widget.onPanEnded != null) {
              widget.onPanEnded!(_activeThumb);
            }
          },
          child: widget.thumb ??
              _generateThumb(context, thumbSize, widget.style.variant)),
    );
  }

  Widget _highThumb(BuildContext context, BoxConstraints constraints) {
    double thumbSize = widget.height * 1.5;

    return Align(
      alignment: Alignment((widget.percentHigh * 2) - 1, 0),
      child: GestureDetector(
          onHorizontalDragStart: (DragStartDetails details) {
            _activeThumb = ActiveThumb.high;
            if (widget.onPanStarted != null) {
              widget.onPanStarted!(_activeThumb);
            }
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            _panUpdateHigh(details, constraints);
          },
          onHorizontalDragEnd: (details) {
            if (widget.onPanEnded != null) {
              widget.onPanEnded!(_activeThumb);
            }
          },
          child: widget.thumb ??
              _generateThumb(context, thumbSize, widget.style.accent)),
    );
  }

  Widget _generateSlider(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return Stack(alignment: Alignment.center, children: <Widget>[
      NeumorphicProgress(
          duration: Duration.zero,
          percent: 0,
          height: widget.sliderHeight ?? widget.height,
          style: ProgressStyle(
            disableDepth: widget.style.disableDepth,
            depth: widget.style.depth,
            border: widget.style.border,
            borderRadius: widget.style.borderRadius,
            accent: widget.style.accent ?? neumorphicTheme.accentColor,
            variant: widget.style.variant ?? neumorphicTheme.variantColor,
          )),
      Positioned.fill(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                  left: constraints.biggest.width * widget.percentLow,
                  right: constraints.biggest.width * (1 - widget.percentHigh)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: widget.style.borderRadius,
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        widget.style.variant ?? neumorphicTheme.variantColor,
                        widget.style.accent ?? neumorphicTheme.accentColor,
                      ]),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }

  Widget _generateThumb(BuildContext context, double size, Color? color) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;
    return Neumorphic(
      style: NeumorphicStyle(
        disableDepth: widget.style.disableDepth,
        shape: NeumorphicShape.concave,
        color: color ?? neumorphicTheme.accentColor,
        border: widget.style.thumbBorder,
        boxShape: NeumorphicBoxShape.circle(),
        lightSource: widget.style.lightSource ?? neumorphicTheme.lightSource,
      ),
      child: SizedBox(
        height: size,
        width: size,
      ),
    );
  }
}

enum ActiveThumb { low, high }
