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
    final Color seedColor = Color.fromARGB(255, 232, 186, 47);
    final colorScheme = ColorScheme.fromSeed(
        brightness: Brightness.light, seedColor: seedColor);
    final darkColorScheme =
        ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: seedColor);
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
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>();
    return Scaffold(
      body: SafeArea(
        child: NeumorphicBackground(
          child: Center(
            child: Neumorphic(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicRadio(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Material Design"),
                            ),
                          ),
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: _setGroupValue,
                        ),
                        const SizedBox(width: 20),
                        NeumorphicRadio(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Cupertino Design"),
                            ),
                          ),
                          value: 2,
                          groupValue: _groupValue,
                          onChanged: _setGroupValue,
                        ),
                        const SizedBox(width: 20),
                        NeumorphicRadio(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Fluent Design"),
                            ),
                          ),
                          value: 3,
                          groupValue: _groupValue,
                          onChanged: _setGroupValue,
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
