import 'package:usercentrics_sdk/src/model/button_settings.dart';

/// The Second Layer Settings.
class SecondLayerStyleSettings {
  /// Creates a SecondLayerStyleSettings.
  const SecondLayerStyleSettings({
    this.showCloseButton,
    this.buttonLayout,
  });

  /// Show/hide the close button at the top-right corner of the Banner. If you are opening the Banner from your App's settings. We always recommend to enable a close button, so that users can easily dismiss the Banner. By default, close button is hidden.
  final bool? showCloseButton;

  /// The button layout.
  final ButtonLayout? buttonLayout;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecondLayerStyleSettings &&
          runtimeType == other.runtimeType &&
          showCloseButton == other.showCloseButton &&
          buttonLayout == other.buttonLayout;

  @override
  int get hashCode => showCloseButton.hashCode + buttonLayout.hashCode;

  @override
  String toString() =>
      "$SecondLayerStyleSettings(showCloseButton: $showCloseButton, buttonLayout: $buttonLayout)";
}
