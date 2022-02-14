import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

const _buttonTextSizeInSp = 16.0;
const _buttonCornerRadius = 20;
const _customFontPath = "fonts/AndadaPro.ttf";

final firstLayerCustomizationExample1 = FirstLayerStyleSettings(
  headerImage: HeaderImageSettings.extended(
      image: const UsercentricsImage(assetPath: "images/header_extended.png")),
  title: const TitleSettings(
    alignment: SectionAlignment.start,
    fontAssetPath: _customFontPath,
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
      type: ButtonType.more,
      fontAssetPath: _customFontPath,
      backgroundColor: Colors.transparent,
      textColor: Colors.black,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
    const ButtonSettings(
      type: ButtonType.acceptAll,
      fontAssetPath: _customFontPath,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
  ]),
);
