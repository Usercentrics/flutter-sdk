import 'package:usercentrics_sdk/src/model/consent_type.dart';

class UsercentricsServiceConsent {
  const UsercentricsServiceConsent({
    required this.templateId,
    required this.status,
    required this.dataProcessor,
    required this.version,
    required this.type,
  });

  final String templateId;
  final bool status;
  final String dataProcessor;
  final String version;
  final UsercentricsConsentType? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsServiceConsent &&
          runtimeType == other.runtimeType &&
          templateId == other.templateId &&
          status == other.status &&
          dataProcessor == other.dataProcessor &&
          version == other.version &&
          type == other.type;

  @override
  int get hashCode =>
      templateId.hashCode +
      status.hashCode +
      dataProcessor.hashCode +
      version.hashCode +
      type.hashCode;

  @override
  String toString() =>
      "$UsercentricsServiceConsent(templateId: $templateId, status: $status, dataProcessor: $dataProcessor, version: $version, type: $type)";
}
