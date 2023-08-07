import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';

import 'button.dart';

const BoxConstraints _kSizeConstraints = BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
);

const BoxConstraints _kMiniSizeConstraints = BoxConstraints.tightFor(
  width: 40.0,
  height: 40.0,
);

class NeumorphicFloatingActionButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final bool mini;
  final String? tooltip;
  final NeumorphicStyle? style;

  const NeumorphicFloatingActionButton({
    Key? key,
    this.mini = false,
    this.style,
    this.tooltip,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>();
    return ConstrainedBox(
      constraints: this.mini ? _kMiniSizeConstraints : _kSizeConstraints,
      child: NeumorphicButton(
        padding: EdgeInsets.all(0),
        onPressed: this.onPressed,
        tooltip: this.tooltip,
        style: neumorphicTheme!
            .getNeumorphicStyle()
            .copyWith(
              color: theme.colorScheme.primary,
              boxShape: NeumorphicBoxShape.circle(),
            )
            .merge(this.style),
        child: IconTheme(
          data: IconThemeData(color: theme.colorScheme.onPrimary),
          child: DefaultTextStyle(
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
              child: this.child ?? Container()),
        ),
      ),
    );
  }
}
