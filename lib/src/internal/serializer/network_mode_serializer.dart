import 'package:usercentrics_sdk/src/model/network_mode.dart';

class NetworkModeSerializer {
  static dynamic serialize(NetworkMode? value) {
    if (value == null) return null;
    switch (value) {
      case NetworkMode.world:
        return 'WORLD';
      case NetworkMode.eu:
        return 'EU';
    }
  }
}
