import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';
import 'package:material_neumorphic_app_bar/material_neumorphic_app_bar.dart';
import 'package:material_neumorphic_toggle/material_neumorphic_toggle.dart';

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
  int _selectedIndex = 0;

  _mapName(int idx) {
    switch (idx) {
      case 0:
        return 'Superman';
      case 1:
        return 'Aquaman';
      case 2:
        return 'Batman';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text(
          'The ${_mapName(_selectedIndex)}',
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: NeumorphicBackground(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Neumorphic(
                child: SizedBox(
                  width: 480.0,
                  height: 320.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                                'Superman',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'Superman',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            ),
                            ToggleElement(
                              background: const Center(
                                  child: Text(
                                'Aquaman',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'Aquaman',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            ),
                            ToggleElement(
                              background: const Center(
                                  child: Text(
                                'Batman',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'Batman',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            )
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
                      Center(
                        child: Text(
                          _mapName(_selectedIndex),
                        ),
                      )
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
