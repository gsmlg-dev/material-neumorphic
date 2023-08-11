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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Neumorphic(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                style: neumorphicTheme.style,
                child: Column(
                  children: [
                    Text('Set Material 3 seedColor.',
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 15),
                    ColorPicker(
                      pickerColor: localAppThemeData.seedColor,
                      onColorChanged: (Color color) {
                        ref
                            .read(localAppThemeDataProvider.notifier)
                            .updateWith(seedColor: color);
                      },
                      pickerAreaHeightPercent: 0.8,
                    ),
                  ],
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                style: neumorphicTheme.style,
                child: Column(
                  children: [
                    Text('Set Default LightSource.',
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 15),
                    Text(
                        'dy: left -1 <= dx (${localAppThemeData.lightThemeData.extension<NeumorphicTheme>()!.lightSource.dx.toStringAsFixed(2)}) <= 1 right',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 5),
                    NeumorphicSlider(
                        min: -1,
                        max: 1,
                        value: localAppThemeData.lightThemeData
                            .extension<NeumorphicTheme>()!
                            .lightSource
                            .dx,
                        onChanged: (dx) {
                          ref
                              .read(localAppThemeDataProvider.notifier)
                              .updateWith(
                                  lightSource: localAppThemeData.lightThemeData
                                      .extension<NeumorphicTheme>()!
                                      .lightSource
                                      .copyWith(dx: dx));
                        }),
                    const SizedBox(height: 15),
                    Text(
                        'dy: top -1 <= dy (${localAppThemeData.lightThemeData.extension<NeumorphicTheme>()!.lightSource.dy.toStringAsFixed(2)}) <= 1 bottom',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 5),
                    NeumorphicSlider(
                        min: -1,
                        max: 1,
                        value: localAppThemeData.lightThemeData
                            .extension<NeumorphicTheme>()!
                            .lightSource
                            .dy,
                        onChanged: (dy) {
                          ref
                              .read(localAppThemeDataProvider.notifier)
                              .updateWith(
                                  lightSource: localAppThemeData.lightThemeData
                                      .extension<NeumorphicTheme>()!
                                      .lightSource
                                      .copyWith(dy: dy));
                        }),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                style: neumorphicTheme.style,
                child: Column(
                  children: [
                    Text('Set Default Intensity.',
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 15),
                    Text(
                        'intensity: 0 <= intensity (${localAppThemeData.lightThemeData.extension<NeumorphicTheme>()!.intensity.toStringAsFixed(2)}) <= 1',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 5),
                    NeumorphicSlider(
                        min: 0,
                        max: 1,
                        value: localAppThemeData.lightThemeData
                            .extension<NeumorphicTheme>()!
                            .intensity,
                        onChanged: (intensity) {
                          ref
                              .read(localAppThemeDataProvider.notifier)
                              .updateWith(intensity: intensity);
                        }),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                style: neumorphicTheme.style,
                child: Column(
                  children: [
                    Text('Set Default SurfaceIntensity.',
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 15),
                    Text(
                        'surfaceIntensity: 0 <= surfaceIntensity (${localAppThemeData.lightThemeData.extension<NeumorphicTheme>()!.surfaceIntensity.toStringAsFixed(2)}) <= 1',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 5),
                    NeumorphicSlider(
                        min: 0,
                        max: 1,
                        value: localAppThemeData.lightThemeData
                            .extension<NeumorphicTheme>()!
                            .surfaceIntensity,
                        onChanged: (surfaceIntensity) {
                          ref
                              .read(localAppThemeDataProvider.notifier)
                              .updateWith(surfaceIntensity: surfaceIntensity);
                        }),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                style: neumorphicTheme.style,
                child: Column(
                  children: [
                    Text('Set Default Depth.',
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 15),
                    Text(
                        'depth: -20 <= depth (${localAppThemeData.lightThemeData.extension<NeumorphicTheme>()!.depth.toStringAsFixed(2)}) <= 20',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 5),
                    NeumorphicSlider(
                        min: -20,
                        max: 20,
                        value: localAppThemeData.lightThemeData
                            .extension<NeumorphicTheme>()!
                            .depth,
                        onChanged: (depth) {
                          ref
                              .read(localAppThemeDataProvider.notifier)
                              .updateWith(depth: depth);
                        }),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                style: neumorphicTheme.style,
                child: Column(
                  children: [
                    Text('Set Default Shape.',
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 15),
                    Text(
                        'shape: ${localAppThemeData.lightThemeData.extension<NeumorphicTheme>()!.shape.title}',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 5),
                    NeumorphicToggle(
                      height: 48,
                      selectedIndex: localAppThemeData.lightThemeData
                          .extension<NeumorphicTheme>()!
                          .shape
                          .index,
                      displayForegroundOnlyIfSelected: true,
                      children:
                          NeumorphicShape.values.map<ToggleElement>((shape) {
                        return ToggleElement(
                          background: Center(
                              child: Text(
                            shape.title,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )),
                          foreground: Center(
                              child: Text(
                            shape.title,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          )),
                        );
                      }).toList(),
                      thumb: Neumorphic(
                          style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            const BorderRadius.all(Radius.circular(12))),
                      )),
                      onChanged: (index) {
                        final newShape = NeumorphicShape.values[index];
                        ref
                            .read(localAppThemeDataProvider.notifier)
                            .updateWith(shape: newShape);
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Container(
                margin: const EdgeInsets.all(24),
                width: double.infinity,
                child: NeumorphicButton(
                  style: neumorphicTheme.styleWith(
                      color: theme.colorScheme.primary),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.onPrimary)),
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  });
}
