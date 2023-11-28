import 'package:usercentrics_sdk/src/model/consent_disclosure.dart';

class ConsentDisclosureObjectSerializer {
  static ConsentDisclosureObject? deserialize(dynamic value) {
    if (value == null) {
      return null;
    }

    List<dynamic> values = value ?? [];
    if (values.isEmpty) {
      return null;
    }
    return ConsentDisclosureObject(
      disclosures: (value ?? [])
          .map<ConsentDisclosure>(
              (e) => ConsentDisclosureSerializer.deserialize(e))
          .toList(),
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
