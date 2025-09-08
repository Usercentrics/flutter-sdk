import 'dart:ui';

class ColorSerializer {
  static dynamic serialize(Color? value) => value?.toHex();
}

extension _HexColor on Color {
  // /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  // static Color fromHex(String hexString) {
  //   final buffer = StringBuffer();
  //   if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  //   buffer.write(hexString.replaceFirst('#', ''));
  //   return Color(int.parse(buffer.toString(), radix: 16));
  // }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${(alpha * 255.0).round().toRadixString(16).padLeft(2, '0')}'
      '${(red * 255.0).round().toRadixString(16).padLeft(2, '0')}'
      '${(green * 255.0).round().toRadixString(16).padLeft(2, '0')}'
      '${(blue * 255.0).round().toRadixString(16).padLeft(2, '0')}';
}
