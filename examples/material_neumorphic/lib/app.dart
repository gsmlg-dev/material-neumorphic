import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic_example/constants.dart';
import 'package:material_neumorphic_example/router/router.dart';
// import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/state/theme.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final appThemeData = ref.watch(localAppThemeDataProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: Constants.appName,
      themeMode: themeMode,
      theme: appThemeData.lightThemeData,
      darkTheme: appThemeData.darkThemeData,
    );
  }
}
