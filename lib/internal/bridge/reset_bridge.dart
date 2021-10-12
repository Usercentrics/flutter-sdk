import 'package:flutter/services.dart';

class ResetBridge {
  static const String _name = 'reset';

  static void invoke({required MethodChannel channel}) =>
      channel.invokeMethod(_name);
}
