import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/state/theme.dart';
import 'app_config.dart';

class LocalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const LocalAppBar({Key? key, String? title})
      : title = title ?? 'Neumporphic Example',
        preferredSize = const Size.fromHeight(NeumorphicAppBar.toolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;
    final themeMode = ref.watch(themeModeProvider);
    final style = neumorphicTheme.getNeumorphicStyle();

    return NeumorphicAppBar(
      depth: 4,
      centerTitle: true,
      title: NeumorphicText(title),
      leading: Builder(
        builder: (context) => // Ensure Scaffold is in context
            NeumorphicButton(
                style:
                    style.copyWith(color: theme.colorScheme.primary, depth: -4),
                child: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer()),
      ),
      actionSpacing: 16,
      actions: [
        NeumorphicButton(
            style: style.copyWith(color: theme.colorScheme.primary, depth: -4),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggle();
            },
            child: Center(child: themeMode.icon)),
        NeumorphicButton(
            style: style.copyWith(color: theme.colorScheme.primary, depth: -4),
            onPressed: () {
              showDialog(context: context, builder: appConfigDialog);
            },
            child: const Icon(Icons.settings))
      ],
    );
  }
}
