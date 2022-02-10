import 'package:usercentrics_sdk/src/internal/serializer/consent_type_serializer.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';

class ConsentSerializer {
  static UsercentricsServiceConsent deserialize(dynamic value) {
    return UsercentricsServiceConsent(
      templateId: value['templateId'],
      status: value['status'],
      type: ConsentTypeSerializer.deserialize(value['type']),
      version: value['version'],
      dataProcessor: value['dataProcessor'],
      isEssential: value['isEssential'],
      history: (value['history'] as List)
          .map((e) => _deserializeHistoryEntry(e))
          .toList(),
    );
  }

  static UsercentricsConsentHistoryEntry _deserializeHistoryEntry(
      dynamic value) {
    return UsercentricsConsentHistoryEntry(
      status: value['status'],
      timestampInMillis: value['timestampInMillis'],
      type: ConsentTypeSerializer.deserialize(value['type']),
    );
  }
}
