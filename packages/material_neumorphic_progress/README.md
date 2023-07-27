# Material Neumorphic Progress

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A widget that shows progress along a line.

NeumorphicProgress is determinate.

Determinate progress indicators have a specific value at each point in time,
and the value should increase monotonically from 0.0 to 1.0, at which time the indicator is complete.
To create a determinate progress indicator, use a non-null value between 0.0 and 1.0.

```dart
NeumorphicProgress(
    height: 15,
    percent: 0.55,
);
```

A widget that shows progress along a line.

NeumorphicProgressIndeterminate is indeterminate.

You can provide a custom animation [duration]

Indeterminate progress indicators do not have a specific value at each point in time and instead indicate that progress is being made
without indicating how much progress remains. To create an indeterminate progress indicator, use a null value.

```dart
NeumorphicProgressIndeterminate(
    height: 15,
);
```
