import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/components/app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const path = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return Scaffold(
      appBar: const LocalAppBar(),
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
                style: neumorphicTheme
                    .getNeumorphicStyle()
                    .copyWith(boxShape: const NeumorphicBoxShape.circle()),
                child: SizedBox(
                    width: 440,
                    height: 440,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Neumorphic(
                          style: neumorphicTheme.getNeumorphicStyle().copyWith(
                              boxShape: NeumorphicBoxShape.path(
                                  NeumorphicFlutterLogoPathProvider())),
                          child: const SizedBox(
                            width: 200,
                            height: 200,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        NeumorphicText('Neumorphic UI kit example',
                            style: NeumorphicStyle(
                                color: theme.colorScheme.onSecondaryContainer),
                            textStyle: theme.textTheme.titleLarge),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
