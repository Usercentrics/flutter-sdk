class UsercentricsFont {
  const UsercentricsFont({
    required this.fontAssetPath,
    required this.fontSize,
  });

  final String fontAssetPath;
  final double fontSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsFont &&
          runtimeType == other.runtimeType &&
          fontAssetPath == other.fontAssetPath &&
          fontSize == other.fontSize;

  @override
  int get hashCode => fontAssetPath.hashCode + fontSize.hashCode;

  @override
  String toString() =>
      "$UsercentricsFont(fontAssetPath: $fontAssetPath, fontSize: $fontSize)";
}
