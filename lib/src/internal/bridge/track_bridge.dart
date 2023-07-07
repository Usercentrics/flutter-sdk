import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/analytics_event_type_serializer.dart';
import 'package:usercentrics_sdk/src/model/analytics_event_type.dart';

abstract class TrackBridge {
  const TrackBridge();

  Future<void> invoke({
    required MethodChannel channel,
    required UsercentricsAnalyticsEventType event,
  });
}

class MethodChannelTrack extends TrackBridge {
  const MethodChannelTrack();

  static const String _name = 'track';

  @override
  Future<void> invoke({
    required MethodChannel channel,
    required UsercentricsAnalyticsEventType event,
  }) async {
    await channel.invokeMethod(_name, {'event': AnalyticsEventTypeSerializer.serialize(event)});
  }
}
