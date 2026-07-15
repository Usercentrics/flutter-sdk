import 'package:usercentrics_sdk/src/model/banner_init_customization.dart';

class BannerInitCustomizationSerializer {
  // ignore: deprecated_member_use_from_same_package
  static dynamic serialize(BannerInitCustomization? value) => value == null
      ? null
      : {
          'paddingTop': value.paddingTop,
          'paddingBottom': value.paddingBottom,
          'paddingStart': value.paddingStart,
          'paddingEnd': value.paddingEnd,
          'lineSpacingMultiplier': value.lineSpacingMultiplier,
          'titleFontSize': value.titleFontSize,
          'bodyFontSize': value.bodyFontSize,
          'linkFontSize': value.linkFontSize,
          'titleFontBold': value.titleFontBold,
          'headerPaddingTop': value.headerPaddingTop,
          'headerPaddingSides': value.headerPaddingSides,
          'headerPaddingBetweenElements': value.headerPaddingBetweenElements,
          'buttonBorderColor': value.buttonBorderColor,
          'buttonBorderWidth': value.buttonBorderWidth,
          'purposeListStyle': _serializePurposeListStyle(
            value.purposeListStyle,
          ),
          'stickyHeader': value.stickyHeader,
          'hideLanguageSwitcher': value.hideLanguageSwitcher,
          'buttonHeightDp': value.buttonHeightDp,
          'buttonHorizontalPaddingDp': value.buttonHorizontalPaddingDp,
          'buttonSpacingDp': value.buttonSpacingDp,
          'linkUnderline': value.linkUnderline,
          'showSecondLayerCloseButton': value.showSecondLayerCloseButton,
          'tabFontSize': value.tabFontSize,
          'tabActiveColor': value.tabActiveColor,
          'denyAllButtonBackground': value.denyAllButtonBackground,
          'acceptAllButtonBackground': value.acceptAllButtonBackground,
          'linkColor': value.linkColor,
        };

  static dynamic _serializePurposeListStyle(PurposeListStyle? value) {
    switch (value) {
      case null:
        return null;
      case PurposeListStyle.boxed:
        return 'BOXED';
      case PurposeListStyle.flat:
        return 'FLAT';
    }
  }
}
