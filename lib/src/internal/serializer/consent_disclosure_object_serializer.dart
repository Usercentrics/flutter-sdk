import 'package:usercentrics_sdk/src/model/consent_disclosure.dart';

class ConsentDisclosureObjectSerializer {
  static ConsentDisclosureObject? deserialize(dynamic value) {
    if (value == null) {
      return null;
    }

    // New format: { disclosures: [...], sdks: [...] }
    if (value is Map) {
      final disclosures = value['disclosures'] as List<dynamic>? ?? [];
      final sdks = value['sdks'] as List<dynamic>? ?? [];
      if (disclosures.isEmpty && sdks.isEmpty) {
        return null;
      }
      return ConsentDisclosureObject(
        disclosures: disclosures
            .map<ConsentDisclosure>(
                (e) => ConsentDisclosureSerializer.deserialize(e))
            .toList(),
        sdks: sdks
            .map<ConsentDisclosureSDK>(
                (e) => ConsentDisclosureSDKSerializer.deserialize(e))
            .toList(),
      );
    }

    // Legacy format: array of disclosures
    final values = value is List ? value : [];
    if (values.isEmpty) {
      return null;
    }
    return ConsentDisclosureObject(
      disclosures: values
          .map<ConsentDisclosure>(
              (e) => ConsentDisclosureSerializer.deserialize(e))
          .toList(),
    );
  }
}

class ConsentDisclosureSDKSerializer {
  static ConsentDisclosureSDK deserialize(dynamic value) {
    return ConsentDisclosureSDK(
      name: value['name'] ?? '',
      use: value['use'] ?? '',
    );
  }
}

class ConsentDisclosureSerializer {
  static ConsentDisclosure deserialize(dynamic value) {
    return ConsentDisclosure(
        identifier: value['identifier'] ?? "",
        type: ConsentDisclosureTypeSerializer.deserialize(value['type']),
        name: value['name'] ?? "",
        maxAgeSeconds: value['maxAgeSeconds'],
        cookieRefresh: value['cookieRefresh'],
        purposes: value['purposes']?.cast<int>() ?? [],
        domain: value['domain'] ?? "",
        description: value['description'] ?? "");
  }
}

class ConsentDisclosureTypeSerializer {
  static ConsentDisclosureType? deserialize(dynamic value) {
    switch (value) {
      case 'COOKIE':
        return ConsentDisclosureType.cookie;
      case 'WEB':
        return ConsentDisclosureType.web;
      case 'APP':
        return ConsentDisclosureType.app;
    }
    return null;
  }
}
