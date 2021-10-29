import 'package:usercentrics_sdk/src/model/ccpa_data.dart';

class CCPADataSerializer {
  static CCPAData deserialize(dynamic value) {
    return CCPAData(
      version: value['version'],
      noticeGiven: value['noticeGiven'],
      optedOut: value['optedOut'],
      lspact: value['lspact'],
    );
  }
}
