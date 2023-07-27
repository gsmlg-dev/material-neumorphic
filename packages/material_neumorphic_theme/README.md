# Material Neumorphic Theme

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

Use for set Neumorphic Theme, like color, depth, intensity, lightSource, etc.

## Usage

```dart
final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: NeumorphicTheme.defaultSeedColor);

final darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: NeumorphicTheme.defaultSeedColor);

return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Neumorphic Theme Demo',
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
```
