import 'dart:ui';

import 'package:usercentrics_sdk/usercentrics_sdk.dart';

/// The General Style Settings.
class GeneralStyleSettings {
  /// Creates a GeneralStyleSettings.
  const GeneralStyleSettings({
    this.textColor,
    this.layerBackgroundColor,
    this.layerBackgroundSecondaryColor,
    this.linkColor,
    this.tabColor,
    this.bordersColor,
    this.toggleStyleSettings,
    this.font,
    this.logo,
    this.links,
    this.disableSystemBackButton,
  });

  /// The text color.
  final Color? textColor;

  /// The layer background color.
  final Color? layerBackgroundColor;

  /// The layer background secondary color.
  final Color? layerBackgroundSecondaryColor;

  /// The link color.
  final Color? linkColor;

  /// The tab color.
  final Color? tabColor;

  /// The borders color.
  final Color? bordersColor;

  /// The Toggle Settings.
  final ToggleStyleSettings? toggleStyleSettings;

  /// The font.
  final BannerFont? font;

  /// The logo.
  final BannerImage? logo;

  /// The Legal Links Settings.
  final LegalLinksSettings? links;

  final bool? disableSystemBackButton;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralStyleSettings &&
          runtimeType == other.runtimeType &&
          textColor == other.textColor &&
          layerBackgroundColor == other.layerBackgroundColor &&
          layerBackgroundSecondaryColor ==
              other.layerBackgroundSecondaryColor &&
          linkColor == other.linkColor &&
          tabColor == other.tabColor &&
          bordersColor == other.bordersColor &&
          toggleStyleSettings == other.toggleStyleSettings &&
          font == other.font &&
          logo == other.logo &&
          links == other.links &&
          disableSystemBackButton == other.disableSystemBackButton;

  @override
  int get hashCode =>
      textColor.hashCode ^
      layerBackgroundColor.hashCode ^
      layerBackgroundSecondaryColor.hashCode ^
      linkColor.hashCode ^
      tabColor.hashCode ^
      bordersColor.hashCode ^
      toggleStyleSettings.hashCode ^
      font.hashCode ^
      logo.hashCode ^
      links.hashCode ^
      disableSystemBackButton.hashCode;

  @override
  String toString() {
    return 'GeneralStyleSettings{textColor: $textColor, layerBackgroundColor: $layerBackgroundColor, layerBackgroundSecondaryColor: $layerBackgroundSecondaryColor, linkColor: $linkColor, tabColor: $tabColor, bordersColor: $bordersColor, toggleStyleSettings: $toggleStyleSettings, font: $font, logo: $logo, links: $links, disableSystemBackButton: $disableSystemBackButton}';
  }
}

class ToggleStyleSettings {
  /// Creates a ToggleStyleSettings.
  const ToggleStyleSettings({
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.disabledThumbColor,
  });

  /// The active background color.
  final Color? activeBackgroundColor;

  /// The inactive background color.
  final Color? inactiveBackgroundColor;

  /// The disabled background color.
  final Color? disabledBackgroundColor;

  /// The active thumb color.
  final Color? activeThumbColor;

  /// The inactive thumb color.
  final Color? inactiveThumbColor;

  /// The disabled thumb color.
  final Color? disabledThumbColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToggleStyleSettings &&
          runtimeType == other.runtimeType &&
          activeBackgroundColor == other.activeBackgroundColor &&
          inactiveBackgroundColor == other.inactiveBackgroundColor &&
          disabledBackgroundColor == other.disabledBackgroundColor &&
          activeThumbColor == other.activeThumbColor &&
          inactiveThumbColor == other.inactiveThumbColor &&
          disabledThumbColor == other.disabledThumbColor;

  @override
  int get hashCode =>
      activeBackgroundColor.hashCode ^
      inactiveBackgroundColor.hashCode ^
      disabledBackgroundColor.hashCode ^
      activeThumbColor.hashCode ^
      inactiveThumbColor.hashCode ^
      disabledThumbColor.hashCode;

  @override
  String toString() {
    return 'ToggleStyleSettings{activeBackgroundColor: $activeBackgroundColor, inactiveBackgroundColor: $inactiveBackgroundColor, disabledBackgroundColor: $disabledBackgroundColor, activeThumbColor: $activeThumbColor, inactiveThumbColor: $inactiveThumbColor, disabledThumbColor: $disabledThumbColor}';
  }
}
