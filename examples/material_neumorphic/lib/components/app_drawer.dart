import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/router/router.dart';
import 'package:material_neumorphic_example/screens/form/form_screen.dart';
import 'package:material_neumorphic_example/screens/home/home_screen.dart';
import 'package:material_neumorphic_example/screens/splash/splash_screen.dart';

class LocalDrawer extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const LocalDrawer({Key? key, String? title})
      : title = title ?? 'Neumporphic Example',
        preferredSize = const Size.fromHeight(NeumorphicAppBar.toolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    final router = ref.read(routerProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
            ),
            child: Center(
                child: NeumorphicButton(
              child: const Text('Neumporphic'),
              onPressed: () {
                router.go(SplashScreen.path);
              },
            )),
          ),
          ListTile(
            title: const Text('Home'),
            selected: false,
            onTap: () {
              router.go(HomeScreen.path);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Form'),
            selected: false,
            onTap: () {
              router.go(FormScreen.path);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
