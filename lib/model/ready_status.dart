import 'package:usercentrics_sdk/model/service_consent.dart';

class UsercentricsReadyStatus {
  const UsercentricsReadyStatus({
    required this.shouldShowCMP,
    required this.consents,
  });

  final bool shouldShowCMP;
  final List<UsercentricsServiceConsent> consents;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsReadyStatus &&
          runtimeType == other.runtimeType &&
          shouldShowCMP == other.shouldShowCMP &&
          consents == other.consents;

  @override
  int get hashCode => shouldShowCMP.hashCode + consents.hashCode;

  @override
  String toString() =>
      "$UsercentricsReadyStatus(shouldShowCMP: $shouldShowCMP, consents: $consents)";
}
