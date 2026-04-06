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
  // ignore: deprecated_member_use
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      // ignore: deprecated_member_use
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      // ignore: deprecated_member_use
      '${red.toRadixString(16).padLeft(2, '0')}'
      // ignore: deprecated_member_use
      '${green.toRadixString(16).padLeft(2, '0')}'
      // ignore: deprecated_member_use
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
