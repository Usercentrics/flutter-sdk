import 'package:usercentrics_sdk/src/model/gpp_data.dart';
import 'package:usercentrics_sdk/src/model/gpp_section_change_payload.dart';

class GppDataSerializer {
  static GppData deserialize(dynamic value) {
    final rawSections = value['sections'] as Map? ?? {};
    final sections = rawSections.map<String, Map<String, dynamic>>(
      (key, val) => MapEntry(
        key as String,
        (val as Map).cast<String, dynamic>(),
      ),
    );

    return GppData(
      gppString: value['gppString'] as String,
      applicableSections:
          (value['applicableSections'] as List).cast<int>(),
      sections: sections,
    );
  }

  static GppSectionChangePayload deserializePayload(dynamic value) {
    return GppSectionChangePayload(
      data: value['data'] as String,
    );
  }
}
