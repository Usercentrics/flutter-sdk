/// The purpose list display style.
enum PurposeListStyle {
  /// The purposes are displayed inside individual boxed containers.
  boxed,

  /// The purposes are displayed as a flat list, without boxed containers.
  flat,
}

/// Programmatic customization options for the predefined Banner UI.
///
/// Every field is nullable. `null` means "inherit from the layer below"
/// (show-time > init-time > admin dashboard > SDK hardcoded default) — it
/// does not mean "reset to zero/empty/false".
@Deprecated(
    'BannerInitCustomization is deprecated and will be removed in a future release. Configure banner appearance via the Usercentrics dashboard instead.')
class BannerInitCustomization {
  /// Creates a BannerInitCustomization.
  const BannerInitCustomization({
    this.paddingTop,
    this.paddingBottom,
    this.paddingStart,
    this.paddingEnd,
    this.lineSpacingMultiplier,
    this.titleFontSize,
    this.bodyFontSize,
    this.linkFontSize,
    this.titleFontBold,
    this.headerPaddingTop,
    this.headerPaddingSides,
    this.headerPaddingBetweenElements,
    this.buttonBorderColor,
    this.buttonBorderWidth,
    this.purposeListStyle,
    this.stickyHeader,
    this.hideLanguageSwitcher,
    this.buttonHeightDp,
    this.buttonHorizontalPaddingDp,
    this.buttonSpacingDp,
    this.linkUnderline,
    this.showSecondLayerCloseButton,
    this.tabFontSize,
    this.tabActiveColor,
    this.denyAllButtonBackground,
    this.acceptAllButtonBackground,
    this.linkColor,
  });

  /// The top padding.
  final int? paddingTop;

  /// The bottom padding.
  final int? paddingBottom;

  /// The start padding.
  final int? paddingStart;

  /// The end padding.
  final int? paddingEnd;

  /// The line spacing multiplier.
  final double? lineSpacingMultiplier;

  /// The title font size.
  final int? titleFontSize;

  /// The body font size.
  final int? bodyFontSize;

  /// The link font size.
  final int? linkFontSize;

  /// Whether the title font is bold.
  final bool? titleFontBold;

  /// The header top padding.
  final int? headerPaddingTop;

  /// The header sides padding.
  final int? headerPaddingSides;

  /// The header padding between elements.
  final int? headerPaddingBetweenElements;

  /// The button border color, as a hex string, e.g. "#004dcf".
  final String? buttonBorderColor;

  /// The button border width.
  final int? buttonBorderWidth;

  /// The purpose list display style.
  final PurposeListStyle? purposeListStyle;

  /// Whether the header should stick to the top when scrolling.
  final bool? stickyHeader;

  /// Whether the language switcher should be hidden.
  final bool? hideLanguageSwitcher;

  /// The button height.
  final int? buttonHeightDp;

  /// The button horizontal padding.
  final int? buttonHorizontalPaddingDp;

  /// The spacing between buttons.
  final int? buttonSpacingDp;

  /// Whether links should be underlined.
  final bool? linkUnderline;

  /// Whether the second layer close button should be shown.
  final bool? showSecondLayerCloseButton;

  /// The tab font size.
  final int? tabFontSize;

  /// The tab active color, as a hex string.
  final String? tabActiveColor;

  /// The deny all button background color, as a hex string.
  final String? denyAllButtonBackground;

  /// The accept all button background color, as a hex string.
  final String? acceptAllButtonBackground;

  /// The link color, as a hex string.
  final String? linkColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerInitCustomization &&
          runtimeType == other.runtimeType &&
          paddingTop == other.paddingTop &&
          paddingBottom == other.paddingBottom &&
          paddingStart == other.paddingStart &&
          paddingEnd == other.paddingEnd &&
          lineSpacingMultiplier == other.lineSpacingMultiplier &&
          titleFontSize == other.titleFontSize &&
          bodyFontSize == other.bodyFontSize &&
          linkFontSize == other.linkFontSize &&
          titleFontBold == other.titleFontBold &&
          headerPaddingTop == other.headerPaddingTop &&
          headerPaddingSides == other.headerPaddingSides &&
          headerPaddingBetweenElements == other.headerPaddingBetweenElements &&
          buttonBorderColor == other.buttonBorderColor &&
          buttonBorderWidth == other.buttonBorderWidth &&
          purposeListStyle == other.purposeListStyle &&
          stickyHeader == other.stickyHeader &&
          hideLanguageSwitcher == other.hideLanguageSwitcher &&
          buttonHeightDp == other.buttonHeightDp &&
          buttonHorizontalPaddingDp == other.buttonHorizontalPaddingDp &&
          buttonSpacingDp == other.buttonSpacingDp &&
          linkUnderline == other.linkUnderline &&
          showSecondLayerCloseButton == other.showSecondLayerCloseButton &&
          tabFontSize == other.tabFontSize &&
          tabActiveColor == other.tabActiveColor &&
          denyAllButtonBackground == other.denyAllButtonBackground &&
          acceptAllButtonBackground == other.acceptAllButtonBackground &&
          linkColor == other.linkColor;

  @override
  int get hashCode =>
      paddingTop.hashCode ^
      paddingBottom.hashCode ^
      paddingStart.hashCode ^
      paddingEnd.hashCode ^
      lineSpacingMultiplier.hashCode ^
      titleFontSize.hashCode ^
      bodyFontSize.hashCode ^
      linkFontSize.hashCode ^
      titleFontBold.hashCode ^
      headerPaddingTop.hashCode ^
      headerPaddingSides.hashCode ^
      headerPaddingBetweenElements.hashCode ^
      buttonBorderColor.hashCode ^
      buttonBorderWidth.hashCode ^
      purposeListStyle.hashCode ^
      stickyHeader.hashCode ^
      hideLanguageSwitcher.hashCode ^
      buttonHeightDp.hashCode ^
      buttonHorizontalPaddingDp.hashCode ^
      buttonSpacingDp.hashCode ^
      linkUnderline.hashCode ^
      showSecondLayerCloseButton.hashCode ^
      tabFontSize.hashCode ^
      tabActiveColor.hashCode ^
      denyAllButtonBackground.hashCode ^
      acceptAllButtonBackground.hashCode ^
      linkColor.hashCode;

  @override
  String toString() =>
      'BannerInitCustomization(paddingTop: $paddingTop, paddingBottom: $paddingBottom, paddingStart: $paddingStart, paddingEnd: $paddingEnd, lineSpacingMultiplier: $lineSpacingMultiplier, titleFontSize: $titleFontSize, bodyFontSize: $bodyFontSize, linkFontSize: $linkFontSize, titleFontBold: $titleFontBold, headerPaddingTop: $headerPaddingTop, headerPaddingSides: $headerPaddingSides, headerPaddingBetweenElements: $headerPaddingBetweenElements, buttonBorderColor: $buttonBorderColor, buttonBorderWidth: $buttonBorderWidth, purposeListStyle: $purposeListStyle, stickyHeader: $stickyHeader, hideLanguageSwitcher: $hideLanguageSwitcher, buttonHeightDp: $buttonHeightDp, buttonHorizontalPaddingDp: $buttonHorizontalPaddingDp, buttonSpacingDp: $buttonSpacingDp, linkUnderline: $linkUnderline, showSecondLayerCloseButton: $showSecondLayerCloseButton, tabFontSize: $tabFontSize, tabActiveColor: $tabActiveColor, denyAllButtonBackground: $denyAllButtonBackground, acceptAllButtonBackground: $acceptAllButtonBackground, linkColor: $linkColor)';
}
