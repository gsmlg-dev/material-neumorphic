# Material Neumorphic Slider

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A Neumorphic Design slider.

Used to select value from a range of values.

The default is to use a continuous range of values from min to max.

listeners : [onChanged], [onChangeStart], [onChangeEnd]

```dart
// in a statefull widget

double seekValue = 0;

Widget _buildSlider() {
    return Row(
        children: <Widget>[
            Flexible(
                child: NeumorphicSlider(
                    height: 15,
                    value: seekValue,
                    min: 0,
                    max: 10,
                    onChanged: (value) {
                    setState(() {
                        seekValue = value;
                    });
                }),
            ),
            Text("value: ${seekValue.round()}"),
        ],
    );
}
```

A Neumorphic Design range slider.

Used to select range of values from a range of values.

listeners : [onChangedLow], [onChangeHigh]

```dart
// in a statefull widget

double minPrice = 20;
double maxPrice = 90;

Widget _buildSlider() {
    return Row(
        children: <Widget>[
            Flexible(
                child: NeumorphicRangeSlider(
                    valueLow: minPrice,
                    valueHigh: maxPrice,
                    min: 18,
                    max: 99,
                    onChangedLow: (value) {
                        setState(() {
                            minPrice = value;
                        });
                    },
                    onChangeHigh: (value) {
                        setState(() {
                            maxPrice = value;
                        });
                    },
                ),
            ),
            Text(
                "${minPrice.round()} - ${maxPrice.round()}",
                style: TextStyle(color:  Theme.of(context).colorScheme.primary),
            ),
        ],
    );
}
```
