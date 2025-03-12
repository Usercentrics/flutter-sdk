import Usercentrics
import Flutter

extension TCFDecisionUILayer {
    static func initialize(from value: Any?) -> TCFDecisionUILayer? {
        let valueString = value as! String
        switch valueString {
        case "FIRST_LAYER":
            return TCFDecisionUILayer.firstLayer
        case "SECOND_LAYER":
            return TCFDecisionUILayer.secondLayer
        default:
            assert(false)
            return nil
        }
    }
}
