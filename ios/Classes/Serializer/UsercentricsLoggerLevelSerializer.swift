import Usercentrics

struct UsercentricsLoggerLevelSerializer : DataDeserializer {

    typealias T = UsercentricsLoggerLevel?

    func deserialize(value: Any?) -> UsercentricsLoggerLevel? {
        let valueString = value as! String
        switch valueString {
        case "NONE":
            return UsercentricsLoggerLevel.none
        case "ERROR":
            return UsercentricsLoggerLevel.error
        case "WARNING":
            return UsercentricsLoggerLevel.warning
        case "DEBUG":
            return UsercentricsLoggerLevel.debug
        default:
            assert(false)
            return nil
        }

    }

}

