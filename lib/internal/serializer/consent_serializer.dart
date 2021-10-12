import 'package:usercentrics_sdk/internal/serializer/consent_type_serializer.dart';
import 'package:usercentrics_sdk/model/service_consent.dart';

class ConsentSerializer {
  static UsercentricsServiceConsent deserialize(dynamic value) {
    return UsercentricsServiceConsent(
      templateId: value['templateId'],
      status: value['status'],
      type: ConsentTypeSerializer.deserialize(value['type']),
      version: value['version'],
      dataProcessor: value['dataProcessor'],
    );
  }
}
