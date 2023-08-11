# Material Neumorphic Checkbox

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A Neumorphic Checkbox

takes a NeumorphicCheckboxStyle as `style`
takes the current checked state as `value`

notifies the parent when user interact with this widget with `onChanged`

```dart
bool check1 = false;
bool check2 = false;
bool check3 = false;

Widget _buildChecks() {
    return Row(
        children: <Widget>[

            NeumorphicCheckbox(
                value: check1,
                onChanged: (value) {
                    setState(() {
                        check1 = value;
                    });
                },
            ),

            NeumorphicCheckbox(
                value: check2,
                onChanged: (value) {
                    setState(() {
                        check2 = value;
                    });
                },
            ),

            NeumorphicCheckbox(
                value: check3,
                onChanged: (value) {
                    setState(() {
                        check3 = value;
                    });
                },
            ),

        ],
    );
}
```
