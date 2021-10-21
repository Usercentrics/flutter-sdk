import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';

class FakeGetConsentsBridge extends GetConsentsBridge {
  FakeGetConsentsBridge({
    this.invokeAnswer,
  });

  final List<UsercentricsServiceConsent>? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<List<UsercentricsServiceConsent>> invoke({
    required MethodChannel channel,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
