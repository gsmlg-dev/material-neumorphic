# Material Neumorphic TextField

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

A Neumorphic TextField

Add properties than origin TextField:

```dart
  final NeumorphicStyle? neumorphicStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? depth;
  final BorderRadius borderRadius;
```

**Example:**

```dart
build(context) {
    return Column(
        children: [
            NeumorphicTextField(
                margin: const EdgeInsets.symmetric(vertical: 12),
                borderRadius:
                    const BorderRadius.all(Radius.circular(12.0)),
                depth: -4,
                initialValue: name,
                decoration: const InputDecoration(
                    labelText: 'Name',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                onChanged: (value) {
                    setState(() {
                        name = value;
                    });
                },
            ),
            NeumorphicTextFormField(
                margin: const EdgeInsets.symmetric(vertical: 12),
                borderRadius:
                    const BorderRadius.all(Radius.circular(12.0)),
                depth: -4,
                initialValue: name,
                decoration: const InputDecoration(
                    labelText: 'Name',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
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
