import 'package:usercentrics_sdk/src/model/tcf_decision_ui_layer.dart';

class TCFDecisionUILayerSerializer {
  static dynamic serialize(TCFDecisionUILayer value) {
    switch (value) {
      case TCFDecisionUILayer.firstLayer:
        return 'FIRST_LAYER';
      case TCFDecisionUILayer.secondLayer:
        return 'SECOND_LAYER';
    }
  }
}
