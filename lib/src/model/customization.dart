class UsercentricsCustomization {
  const UsercentricsCustomization({
    required this.logoUrl,
    required this.borderRadiusLayer,
    required this.useBackgroundShadow,
    required this.borderRadiusButton,
    required this.overlayOpacity,
    required this.font,
    required this.color,
  });

  final String logoUrl;
  final int? borderRadiusLayer;
  final bool? useBackgroundShadow;
  final int? borderRadiusButton;
  final double? overlayOpacity;
  final CustomizationFont? font;
  final CustomizationColor? color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsCustomization &&
          runtimeType == other.runtimeType &&
          logoUrl == other.logoUrl &&
          borderRadiusLayer == other.borderRadiusLayer &&
          useBackgroundShadow == other.useBackgroundShadow &&
          borderRadiusButton == other.borderRadiusButton &&
          overlayOpacity == other.overlayOpacity &&
          font == other.font &&
          color == other.color;

  @override
  int get hashCode =>
      logoUrl.hashCode +
      borderRadiusLayer.hashCode +
      useBackgroundShadow.hashCode +
      borderRadiusButton.hashCode +
      overlayOpacity.hashCode +
      font.hashCode +
      color.hashCode;

  @override
  String toString() => "$UsercentricsCustomization($hashCode)";
}

class CustomizationFont {
  const CustomizationFont({
    required this.family,
    required this.size,
  });

  final String family;
  final int? size;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomizationFont &&
          runtimeType == other.runtimeType &&
          family == other.family &&
          size == other.size;

  @override
  int get hashCode => family.hashCode + size.hashCode;

  @override
  String toString() => "$CustomizationFont(family: $family, size: $size)";
}

class CustomizationColor {
  const CustomizationColor({
    required this.primary,
    required this.acceptBtnText,
    required this.acceptBtnBackground,
    required this.denyBtnText,
    required this.denyBtnBackground,
    required this.saveBtnText,
    required this.saveBtnBackground,
    required this.linkIcon,
    required this.linkFont,
    required this.text,
    required this.layerBackground,
    required this.overlay,
    required this.toggleInactiveBackground,
    required this.toggleInactiveIcon,
    required this.toggleActiveBackground,
    required this.toggleActiveIcon,
    required this.toggleDisabledBackground,
    required this.toggleDisabledIcon,
    required this.secondLayerTab,
    required this.moreBtnBackground,
    required this.moreBtnText,
  });

  final String primary;
  final String acceptBtnText;
  final String acceptBtnBackground;
  final String denyBtnText;
  final String denyBtnBackground;
  final String saveBtnText;
  final String saveBtnBackground;
  final String linkIcon;
  final String linkFont;
  final String text;
  final String layerBackground;
  final String overlay;
  final String toggleInactiveBackground;
  final String toggleInactiveIcon;
  final String toggleActiveBackground;
  final String toggleActiveIcon;
  final String toggleDisabledBackground;
  final String toggleDisabledIcon;
  final String secondLayerTab;
  final String moreBtnBackground;
  final String moreBtnText;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomizationColor &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          acceptBtnText == other.acceptBtnText &&
          acceptBtnBackground == other.acceptBtnBackground &&
          denyBtnText == other.denyBtnText &&
          denyBtnBackground == other.denyBtnBackground &&
          saveBtnText == other.saveBtnText &&
          saveBtnBackground == other.saveBtnBackground &&
          linkIcon == other.linkIcon &&
          linkFont == other.linkFont &&
          text == other.text &&
          layerBackground == other.layerBackground &&
          overlay == other.overlay &&
          toggleInactiveBackground == other.toggleInactiveBackground &&
          toggleInactiveIcon == other.toggleInactiveIcon &&
          toggleActiveBackground == other.toggleActiveBackground &&
          toggleActiveIcon == other.toggleActiveIcon &&
          toggleDisabledBackground == other.toggleDisabledBackground &&
          toggleDisabledIcon == other.toggleDisabledIcon &&
          secondLayerTab == other.secondLayerTab &&
          moreBtnBackground == other.moreBtnBackground &&
          moreBtnText == other.moreBtnText;

  @override
  int get hashCode =>
      primary.hashCode +
      acceptBtnText.hashCode +
      acceptBtnBackground.hashCode +
      denyBtnText.hashCode +
      denyBtnBackground.hashCode +
      saveBtnText.hashCode +
      saveBtnBackground.hashCode +
      linkIcon.hashCode +
      linkFont.hashCode +
      text.hashCode +
      layerBackground.hashCode +
      overlay.hashCode +
      toggleInactiveBackground.hashCode +
      toggleInactiveIcon.hashCode +
      toggleActiveBackground.hashCode +
      toggleActiveIcon.hashCode +
      toggleDisabledBackground.hashCode +
      toggleDisabledIcon.hashCode +
      secondLayerTab.hashCode +
      moreBtnBackground.hashCode +
      moreBtnText.hashCode;

  @override
  String toString() => "$CustomizationColor($hashCode)";
}
