import 'package:flutter/material.dart';
import 'package:material_neumorphic_example/constants.dart';
import 'package:material_neumorphic/material_neumorphic.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const path = '/splash';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return Scaffold(
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
                child: SizedBox(
                    width: 400,
                    height: 400,
                    child: Center(
                      child: Column(
                        children: [
                          Neumorphic(
                            style: neumorphicTheme
                                .getNeumorphicStyle()
                                .copyWith(
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
                          NeumorphicText(Constants.appName,
                              style: NeumorphicStyle(
                                  color: theme.colorScheme.primary),
                              textStyle: theme.textTheme.titleLarge),
                        ],
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}
