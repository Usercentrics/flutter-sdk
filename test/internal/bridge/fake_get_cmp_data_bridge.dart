import 'package:flutter/src/services/platform_channel.dart';
import 'package:usercentrics_sdk/src/internal/bridge/get_cmp_data_bridge.dart';
import 'package:usercentrics_sdk/src/model/cmp_data.dart';

class FakeGetCMPDataBridge extends GetCMPDataBridge {
  FakeGetCMPDataBridge({
    this.invokeAnswer,
  });

  final UsercentricsCMPData? invokeAnswer;
  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<UsercentricsCMPData> invoke({
    required MethodChannel channel,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;
    return Future.value(invokeAnswer!);
  }
}
