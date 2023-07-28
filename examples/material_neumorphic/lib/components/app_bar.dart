import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/state/theme.dart';

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

    return NeumorphicAppBar(
      centerTitle: true,
      title: NeumorphicText(title),
      actionSpacing: 16,
      actions: [
        NeumorphicButton(
            style: NeumorphicStyle(color: theme.colorScheme.primary),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggle();
            },
            child: Center(child: themeMode.icon)),
        NeumorphicButton(
            style: NeumorphicStyle(color: theme.colorScheme.primary),
            onPressed: () {
              // Navigator.of(context).pop();
            },
            child: const Icon(Icons.settings))
      ],
    );
  }
}
