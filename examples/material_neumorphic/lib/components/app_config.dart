import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/state/theme.dart';

Widget appConfigDialog(BuildContext context) {
  final theme = Theme.of(context);
  final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

  return Consumer(builder: (context, ref, _) {
    final localAppThemeData = ref.watch(localAppThemeDataProvider);

    return Dialog.fullscreen(
      child: NeumorphicBackground(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Neumorphic(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              style: neumorphicTheme.getNeumorphicStyle(),
              child: Column(
                children: [
                  Text('Set Material 3 seedColor.',
                      style: theme.textTheme.titleMedium),
                  const SizedBox(height: 15),
                  ColorPicker(
                    pickerColor: localAppThemeData.seedColor,
                    onColorChanged: (Color color) {
                      ref
                          .read(localAppThemeDataProvider.notifier)
                          .updateSeedColor(color);
                    },
                    pickerAreaHeightPercent: 0.8,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  });
}
