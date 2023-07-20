import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';
import 'package:material_neumorphic_switch/material_neumorphic_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color seedColor = Color.fromARGB(255, 232, 186, 47);
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
  bool _switch1Value = false;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final neumorphicTheme = theme.extension<NeumorphicTheme>();

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
                      'Do you like neumorphic design?',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicSwitch(
                          height: 32,
                          value: _switch1Value,
                          onChanged: (value) {
                            setState(() {
                              _switch1Value = value;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        _switch1Value ? const Text('Yes') : const Text('No'),
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
