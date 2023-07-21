import 'package:flutter/material.dart';
import 'package:material_neumorphic_theme/material_neumorphic_theme.dart';
import 'package:material_neumorphic_button/material_neumorphic_button.dart';
import 'package:material_neumorphic_background/material_neumorphic_background.dart';
import 'package:material_neumorphic_app_bar/material_neumorphic_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color seedColor = Color.fromARGB(255, 221, 230, 232);
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
  bool _showLeading = false;
  bool _showActions = false;

  void _toggleLeading() {
    setState(() {
      _showLeading = !_showLeading;
    });
  }

  void _toggleActions() {
    setState(() {
      _showActions = !_showActions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: _showLeading
            ? NeumorphicButton(
                style: NeumorphicStyle(color: theme.colorScheme.primary),
                onPressed: () {
                  // Navigator.of(context).pop();
                },
                child: const Icon(Icons.menu))
            : null,
        actionSpacing: 10,
        actions: _showActions
            ? [
                NeumorphicButton(
                    style: NeumorphicStyle(color: theme.colorScheme.primary),
                    onPressed: () {
                      // Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.message_rounded)),
                NeumorphicButton(
                    style: NeumorphicStyle(color: theme.colorScheme.primary),
                    onPressed: () {
                      // Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.account_circle))
              ]
            : null,
        title: Text(
          'Neumorphic AppBar',
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
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
                      'Setup AppBar',
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    NeumorphicButton(
                      onPressed: _toggleLeading,
                      child: const Text('Toggle Leading'),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    const SizedBox(height: 10),
                    NeumorphicButton(
                      onPressed: _toggleActions,
                      child: const Text('Toggle Actions'),
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
