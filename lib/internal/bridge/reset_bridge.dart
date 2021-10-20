import 'package:flutter/services.dart';

abstract class ResetBridge {
  const ResetBridge();

  void invoke({required MethodChannel channel});
}

class MethodChannelReset extends ResetBridge {
  const MethodChannelReset();

  static const String _name = 'reset';

  @override
  void invoke({required MethodChannel channel}) => channel.invokeMethod(_name);
}
