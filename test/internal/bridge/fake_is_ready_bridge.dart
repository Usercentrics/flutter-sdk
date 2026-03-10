import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';

class FakeIsReadyBridge extends IsReadyBridge {
  FakeIsReadyBridge({
    this.invokeAnswer,
    this.shouldFailInitialization = false,
    this.failFirstNTimes = 0,
  });

  final UsercentricsReadyStatus? invokeAnswer;
  final bool shouldFailInitialization;
  final int failFirstNTimes;

  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;

    if (shouldFailInitialization || invokeCount <= failFirstNTimes) {
      throw PlatformException(
        code: 'usercentrics_flutter_isReady_error',
        message: 'Failed to initialize',
        details: 'Some failure details',
      );
    }

    return Future.value(invokeAnswer!);
  }
}
