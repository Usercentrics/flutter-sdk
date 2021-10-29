import 'package:flutter/services.dart';

abstract class ChangeLanguageBridge {
  const ChangeLanguageBridge();

  Future<void> invoke({
    required MethodChannel channel,
    required String language,
  });
}

class MethodChannelChangeLanguage extends ChangeLanguageBridge {
  const MethodChannelChangeLanguage();

  static const String _name = 'changeLanguage';

  @override
  Future<void> invoke({
    required MethodChannel channel,
    required String language,
  }) async {
    await channel.invokeMethod(
      _name,
      language,
    );
  }
}
