import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';
import 'package:material_neumorphic_checkbox/material_neumorphic_checkbox.dart';

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
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

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
                      'Which design do you like?',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicCheckbox(
                          value: _value1,
                          onChanged: (bool value) {
                            setState(() {
                              _value1 = value;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Text('neumorphic'),
                        const SizedBox(width: 20),
                        NeumorphicCheckbox(
                          value: _value2,
                          onChanged: (bool value) {
                            setState(() {
                              _value2 = value;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Text('morphic'),
                        const SizedBox(width: 20),
                        NeumorphicCheckbox(
                          value: _value3,
                          onChanged: (bool value) {
                            setState(() {
                              _value3 = value;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Text('flat'),
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
