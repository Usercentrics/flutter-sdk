import UsercentricsUI

struct UsercentricsUserInteractionSerializer : DataSerializer {

    typealias T = UsercentricsUserInteraction

    func serialize(value: UsercentricsUserInteraction) -> Any {
        switch value {
        case .acceptAll:
            return "ACCEPT_ALL"
        case .denyAll:
            return "DENY_ALL"
        case .granular:
            return "GRANULAR"
        case .noInteraction:
            return "NO_INTERACTION"
        @unknown default:
            assert(false)
            return "NO_INTERACTION"
        }
    }
}
