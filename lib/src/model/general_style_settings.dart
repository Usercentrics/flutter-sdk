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
    this.windowFullscreen,
    this.landscapeLayout,
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

  /// Android-only. Backward-compat workaround for publishers who relied on the
  /// legacy fullscreen dialog behavior prior to the edge-to-edge fix. Has no
  /// effect on iOS.
  final bool? windowFullscreen;

  /// Experimental. Opt-in to the two-panel landscape layout of the first and
  /// second layer, intended for landscape-only experiences such as games. Off
  /// by default. The shape of this setting may change in a later release.
  final LandscapeLayoutSettings? landscapeLayout;

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
          disableSystemBackButton == other.disableSystemBackButton &&
          windowFullscreen == other.windowFullscreen &&
          landscapeLayout == other.landscapeLayout;

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
      disableSystemBackButton.hashCode ^
      windowFullscreen.hashCode ^
      landscapeLayout.hashCode;

  @override
  String toString() {
    return 'GeneralStyleSettings{textColor: $textColor, layerBackgroundColor: $layerBackgroundColor, layerBackgroundSecondaryColor: $layerBackgroundSecondaryColor, linkColor: $linkColor, tabColor: $tabColor, bordersColor: $bordersColor, toggleStyleSettings: $toggleStyleSettings, font: $font, logo: $logo, links: $links, disableSystemBackButton: $disableSystemBackButton, windowFullscreen: $windowFullscreen, landscapeLayout: $landscapeLayout}';
  }
}

/// Experimental. Settings of the two-panel landscape layout.
///
/// The landscape layout is used only when the screen is wider than it is tall
/// and at least about 700 x 300 dp/pt. In every other case, including portrait,
/// small screens and very large text, the standard layout is used. If the
/// device is rotated while the banner is showing and the host handles the
/// rotation itself, the banner switches layout to match.
class LandscapeLayoutSettings {
  /// Creates a LandscapeLayoutSettings.
  const LandscapeLayoutSettings({this.enabled = false});

  /// Whether the landscape layout is enabled. Defaults to `false`.
  final bool enabled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LandscapeLayoutSettings &&
          runtimeType == other.runtimeType &&
          enabled == other.enabled;

  @override
  int get hashCode => enabled.hashCode;

  @override
  String toString() {
    return 'LandscapeLayoutSettings{enabled: $enabled}';
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
