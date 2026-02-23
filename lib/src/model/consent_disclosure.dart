import 'package:flutter/foundation.dart';

class ConsentDisclosureSDK {
  const ConsentDisclosureSDK({required this.name, required this.use});

  final String name;
  final String use;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentDisclosureSDK &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          use == other.use;

  @override
  int get hashCode => Object.hash(name, use);
}

class ConsentDisclosureObject {
  const ConsentDisclosureObject({
    required this.disclosures,
    this.sdks = const [],
  });

  final List<ConsentDisclosure> disclosures;
  final List<ConsentDisclosureSDK> sdks;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentDisclosureObject &&
          runtimeType == other.runtimeType &&
          listEquals(disclosures, other.disclosures) &&
          listEquals(sdks, other.sdks);

  @override
  int get hashCode => Object.hash(disclosures, sdks);
}

class ConsentDisclosure {
  const ConsentDisclosure(
      {required this.identifier,
      required this.type,
      required this.name,
      required this.maxAgeSeconds,
      required this.cookieRefresh,
      required this.purposes,
      required this.domain,
      required this.description});

  final String? identifier;
  final ConsentDisclosureType? type;
  final String? name;
  final int? maxAgeSeconds;
  final bool cookieRefresh;
  final List<int> purposes;
  final String? domain;
  final String? description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentDisclosure &&
          runtimeType == other.runtimeType &&
          identifier == other.identifier &&
          type == other.type &&
          name == other.name &&
          maxAgeSeconds == other.maxAgeSeconds &&
          cookieRefresh == other.cookieRefresh &&
          listEquals(purposes, other.purposes) &&
          domain == other.domain &&
          description == other.description;

  @override
  int get hashCode =>
      identifier.hashCode ^
      type.hashCode ^
      name.hashCode ^
      maxAgeSeconds.hashCode ^
      cookieRefresh.hashCode ^
      purposes.hashCode ^
      domain.hashCode ^
      description.hashCode;
}

enum ConsentDisclosureType { cookie, web, app }
