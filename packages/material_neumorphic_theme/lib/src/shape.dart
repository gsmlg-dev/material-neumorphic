/// Define the neumorphic curve of the top of the widget
///
///   - concave
///   - convex
///   - flat
///
enum NeumorphicShape {
  flat,
  convex,
  concave,
}

extension NeumorphicShapeExtension on NeumorphicShape {
  String get title {
    switch (this) {
      case NeumorphicShape.flat:
        return "Flat";
      case NeumorphicShape.convex:
        return "Convex";
      case NeumorphicShape.concave:
        return "Concave";
    }
  }

  int get index {
    switch (this) {
      case NeumorphicShape.flat:
        return 0;
      case NeumorphicShape.convex:
        return 1;
      case NeumorphicShape.concave:
        return 2;
    }
  }
}
