import 'package:flutter/foundation.dart';

class ConsentDisclosureObject {
  const ConsentDisclosureObject({required this.disclosures});

  final List<ConsentDisclosure> disclosures;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentDisclosureObject &&
          runtimeType == other.runtimeType &&
          listEquals(disclosures, other.disclosures);

  @override
  int get hashCode => disclosures.hashCode;
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
