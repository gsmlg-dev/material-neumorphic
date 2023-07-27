# Material Neumorphic Background

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A container that takes the current [NeumorphicTheme] baseColor as backgroundColor @see [NeumorphicTheme]

Default color it from material colorscheme, [secondaryContainer]

It can provide too a roundRect clip of the screen border using [borderRadius], [margin] and [backendColor]

```dart
NeumorphicBackground(
    borderRadius: BorderRadius.circular(12),
    margin: EdgeInsets.all(12),
    child: Container(
        height: 100,
        width: 100,
    ),
),
```
