import 'package:usercentrics_sdk/usercentrics_sdk.dart';

// MSDK-4637: exercises the windowFullscreen backward-compat workaround
// (Android only) — see https://usercentrics.atlassian.net/browse/MSDK-4637
const bannerSettingsWindowFullscreenExample = BannerSettings(
  firstLayer: FirstLayerStyleSettings(
    layout: UsercentricsLayout.full,
  ),
  general: GeneralStyleSettings(
    windowFullscreen: true,
  ),
);
