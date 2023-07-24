import 'dart:ui';

class NeumorphicBorder {
  final bool isEnabled;
  final Color? color;
  final double? width;

  const NeumorphicBorder({
    this.isEnabled = true,
    this.color,
    this.width,
  });

  const NeumorphicBorder.none()
      : isEnabled = true,
        color = const Color(0x00000000),
        width = 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphicBorder &&
          runtimeType == other.runtimeType &&
          isEnabled == other.isEnabled &&
          color == other.color &&
          width == other.width;

  @override
  int get hashCode => isEnabled.hashCode ^ color.hashCode ^ width.hashCode;

  @override
  String toString() {
    return 'NeumorphicBorder{isEnabled: $isEnabled, color: $color, width: $width}';
  }

  static NeumorphicBorder? lerp(
      NeumorphicBorder? a, NeumorphicBorder? b, double t) {
    if (a == null && b == null) return null;

    if (t == 0.0) return a;
    if (t == 1.0) return b;

    return NeumorphicBorder(
      color: Color.lerp(a!.color, b!.color, t),
      isEnabled: a.isEnabled,
      width: lerpDouble(a.width, b.width, t),
    );
  }

  NeumorphicBorder copyWithThemeIfNull({Color? color, double? width}) {
    return NeumorphicBorder(
      isEnabled: isEnabled,
      color: this.color ?? color,
      width: this.width ?? width,
    );
  }
}
