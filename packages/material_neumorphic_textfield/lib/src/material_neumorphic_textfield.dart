import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

/// A Neumorphic TextField
///
///
class NeumorphicTextField extends StatelessWidget {
  final NeumorphicStyle? neumorphicStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? depth;
  final BorderRadius borderRadius;

  Key? key;
  TextEditingController? controller;
  FocusNode? focusNode;
  UndoHistoryController? undoController;
  InputDecoration? decoration = const InputDecoration();
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  TextCapitalization textCapitalization;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign textAlign = TextAlign.start;
  TextAlignVertical? textAlignVertical;
  TextDirection? textDirection;
  bool readOnly = false;
  ToolbarOptions? toolbarOptions;
  bool? showCursor;
  bool autofocus = false;
  String obscuringCharacter = '•';
  bool obscureText = false;
  bool autocorrect = true;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  bool enableSuggestions = true;
  int? maxLines = 1;
  int? minLines;
  bool expands = false;
  int? maxLength;
  MaxLengthEnforcement? maxLengthEnforcement;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  void Function(String)? onSubmitted;
  void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  List<TextInputFormatter>? inputFormatters;
  bool? enabled;
  double cursorWidth = 2.0;
  double? cursorHeight;
  Radius? cursorRadius;
  bool? cursorOpacityAnimates;
  Color? cursorColor;
  ui.BoxHeightStyle selectionHeightStyle;
  ui.BoxWidthStyle selectionWidthStyle;
  Brightness? keyboardAppearance;
  EdgeInsets scrollPadding;
  DragStartBehavior dragStartBehavior;
  bool? enableInteractiveSelection;
  TextSelectionControls? selectionControls;
  void Function()? onTap;
  void Function(PointerDownEvent)? onTapOutside;
  MouseCursor? mouseCursor;
  Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  ScrollController? scrollController;
  ScrollPhysics? scrollPhysics;
  Iterable<String>? autofillHints = const <String>[];
  ContentInsertionConfiguration? contentInsertionConfiguration;
  Clip clipBehavior = Clip.hardEdge;
  String? restorationId;
  bool scribbleEnabled = true;
  bool enableIMEPersonalizedLearning = true;
  Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  bool canRequestFocus;
  SpellCheckConfiguration? spellCheckConfiguration;
  TextMagnifierConfiguration? magnifierConfiguration;

  NeumorphicTextField({
    super.key,
    this.neumorphicStyle,
    this.margin,
    this.padding,
    this.color,
    this.depth,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.controller,
    this.focusNode,
    this.undoController,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return Neumorphic(
      key: key,
      margin: margin,
      padding: padding,
      color: color,
      style: neumorphicTheme
          .styleWith(
              depth: depth,
              boxShape: NeumorphicBoxShape.roundRect(borderRadius))
          .merge(neumorphicStyle),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        undoController: undoController,
        decoration: decoration,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        textDirection: textDirection,
        readOnly: readOnly,
        toolbarOptions: toolbarOptions,
        showCursor: showCursor,
        autofocus: autofocus,
        obscuringCharacter: obscuringCharacter,
        obscureText: obscureText,
        autocorrect: autocorrect,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        enableSuggestions: enableSuggestions,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands,
        maxLength: maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        onAppPrivateCommand: onAppPrivateCommand,
        inputFormatters: inputFormatters,
        enabled: enabled,
        cursorWidth: cursorWidth,
        cursorHeight: cursorHeight,
        cursorRadius: cursorRadius,
        cursorOpacityAnimates: cursorOpacityAnimates,
        cursorColor: cursorColor,
        selectionHeightStyle: selectionHeightStyle,
        selectionWidthStyle: selectionWidthStyle,
        keyboardAppearance: keyboardAppearance,
        scrollPadding: scrollPadding,
        dragStartBehavior: dragStartBehavior,
        enableInteractiveSelection: enableInteractiveSelection,
        selectionControls: selectionControls,
        onTap: onTap,
        onTapOutside: onTapOutside,
        mouseCursor: mouseCursor,
        buildCounter: buildCounter,
        scrollController: scrollController,
        scrollPhysics: scrollPhysics,
        autofillHints: autofillHints,
        contentInsertionConfiguration: contentInsertionConfiguration,
        clipBehavior: clipBehavior,
        restorationId: restorationId,
        scribbleEnabled: scribbleEnabled,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        contextMenuBuilder: contextMenuBuilder,
        canRequestFocus: canRequestFocus,
        spellCheckConfiguration: spellCheckConfiguration,
        magnifierConfiguration: magnifierConfiguration,
      ),
    );
  }
}
