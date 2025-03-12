import Usercentrics
import Flutter

extension NetworkMode {
    static func initialize(from value: Any) -> NetworkMode? {
        let valueString = value as! String
        switch valueString {
        case "WORLD":
            return NetworkMode.world
        case "EU":
            return NetworkMode.eu
        default:
            assert(false)
            return nil
        }
    }
}
