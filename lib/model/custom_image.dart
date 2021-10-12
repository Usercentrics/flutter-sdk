class UsercentricsImage {
  const UsercentricsImage({
    required this.asset,
  });

  factory UsercentricsImage.asset(String assetName) {
    return UsercentricsImage(
      asset: assetName,
    );
  }

  final String asset;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsImage &&
          runtimeType == other.runtimeType &&
          asset == other.asset;

  @override
  int get hashCode => asset.hashCode;

  @override
  String toString() => "$UsercentricsImage(asset: $asset)";
}
