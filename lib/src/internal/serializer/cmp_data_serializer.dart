import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/cmp_data.dart';

class CMPDataSerializer {
  static UsercentricsCMPData deserialize(dynamic value) {
    return UsercentricsCMPData(
      settings: SettingsSerializer.deserialize(value['settings']),
      services: (value['services'] as List)
          .map((e) => ServiceSerializer.deserialize(e))
          .toList(),
      categories: (value['categories'] as List)
          .map((e) => CategorySerializer.deserialize(e))
          .toList(),
      activeVariant: VariantSerializer.deserialize(value['activeVariant'])!,
      userLocation: LocationSerializer.deserialize(value['userLocation']),
    );
  }
}
