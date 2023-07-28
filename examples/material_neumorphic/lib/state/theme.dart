import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_neumorphic/material_neumorphic.dart';

import 'shared_prefs.dart';

extension ThemeModeExtension on ThemeMode {
  String get title {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      default:
        return '';
    }
  }

  Widget get icon {
    switch (this) {
      case ThemeMode.system:
        return const Icon(Icons.brightness_auto_sharp);
      case ThemeMode.light:
        return const Icon(Icons.light_mode_sharp);
      case ThemeMode.dark:
        return const Icon(Icons.dark_mode_sharp);
      default:
        return const SizedBox();
    }
  }
}

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final pref = ref.read(sharedPrefsProvider).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return ThemeModeNotifier(pref);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  SharedPreferences? pref;

  ThemeModeNotifier(this.pref)
      : super(ThemeMode.values.firstWhere(
            (e) => e.toString() == pref?.getString('themeMode'),
            orElse: () => ThemeMode.system));

  void changeThemeMode(ThemeMode themeMode) {
    state = themeMode;
    pref?.setString('themeMode', themeMode.toString());
  }

  void toggle() {
    if (state == ThemeMode.system) {
      state = ThemeMode.light;
    } else if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.system;
    }
    pref?.setString('themeMode', state.toString());
  }
}
