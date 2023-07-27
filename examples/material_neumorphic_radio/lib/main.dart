import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';
import 'package:material_neumorphic_radio/material_neumorphic_radio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int? _groupValue = 0;

  void _setGroupValue(int? value) {
    setState(() {
      _groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final neumorphicTheme = theme.extension<NeumorphicTheme>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 480.0,
                height: 320.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Which design system do you like?',
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicRadio(
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: _setGroupValue,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text("Material Design"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        NeumorphicRadio(
                          value: 2,
                          groupValue: _groupValue,
                          onChanged: _setGroupValue,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text("Cupertino Design"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        NeumorphicRadio(
                          value: 3,
                          groupValue: _groupValue,
                          onChanged: _setGroupValue,
                          padding: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text("Fluent Design"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
