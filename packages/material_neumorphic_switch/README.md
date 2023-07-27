# Material Neumorphic Switch

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

Used to toggle the on/off state of a single setting.

The switch itself does not maintain any state. Instead, when the state of the switch changes, the widget calls the onChanged callback.

Most widgets that use a switch will listen for the onChanged callback and rebuild the switch with a new value to update the visual appearance of the switch.

- notifies a `ValueChanged<bool>` : onChanged
- need a `value` [bool] parameter

```dart
NeumorphicSwitch(
    value: _switch2Value,
    style: NeumorphicSwitchStyle(
        thumbShape: NeumorphicShape.flat,
    ),
    onChanged: (value) {
        setState(() {
            _switch2Value = value;
        });
    },
),
```
