import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/components/app_bar.dart';
import 'package:material_neumorphic_example/components/app_drawer.dart';

class FormScreen extends ConsumerWidget {
  const FormScreen({super.key});
  static const path = '/form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    return Scaffold(
      drawer: const LocalDrawer(),
      appBar: const LocalAppBar(),
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                style: neumorphicTheme.getNeumorphicStyle().copyWith(
                    boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(24)))),
                child: Column(
                  children: [
                    Neumorphic(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      style: neumorphicTheme.getNeumorphicStyle().copyWith(
                          depth: -4,
                          boxShape: NeumorphicBoxShape.roundRect(
                              const BorderRadius.all(Radius.circular(12)))),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      style: neumorphicTheme.getNeumorphicStyle().copyWith(
                          depth: -4,
                          boxShape: NeumorphicBoxShape.roundRect(
                              const BorderRadius.all(Radius.circular(12)))),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onChanged: (value) {},
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
