import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';
import 'package:material_neumorphic_toggle/material_neumorphic_toggle.dart';
import 'package:material_neumorphic_progress/material_neumorphic_progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color seedColor = NeumorphicTheme.defaultSeedColor;
    final colorScheme = ColorScheme.fromSeed(
        brightness: Brightness.light, seedColor: seedColor);
    final darkColorScheme =
        ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: seedColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic progress',
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
  int _selectedIndex = 1;

  double _mapValue(int idx) {
    switch (idx) {
      case 0:
        return 0;
      case 1:
        return 0.5;
      case 2:
        return 1.0;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: theme.colorScheme.secondaryContainer,
      body: SafeArea(
        child: NeumorphicBackground(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Neumorphic(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: 360,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              NeumorphicProgress(
                                style: ProgressStyle(
                                  depth: 4,
                                ),
                                height: 15,
                                percent: _mapValue(_selectedIndex),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: NeumorphicToggle(
                          height: 48,
                          selectedIndex: _selectedIndex,
                          displayForegroundOnlyIfSelected: true,
                          children: [
                            ToggleElement(
                              background: const Center(
                                  child: Text(
                                'step 1',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'step 1',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            ),
                            ToggleElement(
                              background: const Center(
                                  child: Text(
                                'step 2',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'step 2',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            ),
                            ToggleElement(
                              background: const Center(
                                  child: Text(
                                'step 3',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'step 3',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            ),
                          ],
                          thumb: Neumorphic(
                              style: NeumorphicStyle(
                            boxShape: NeumorphicBoxShape.roundRect(
                                const BorderRadius.all(Radius.circular(12))),
                          )),
                          onChanged: (value) {
                            setState(() {
                              _selectedIndex = value;
                            });
                          },
                        ),
                      ),
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
