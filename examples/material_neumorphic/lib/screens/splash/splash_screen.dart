import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic_example/constants.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/router/router.dart';
import 'package:material_neumorphic_example/screens/home/home_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  static const path = '/splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;
    final router = ref.read(routerProvider);
    Timer(const Duration(seconds: 2), () {
      router.go(HomeScreen.path);
    });

    return Scaffold(
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
                margin: const EdgeInsets.all(24),
                style: neumorphicTheme.getNeumorphicStyle().copyWith(
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12))),
                child: SizedBox(
                    width: 400,
                    height: 400,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
