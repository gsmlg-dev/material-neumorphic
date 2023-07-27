# Material Neumorphic Button

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A Neumorphic Button

When pressed, it will fire a call to its [VoidCallback] `onPressed` click parameter
The animation starts from style.depth (or theme.depth is not defined in the style)
@see [NeumorphicStyle]

And finished to `minDistance`, in [duration] (time)

You can force the pressed state using [pressed]

- true : forced as pressed
- false : forced as unpressed
- null : can be pressed by user

It takes a [padding], default EdgeInsets.symmetric(horizontal: 8, vertical: 4)`

It takes a [NeumorphicStyle] @see [NeumorphicStyle]

```dart
NeumorphicButton(
    onClick: () {
        setState(() {
            // do some stuff
        });
    },
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
    style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
    ),
    child: Text("Click me"),
)
```
