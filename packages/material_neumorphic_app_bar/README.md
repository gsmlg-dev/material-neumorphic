# Material Neumorphic AppBar

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

Neumorphic style AppBar, params are the same as [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

```dart
NeumorphicAppBar(
    leading: _showLeading
        ? NeumorphicButton(
            style: NeumorphicStyle(color: theme.colorScheme.primary),
            onPressed: () {
                // Navigator.of(context).pop();
            },
            child: const Icon(Icons.menu))
        : null,
    actionSpacing: 10,
    actions: _showActions
        ? [
            NeumorphicButton(
                style: NeumorphicStyle(color: theme.colorScheme.primary),
                onPressed: () {
                    // Navigator.of(context).pop();
                },
                child: const Icon(Icons.message_rounded)),
            NeumorphicButton(
                style: NeumorphicStyle(color: theme.colorScheme.primary),
                onPressed: () {
                    // Navigator.of(context).pop();
                },
                child: const Icon(Icons.account_circle))
            ]
        : null,
    title: Text(
        'Neumorphic AppBar',
        style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onPrimary,
        ),
    ),
),
```
