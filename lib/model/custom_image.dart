class UsercentricsImage {
  const UsercentricsImage({
    required this.assetPath,
  });

  final String assetPath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsImage &&
          runtimeType == other.runtimeType &&
          assetPath == other.assetPath;

  @override
  int get hashCode => assetPath.hashCode;

  @override
  String toString() => "$UsercentricsImage(assetPath: $assetPath)";
}
