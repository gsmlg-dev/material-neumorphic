# Material Neumorphic Toggle Button Group

Part of [Material Neumorphic](https://github.com/gsmlg-dev/material_neumorphic) widgets suit.

## Usage

Switch with custom thumb (defined with list of ToggleElements)

Widget does not save state

- notifies a `ValueChanged<int>` : onChanged
- need a `selectedIndex` parameter

```dart
Expanded(
 child: NeumorphicToggle(
   height: 50,
   selectedIndex: _selectedIndex,
   displayForegroundOnlyIfSelected: true,
   children: [
     ToggleElement(
       background: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w500),)),
       foreground: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w700),)),
     ),
     ToggleElement(
       background: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w500),)),
       foreground: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w700),)),
     ),
     ToggleElement(
       background: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w500),)),
       foreground: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w700),)),
     )
   ],
   thumb: Neumorphic(
     boxShape: NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.all(Radius.circular(12))),
   ),
   onChanged: (value) {
     setState(() {
       _selectedIndex = value;
       print("_firstSelected: $_selectedIndex");
     });
   },
 ),
),
```
