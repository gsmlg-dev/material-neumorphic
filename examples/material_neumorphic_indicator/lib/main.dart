import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';
import 'package:material_neumorphic_toggle/material_neumorphic_toggle.dart';
import 'package:material_neumorphic_indicator/material_neumorphic_indicator.dart';

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
      title: 'Neumorphic Indicator',
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

  mapAttr(int idx, int attr) {
    switch (idx) {
      case 0:
        switch (attr) {
          case 0:
            return 18 / 25;
          case 1:
            return 15 / 25;
          case 2:
            return 19 / 25;
          case 3:
            return 12 / 25;
          case 4:
            return 9 / 25;
          case 5:
            return 7 / 25;
        }
      case 1:
        switch (attr) {
          case 0:
            return 13 / 25;
          case 1:
            return 20 / 25;
          case 2:
            return 15 / 25;
          case 3:
            return 17 / 25;
          case 4:
            return 17 / 25;
          case 5:
            return 14 / 25;
        }
      case 2:
        switch (attr) {
          case 0:
            return 22 / 25;
          case 1:
            return 20 / 25;
          case 2:
            return 22 / 25;
          case 3:
            return 15 / 25;
          case 4:
            return 15 / 25;
          case 5:
            return 13 / 25;
        }
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final width = 24.0;
    const height = 24.0;
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text('Strength',
                                      textAlign: TextAlign.start),
                                  NeumorphicIndicator(
                                    orientation: NeumorphicIndicatorOrientation
                                        .horizontal,
                                    height: height,
                                    percent: mapAttr(_selectedIndex, 0),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  const Text('Dexterity'),
                                  NeumorphicIndicator(
                                    orientation: NeumorphicIndicatorOrientation
                                        .horizontal,
                                    height: height,
                                    percent: mapAttr(_selectedIndex, 1),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  const Text('Constitution'),
                                  NeumorphicIndicator(
                                    orientation: NeumorphicIndicatorOrientation
                                        .horizontal,
                                    height: height,
                                    percent: mapAttr(_selectedIndex, 2),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  const Text('Intelligence'),
                                  NeumorphicIndicator(
                                    orientation: NeumorphicIndicatorOrientation
                                        .horizontal,
                                    height: height,
                                    percent: mapAttr(_selectedIndex, 3),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  const Text('Wisdom'),
                                  NeumorphicIndicator(
                                    orientation: NeumorphicIndicatorOrientation
                                        .horizontal,
                                    height: height,
                                    percent: mapAttr(_selectedIndex, 4),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  const Text('Charisma'),
                                  NeumorphicIndicator(
                                    orientation: NeumorphicIndicatorOrientation
                                        .horizontal,
                                    height: height,
                                    percent: mapAttr(_selectedIndex, 5),
                                  ),
                                ],
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
                                'Berserker',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'Berserker',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            ),
                            ToggleElement(
                              background: const Center(
                                  child: Text(
                                'Ranger',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'Ranger',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )),
                            ),
                            ToggleElement(
                              background: const Center(
                                  child: Text(
                                'Monk',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )),
                              foreground: const Center(
                                  child: Text(
                                'Monk',
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
