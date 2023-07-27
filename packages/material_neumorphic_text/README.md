# Material Neumorphic Text

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

Like Text, but with Neumorphic style.

## Usage

`depth` must be equal or greater than `0`.

```dart
 NeumorphicText('Neumorphic Design',
    style: NeumorphicStyle().copyWith(
        depth: 4,
        color: Theme.of(context).colorScheme.primary),
    textStyle: const TextStyle(fontSize: 36.0))
```
