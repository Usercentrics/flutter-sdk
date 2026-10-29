import 'package:usercentrics_sdk/src/model/second_layer_tab.dart';

class SecondLayerTabSerializer {
  static dynamic serialize(SecondLayerTab? value) {
    if (value == null) return null;
    switch (value) {
      case SecondLayerTab.services:
        return 'SERVICES';
      case SecondLayerTab.partners:
        return 'PARTNERS';
    }
  }
}
