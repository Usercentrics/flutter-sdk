/// The location of the user.
class UsercentricsLocation {
  const UsercentricsLocation({
    required this.countryCode,
    required this.regionCode,
    required this.isInEU,
    required this.isInUS,
    required this.isInCalifornia,
  });

  /// The country code. E.g 'DE'.
  final String countryCode;

  /// The region code following the local format. E.g 'USCA'.
  final String regionCode;

  /// True, if the location is inside the European Union. False, it not.
  final bool isInEU;

  /// True, if the location is inside the United States of America. False, it not.
  final bool isInUS;

  /// True, if the location is inside the state of California. False, it not.
  final bool isInCalifornia;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsLocation &&
          runtimeType == other.runtimeType &&
          countryCode == other.countryCode &&
          regionCode == other.regionCode;

  @override
  int get hashCode => countryCode.hashCode + regionCode.hashCode;

  @override
  String toString() =>
      "$UsercentricsLocation(countryCode: $countryCode, regionCode: $regionCode)";
}
