import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

const _buttonTextSizeInSp = 16.0;
const _buttonCornerRadius = 20;
const _customBoldFontPath = 'fonts/AndadaPro-Bold.ttf';
const _customRegularFontPath = 'fonts/AndadaPro.ttf';

final _firstLayer = FirstLayerStyleSettings(
  layout: UsercentricsLayout.popupBottom,
  headerImage: HeaderImageSettings.extended(
    imageAssetPath: "images/header_extended.png",
  ),
  title: const TitleSettings(
    alignment: SectionAlignment.start,
    fontAssetPath: _customBoldFontPath,
    textColor: Colors.black,
    textSize: 20,
  ),
  message: const MessageSettings(
    alignment: SectionAlignment.start,
    textSize: 16,
    textColor: Colors.black54,
    linkTextColor: Colors.black,
    linkTextUnderline: true,
  ),
  cornerRadius: 50,
  buttonLayout: ButtonLayout.row(buttons: [
    const ButtonSettings(
      type: ButtonType.acceptAll,
      fontAssetPath: _customBoldFontPath,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
  ]),
);

const _general = GeneralStyleSettings(
  logo: BannerImage(assetPath: 'images/flutter-logo.png'),
  font: BannerFont(
    regularFontAssetPath: _customRegularFontPath,
    boldFontAssetPath: _customBoldFontPath,
    fontSize: 15,
  ),
  links: LegalLinksSettings.secondLayerOnly,
);

final bannerSettingsCustomizationExample1 = BannerSettings(
  firstLayer: _firstLayer,
  secondLayer: const SecondLayerStyleSettings(
    showCloseButton: true,
  ),
  general: _general,
);
