import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/category.dart';
import 'package:usercentrics_sdk/src/model/location.dart';
import 'package:usercentrics_sdk/src/model/model.dart';
import 'package:usercentrics_sdk/src/model/service.dart';
import 'package:usercentrics_sdk/src/model/variant.dart';

/// The CMP data.
class UsercentricsCMPData {
  const UsercentricsCMPData({
    required this.settings,
    required this.services,
    required this.categories,
    required this.activeVariant,
    required this.userLocation,
  });

  /// The general settings defined for the settingsId.
  final UsercentricsSettings settings;

  /// The services defined for the settingsId.
  final List<UsercentricsService> services;

  /// The categories defined for the settingsId.
  final List<UsercentricsCategory> categories;

  /// The active variant.
  final UsercentricsVariant activeVariant;

  /// The current user location.
  final UsercentricsLocation userLocation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsCMPData &&
          runtimeType == other.runtimeType &&
          settings == other.settings &&
          userLocation == other.userLocation &&
          activeVariant == other.activeVariant &&
          listEquals(services, other.services) &&
          listEquals(categories, other.categories);

  @override
  int get hashCode =>
      settings.hashCode +
      userLocation.hashCode +
      activeVariant.hashCode +
      services.hashCode +
      categories.hashCode;

  @override
  String toString() =>
      "$UsercentricsCMPData(activeVariant: $activeVariant, userLocation: $userLocation, settings: $settings, categories: $categories, services: $services)";
}
