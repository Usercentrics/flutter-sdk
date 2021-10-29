import Usercentrics

extension UsercentricsConsentType {
    static func initialize(from value: Any?) -> UsercentricsConsentType? {
        let valueString = value as! String
        switch valueString {
        case "EXPLICIT":
            return UsercentricsConsentType.explicit_
        case "IMPLICIT":
            return UsercentricsConsentType.implicit
        default:
            assert(false)
            return nil
        }
    }
}
