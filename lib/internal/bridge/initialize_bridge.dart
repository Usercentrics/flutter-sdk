/// {@nodoc}
library initialize_bridge;

import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/internal/serializer/initialize_options_serializer.dart';
import 'package:usercentrics_sdk/model/logger_level.dart';

abstract class InitializeBridge {
  const InitializeBridge();

  void invoke({
    required MethodChannel channel,
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  });
}

class MethodChannelInitialize extends InitializeBridge {
  const MethodChannelInitialize();

  static const String _name = 'initialize';

  @override
  void invoke({
    required MethodChannel channel,
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) {
    final arguments = InitializeOptionsSerializer.serialize(
      settingsId: settingsId,
      defaultLanguage: defaultLanguage,
      loggerLevel: loggerLevel,
      timeoutMillis: timeoutMillis,
      version: version,
    );
    channel.invokeMethod(_name, arguments);
  }
}
