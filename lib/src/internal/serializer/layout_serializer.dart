import 'package:usercentrics_sdk/src/model/layout.dart';

class LayoutSerializer {
  static dynamic serialize(UsercentricsLayout? value) {
    switch (value) {
      case UsercentricsLayout.full:
        return 'FULL';
      case UsercentricsLayout.sheet:
        return 'SHEET';
      case UsercentricsLayout.popupBottom:
        return 'POPUP_BOTTOM';
      case UsercentricsLayout.popupCenter:
        return 'POPUP_CENTER';
      case null:
        return null;
    }
  }
}
