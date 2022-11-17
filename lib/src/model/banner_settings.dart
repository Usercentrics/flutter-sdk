import 'package:usercentrics_sdk/src/model/first_layer_style_settings.dart';
import 'package:usercentrics_sdk/src/model/general_style_settings.dart';
import 'package:usercentrics_sdk/src/model/second_layer_style_settings.dart';

/// The Banner Settings.
class BannerSettings {
  /// Creates a BannerSettings.
  /// - The [variant] enables you to set the banner variant for A/B testing.
  /// - The [general] that enables you to style general style programmatically.
  /// - The [firstLayer] that enables you to style the first layer programmatically.
  /// - The [secondLayer] that enables you to style the second layer programmatically.
  const BannerSettings({
    this.variant,
    this.general,
    this.firstLayer,
    this.secondLayer,
  });

  /// The banner variant for A/B testing.
  final String? variant;

  /// The general style settings.
  final GeneralStyleSettings? general;

  /// The first layer style settings.
  final FirstLayerStyleSettings? firstLayer;

  /// The second layer style settings.
  final SecondLayerStyleSettings? secondLayer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerSettings &&
          runtimeType == other.runtimeType &&
          variant == other.variant &&
          general == other.general &&
          firstLayer == other.firstLayer &&
          secondLayer == other.secondLayer;

  @override
  int get hashCode =>
      variant.hashCode +
      general.hashCode +
      firstLayer.hashCode +
      secondLayer.hashCode;

  @override
  String toString() =>
      "$BannerSettings(variant: $variant, general: $general, firstLayer: $firstLayer, secondLayer: $secondLayer)";
}
