# Material Neumorphic Radio

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A Neumorphic Radio

It takes a `value` and a `groupValue`

if (value == groupValue) => checked

takes a NeumorphicRadioStyle as `style`

notifies the parent when user interact with this widget with `onChanged`

```dart
int _groupValue;

Widget _buildRadios() {
    return Row(
        children: <Widget>[
            NeumorphicRadio(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                        child: Text("1"),
                    ),
                ),
                value: 1,
                groupValue: _groupValue,
                onChanged: (value) {
                    setState(() {
                        _groupValue = value;
                    });
                },
            ),
            NeumorphicRadio(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                        child: Text("2"),
                    ),
                ),
                value: 2,
                groupValue: _groupValue,
                onChanged: (value) {
                    setState(() {
                        _groupValue = value;
                    });
                },
            ),

            NeumorphicRadio(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                        child: Text("3"),
                    ),
                ),
                value: 3,
                groupValue: _groupValue,
                onChanged: (value) {
                    setState(() {
                        _groupValue = value;
                    });
                },
            ),
        ],
    );
}
```
