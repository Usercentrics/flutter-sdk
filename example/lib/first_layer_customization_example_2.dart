import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

const _buttonTextSizeInSp = 14.0;
const _buttonCornerRadius = 50;

final firstLayerCustomizationExample2 = FirstLayerStyleSettings(
  backgroundColor: Colors.black,
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
      type: ButtonType.more,
      textColor: Colors.white,
      backgroundColor: Colors.transparent,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
    const ButtonSettings(
      type: ButtonType.acceptAll,
      textColor: Colors.black,
      backgroundColor: Colors.white,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
  ]),
);
