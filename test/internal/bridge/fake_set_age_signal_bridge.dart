import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/age_signal_decision.dart';
import 'package:usercentrics_sdk/src/model/publisher_age_signal.dart';

class FakeSetAgeSignalBridge extends SetAgeSignalBridge {
  FakeSetAgeSignalBridge({
    this.invokeAnswer,
  });

  final UsercentricsAgeSignalDecision? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;
  UsercentricsPublisherAgeSignal? invokeSignalArgument;

  @override
  Future<UsercentricsAgeSignalDecision> invoke({
    required MethodChannel channel,
    required UsercentricsPublisherAgeSignal signal,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
    invokeSignalArgument = signal;
    return Future.value(invokeAnswer!);
  }
}
