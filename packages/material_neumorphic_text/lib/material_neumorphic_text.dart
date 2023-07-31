import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

@immutable
class NeumorphicText extends StatelessWidget {
  final String text;
  final NeumorphicStyle? style;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Curve curve;
  final Duration duration;

  NeumorphicText(
    this.text, {
    Key? key,
    this.duration = NeumorphicTheme.defaultDuration,
    this.curve = NeumorphicTheme.defaultCurve,
    this.style,
    this.textAlign,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>();
    final NeumorphicStyle style = neumorphicTheme!
        .getNeumorphicStyle()
        .merge(this.style)
        .applyDisableDepth();
    print('default text style: ${DefaultTextStyle.of(context).style}');
    return _NeumorphicText(
      textStyle: textStyle ?? DefaultTextStyle.of(context).style,
      textAlign: textAlign ??
          DefaultTextStyle.of(context).textAlign ??
          TextAlign.center,
      text: text,
      duration: duration,
      style: style,
      curve: curve,
    );
  }
}

class _NeumorphicText extends StatefulWidget {
  final String text;

  final NeumorphicStyle style;
  final TextStyle textStyle;
  final Duration duration;
  final Curve curve;

  final TextAlign textAlign;

  _NeumorphicText({
    Key? key,
    required this.duration,
    required this.curve,
    required this.textAlign,
    required this.style,
    required this.textStyle,
    required this.text,
  }) : super(key: key);

  @override
  State<_NeumorphicText> createState() => __NeumorphicTextState();
}

class __NeumorphicTextState extends State<_NeumorphicText> {
  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    final TextPainter textPainter =
        TextPainter(textDirection: textDirection, textAlign: widget.textAlign);
    final textStyle = widget.textStyle;
    textPainter.text = TextSpan(
      text: widget.text,
      style: widget.textStyle,
    );

    return LayoutBuilder(builder: (context, constraints) {
      textPainter.layout(minWidth: 0, maxWidth: constraints.maxWidth);
      final double width = textPainter.width;
      final double height = textPainter.height;

      return DefaultTextStyle(
        style: textStyle,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: widget.curve,
          foregroundDecoration: NeumorphicTextDecoration(
            isForeground: true,
            textStyle: textStyle,
            textAlign: widget.textAlign,
            renderingByPath: true,
            style: widget.style,
            text: widget.text,
          ),
          child: SizedBox(
            width: width,
            height: height,
          ),
        ),
      );
    });
  }
}
