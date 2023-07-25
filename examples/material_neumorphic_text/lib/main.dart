import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_text/material_neumorphic_text.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: NeumorphicTheme.defaultSeedColor);
    final darkColorScheme = ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: NeumorphicTheme.defaultSeedColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          const NeumorphicTheme().fitWithColorSchema(colorScheme),
        ],
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          const NeumorphicTheme().fitWithColorSchema(darkColorScheme),
        ],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>();
    final NeumorphicStyle style =
        NeumorphicStyle().copyWithTheme(neumorphicTheme!).applyDisableDepth();

    return Scaffold(
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
              margin: const EdgeInsets.all(24),
              child: SizedBox(
                width: 480.0,
                height: 400.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicText('Neumorphic Design',
                          style: style.copyWith(
                              depth: 4, color: theme.colorScheme.primary),
                          textStyle: TextStyle(fontSize: 36.0)),
                      NeumorphicText('is',
                          style: style.copyWith(
                              depth: 2, color: theme.colorScheme.tertiary),
                          textStyle: TextStyle(fontSize: 36.0)),
                      NeumorphicText('Simple',
                          style: style.copyWith(
                              depth: 6,
                              color: theme.colorScheme.onPrimaryContainer),
                          textStyle: TextStyle(fontSize: 36.0)),
                      NeumorphicText('and',
                          style: style.copyWith(
                              depth: 2, color: theme.colorScheme.tertiary),
                          textStyle: TextStyle(fontSize: 36.0)),
                      NeumorphicText('Beautiful',
                          style: style.copyWith(
                              depth: 6,
                              color: theme.colorScheme.onSecondaryContainer),
                          textStyle: TextStyle(fontSize: 36.0)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
