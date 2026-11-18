import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/serializer/age_signal_decision_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/publisher_age_signal_serializer.dart';
import 'package:usercentrics_sdk/src/model/age_signal_decision.dart';
import 'package:usercentrics_sdk/src/model/publisher_age_signal.dart';

abstract class SetAgeSignalBridge {
  const SetAgeSignalBridge();

  Future<UsercentricsAgeSignalDecision> invoke({
    required MethodChannel channel,
    required UsercentricsPublisherAgeSignal signal,
  });
}

class MethodChannelSetAgeSignal extends SetAgeSignalBridge {
  const MethodChannelSetAgeSignal();

  static const String _name = 'setAgeSignal';

  // The signal and the decision only pass through: neither is logged or kept. A range that
  // the native SDK refuses reaches the caller as the PlatformException of the channel.
  @override
  Future<UsercentricsAgeSignalDecision> invoke({
    required MethodChannel channel,
    required UsercentricsPublisherAgeSignal signal,
  }) async {
    final result = await channel.invokeMethod(
      _name,
      PublisherAgeSignalSerializer.serialize(signal),
    );
    return AgeSignalDecisionSerializer.deserialize(result);
  }
}
