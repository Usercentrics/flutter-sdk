import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

const _buttonTextSizeInSp = 14.0;
const _buttonCornerRadius = 50;
const _dark = Color.fromARGB(255, 24, 24, 24);
const _grey = Color.fromARGB(255, 42, 42, 42);

final _firstLayer = FirstLayerStyleSettings(
  layout: UsercentricsLayout.full,
  backgroundColor: _dark,
  headerImage: HeaderImageSettings.logo(
    imageAssetPath: "images/header_logo.png",
  ),
  title: const TitleSettings(
    alignment: SectionAlignment.start,
    textColor: Colors.white,
    textSize: 18,
  ),
  message: const MessageSettings(
    alignment: SectionAlignment.start,
    textSize: 14,
    textColor: Colors.white60,
    linkTextColor: Colors.white,
    linkTextUnderline: false,
  ),
  buttonLayout: ButtonLayout.column(buttons: [
    const ButtonSettings(
      type: ButtonType.acceptAll,
      textColor: Colors.black,
      backgroundColor: Colors.white,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
  ]),
);

const _general = GeneralStyleSettings(
  logo: BannerImage(assetPath: 'images/header_logo.png'),
  font: BannerFont(
    regularFontAssetPath: 'fonts/Lora-Regular.ttf',
    boldFontAssetPath: 'fonts/Lora-Bold.ttf',
    fontSize: 15,
  ),
  tabColor: Colors.white,
  links: LegalLinksSettings.firstLayerOnly,
  textColor: Colors.white60,
  linkColor: Colors.white,
  bordersColor: _grey,
  layerBackgroundColor: _dark,
  layerBackgroundSecondaryColor: _grey,
  disableSystemBackButton: false,
);

final bannerSettingsCustomizationExample2 = BannerSettings(
  firstLayer: _firstLayer,
  secondLayer: const SecondLayerStyleSettings(
    showCloseButton: true,
  ),
  general: _general,
);
