/// Payload emitted when a GPP section changes.
class GppSectionChangePayload {
  const GppSectionChangePayload({
    required this.data,
  });

  /// The serialized section change data.
  final String data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GppSectionChangePayload &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => "$GppSectionChangePayload(data: $data)";
}
