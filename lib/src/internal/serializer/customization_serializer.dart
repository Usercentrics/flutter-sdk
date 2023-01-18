import 'package:usercentrics_sdk/src/model/customization.dart';

class CustomizationSerializer {
  static UsercentricsCustomization deserialize(dynamic value) {
    return UsercentricsCustomization(
      logoUrl: value['logoUrl'] ?? "",
      borderRadiusLayer: value['borderRadiusLayer'],
      borderRadiusButton: value['borderRadiusButton'],
      overlayOpacity: value['overlayOpacity'],
      font: FontSerializer.deserialize(value['font']),
      color: CustomizationColorSerializer.deserialize(value['color']),
    );
  }
}

class FontSerializer {
  static CustomizationFont deserialize(dynamic value) {
    return CustomizationFont(
      family: value['family'] ?? "",
      size: value['size'],
    );
  }
}

class CustomizationColorSerializer {
  static CustomizationColor deserialize(dynamic value) {
    return CustomizationColor(
      primary: value['primary'] ?? "",
      acceptBtnText: value['acceptBtnText'] ?? "",
      acceptBtnBackground: value['acceptBtnBackground'] ?? "",
      denyBtnText: value['denyBtnText'] ?? "",
      denyBtnBackground: value['denyBtnBackground'] ?? "",
      saveBtnText: value['saveBtnText'] ?? "",
      saveBtnBackground: value['saveBtnBackground'] ?? "",
      linkIcon: value['linkIcon'] ?? "",
      linkFont: value['linkFont'] ?? "",
      text: value['text'] ?? "",
      layerBackground: value['layerBackground'] ?? "",
      overlay: value['overlay'] ?? "",
      toggleInactiveBackground: value['toggleInactiveBackground'] ?? "",
      toggleInactiveIcon: value['toggleInactiveIcon'] ?? "",
      toggleActiveBackground: value['toggleActiveBackground'] ?? "",
      toggleActiveIcon: value['toggleActiveIcon'] ?? "",
      toggleDisabledBackground: value['toggleDisabledBackground'] ?? "",
      toggleDisabledIcon: value['toggleDisabledIcon'] ?? "",
      secondLayerTab: value['secondLayerTab'] ?? "",
      moreBtnBackground: value['moreBtnBackground'] ?? "",
      moreBtnText: value['moreBtnText'] ?? "",
    );
  }
}
