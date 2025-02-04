import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';

class FakeIsReadyBridge extends IsReadyBridge {
  FakeIsReadyBridge({this.invokeAnswer, this.shouldFailInitialization = false});

  final UsercentricsReadyStatus? invokeAnswer;
  final bool shouldFailInitialization;

  var invokeCount = 0;
  MethodChannel? invokeChannelArgument;

  @override
  Future<UsercentricsReadyStatus> invoke({
    required MethodChannel channel,
  }) {
    invokeCount++;
    invokeChannelArgument = channel;

    if (shouldFailInitialization) {
      throw PlatformException(
        code: 'usercentrics_flutter_isReady_error',
        message: 'Failed to initialize',
        details: 'Some failure details',
      );
    }

    return Future.value(invokeAnswer!);
  }
}
