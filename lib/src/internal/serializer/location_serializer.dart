import 'package:usercentrics_sdk/src/model/location.dart';

class LocationSerializer {
  static UsercentricsLocation deserialize(dynamic value) {
    return UsercentricsLocation(
      countryCode: value['countryCode'] ?? "",
      countryName: value['countryName'] ?? "",
      regionCode: value['regionCode'] ?? "",
      isInEU: value['isInEU'],
      isInUS: value['isInUS'],
      isInCalifornia: value['isInCalifornia'],
    );
  }
}
