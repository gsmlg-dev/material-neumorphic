import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

class NeumorphicDropdownButtonFormField<T> extends StatelessWidget {
  final NeumorphicStyle? neumorphicStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? depth;
  final BorderRadius borderRadius;

  final Key? key;
  final List<DropdownMenuItem<T>>? items;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final T? value;
  final Widget? hint;
  final Widget? disabledHint;
  final void Function(T?)? onChanged;
  final void Function()? onTap;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? dropdownColor;
  final InputDecoration? decoration;
  final void Function(T?)? onSaved;
  final String? Function(T?)? validator;
  final AutovalidateMode? autovalidateMode;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;

  NeumorphicDropdownButtonFormField({
    this.neumorphicStyle,
    this.margin,
    this.padding,
    this.color,
    this.depth,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.key,
    required this.items,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    required this.onChanged,
    this.onTap,
    this.elevation = 8,
    this.style,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.isDense = true,
    this.isExpanded = false,
    this.itemHeight,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownColor,
    this.decoration,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
  });

  @override
  build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return Neumorphic(
        key: key,
        margin: margin,
        // padding: padding,
        color: color,
        style: neumorphicTheme
            .styleWith(
                depth: depth,
                boxShape: NeumorphicBoxShape.roundRect(borderRadius))
            .merge(neumorphicStyle),
        child: DropdownButtonFormField<T>(
          items: items,
          selectedItemBuilder: selectedItemBuilder,
          value: value,
          hint: hint,
          disabledHint: disabledHint,
          onChanged: onChanged,
          onTap: onTap,
          elevation: elevation,
          style: style,
          icon: icon,
          iconDisabledColor: iconDisabledColor,
          iconEnabledColor: iconEnabledColor,
          iconSize: iconSize,
          isDense: isDense,
          isExpanded: isExpanded,
          itemHeight: itemHeight,
          focusColor: focusColor,
          focusNode: focusNode,
          autofocus: autofocus,
          dropdownColor: dropdownColor,
          decoration: decoration,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          menuMaxHeight: menuMaxHeight,
          enableFeedback: enableFeedback,
          alignment: alignment,
          borderRadius: borderRadius,
          padding: padding,
        ));
  }
}
