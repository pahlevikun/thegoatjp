import 'package:thegoatjp/src/h.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(getColorFromHex(hexColor));

  static Color toColor(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
        'HEX color must be #rrggbb or #rrggbbaa');

    return Color(getColorFromHex(hex));
  }

  static Color toDarker(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color toLighten(Color color, [double amount = .5]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

extension HexColorStringExt on String {
  Color toColor() {
    return HexColor.toColor(this);
  }

  int toHex() {
    return HexColor.getColorFromHex(this);
  }
}

extension HexColorColorExt on Color {
  String toHex() => '#${value.toRadixString(16)}';
}
