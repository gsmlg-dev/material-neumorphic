# Material Neumorphic Indicator

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

An indicator is a horizontal / vertical bar that display a percentage

Like a ProgressBar, but with an [orientation] @see [NeumorphicIndicatorOrientation]

`enum NeumorphicIndicatorOrientation { vertical, horizontal }`

it takes a [padding], a [width] and [height]

the current accented roundrect use the [percent] field

```dart
Widget _buildIndicators() {
    final width = 14.0;

    return SizedBox(
        height: 130,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                NeumorphicIndicator(
                    width: width,
                    percent: 0.4,
                ),
                SizedBox(width: 10),
                NeumorphicIndicator(
                    width: width,
                    percent: 0.2,
                ),
                SizedBox(width: 10),
                NeumorphicIndicator(
                    width: width,
                    percent: 0.5,
                ),
                SizedBox(width: 10),
                NeumorphicIndicator(
                    width: width,
                    percent: 1,
                ),
            ],
        ),
    );
}
```
