/// GPP (Global Privacy Platform) data.
class GppData {
  const GppData({
    required this.gppString,
    required this.applicableSections,
    required this.sections,
  });

  /// The GPP string encoding the user's consent preferences.
  final String gppString;

  /// List of applicable section IDs.
  final List<int> applicableSections;

  /// Map of section name to a map of field name to field value.
  final Map<String, Map<String, dynamic>> sections;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GppData &&
          runtimeType == other.runtimeType &&
          gppString == other.gppString &&
          _listEquals(applicableSections, other.applicableSections) &&
          _sectionsEquals(sections, other.sections);

  @override
  int get hashCode =>
      gppString.hashCode +
      applicableSections.hashCode +
      sections.hashCode;

  @override
  String toString() =>
      "$GppData(gppString: $gppString, applicableSections: $applicableSections, sections: $sections)";
}

bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

bool _sectionsEquals(
    Map<String, Map<String, dynamic>> a,
    Map<String, Map<String, dynamic>> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (final key in a.keys) {
    if (!b.containsKey(key)) return false;
    final aInner = a[key]!;
    final bInner = b[key]!;
    if (aInner.length != bInner.length) return false;
    for (final innerKey in aInner.keys) {
      if (!bInner.containsKey(innerKey) || aInner[innerKey] != bInner[innerKey]) {
        return false;
      }
    }
  }
  return true;
}
