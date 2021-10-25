import 'package:usercentrics_sdk/src/model/consent_type.dart';

/// The current status of a service.
class UsercentricsServiceConsent {
  const UsercentricsServiceConsent({
    required this.templateId,
    required this.status,
    required this.dataProcessor,
    required this.version,
    required this.type,
  });

  /// A unique ID that represents the legal specifications of the service.
  final String templateId;

  /// True if consent was given, False if not.
  final bool status;

  /// The data controller that determines the purposes and the means of the processed data.The data processor is usually a third party external to the company. E.g. 'Google'.
  final String dataProcessor;

  /// The configuration version of the service.
  final String version;

  /// The type of the current consent status. E.g. 'Explicit'.
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
