import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/consent_type.dart';

/// The current status of a service.
class UsercentricsServiceConsent {
  const UsercentricsServiceConsent({
    required this.templateId,
    required this.status,
    required this.dataProcessor,
    required this.version,
    required this.type,
    required this.isEssential,
    required this.history,
    required this.category,
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

  /// True if the service is essential, False if not.
  final bool isEssential;

  /// The consent history chronologically ordered.
  final List<UsercentricsConsentHistoryEntry> history;

  // The corresponding category of this service.
  final String category;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsServiceConsent &&
          runtimeType == other.runtimeType &&
          templateId == other.templateId &&
          status == other.status &&
          dataProcessor == other.dataProcessor &&
          version == other.version &&
          isEssential == other.isEssential &&
          listEquals(history, other.history) &&
          type == other.type &&
          category == other.category;

  @override
  int get hashCode =>
      templateId.hashCode +
      status.hashCode +
      dataProcessor.hashCode +
      version.hashCode +
      isEssential.hashCode +
      history.hashCode +
      type.hashCode +
      category.hashCode;

  @override
  String toString() =>
      "$UsercentricsServiceConsent(templateId: $templateId, status: $status, dataProcessor: $dataProcessor, version: $version, type: $type, isEssential: $isEssential, category: $category)";
}

/// The consent history entry
class UsercentricsConsentHistoryEntry {
  const UsercentricsConsentHistoryEntry({
    required this.status,
    required this.timestampInMillis,
    required this.type,
  });

  /// True if consent was given, False if not.
  final bool status;

  /// The UNIX timestamp in millisecons of the consent.
  final int timestampInMillis;

  /// The type of the current consent status. E.g. 'Explicit'.
  final UsercentricsConsentType? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsConsentHistoryEntry &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          timestampInMillis == other.timestampInMillis &&
          type == other.type;

  @override
  int get hashCode =>
      status.hashCode + timestampInMillis.hashCode + type.hashCode;

  @override
  String toString() =>
      "$UsercentricsConsentHistoryEntry(status: $status, timestampInMillis: $timestampInMillis, type: $type)";
}
