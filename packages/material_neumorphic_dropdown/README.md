# Material Neumorphic Dropdown

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A Neumorphic Dropdown

Add properties than origin Dropdown:

```dart
  final NeumorphicStyle? neumorphicStyle;
  final EdgeInsets? margin;
  final Color? color;
  final double? depth;
```

**example:**

```dart
build(context) {
    return Column(
        children: [
            NeumorphicDropdown(
                margin: const EdgeInsets.symmetric(vertical: 12),
                borderRadius:
                    const BorderRadius.all(Radius.circular(12.0)),
                depth: -4,
                value: name,
                items: [
                    DropdownMenuItem(
                        child: Text('A'),
                        value: 'A',
                    ),
                    DropdownMenuItem(
                        child: Text('B'),
                        value: 'B',
                    ),
                    DropdownMenuItem(
                        child: Text('C'),
                        value: 'C',
                    ),
                ],
                onChanged: (value) {
                    setState(() {
                        name = value;
                    });
                },
            ),
            NeumorphicDropdownFormField(
                margin: const EdgeInsets.symmetric(vertical: 12),
                borderRadius:
                    const BorderRadius.all(Radius.circular(12.0)),
                depth: -4,
                value: name,
                items: [
                    DropdownMenuItem(
                        child: Text('A'),
                        value: 'A',
                    ),
                    DropdownMenuItem(
                        child: Text('B'),
                        value: 'B',
                    ),
                    DropdownMenuItem(
                        child: Text('C'),
                        value: 'C',
                    ),
                ],
                onChanged: (value) {
                    setState(() {
                        name = value;
                    });
                },
            ),
        ]
    );
}
```
