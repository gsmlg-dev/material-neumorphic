import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/components/app_bar.dart';
import 'package:material_neumorphic_example/components/app_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const path = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    final size = MediaQuery.of(context).size;
    final width = size.width > size.height ? size.height : size.width;

    return Scaffold(
      drawer: const LocalDrawer(),
      appBar: const LocalAppBar(),
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
                style: neumorphicTheme.styleWith(
                    boxShape: const NeumorphicBoxShape.circle()),
                child: SizedBox(
                    width: width * 0.8,
                    height: width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Neumorphic(
                          style: neumorphicTheme.styleWith(
                              boxShape: NeumorphicBoxShape.path(
                                  NeumorphicFlutterLogoPathProvider())),
                          child: SizedBox(
                            width: width * 0.4,
                            height: width * 0.4,
                          ),
                        ),
                        SizedBox(
                          height: width * 0.04,
                        ),
                        NeumorphicText('Neumorphic UI kit example',
                            style: NeumorphicStyle(
                                color: theme.colorScheme.onSecondaryContainer),
                            textStyle: theme.textTheme.titleLarge!
                                .copyWith(fontSize: width * 0.04)),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
