import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_button/material_neumorphic_button.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  const BorderRadius.all(Radius.circular(24)),
                ),
              ),
              margin: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 480.0,
                height: 320.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    const SizedBox(height: 20),
                    SelectableText('$_counter',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            )),
                    const SizedBox(height: 20),
                    NeumorphicButton(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: const Text('Click Me to +1'),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      // height: 1,
                      // thickness: 5,
                      indent: 20,
                      endIndent: 20,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    const SizedBox(height: 10),
                    NeumorphicButton(
                      style: const NeumorphicStyle(
                        depth: -2,
                      ),
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      child: const Text('Click Me to -1'),
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
