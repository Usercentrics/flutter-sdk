import Foundation
import Usercentrics

extension UsercentricsPublisherAgeSignal {

    // nil for a payload that the Dart layer cannot produce (an unknown kind, a missing or mistyped field). Whether the
    // ages and the label are acceptable is for the native SDK to decide: nothing is checked here, and nothing here
    // prints what was sent.
    static func initialize(from value: Any?, using factory: PublisherAgeSignalFactory) -> UsercentricsPublisherAgeSignal? {
        guard let dict = value as? [String: Any] else { return nil }

        let sourceLabel: String?
        switch dict["sourceLabel"] {
        case nil, is NSNull:
            sourceLabel = nil
        case let label as String:
            sourceLabel = label
        default:
            return nil
        }

        switch dict["kind"] as? String {
        case "atLeast":
            guard let age = int32(dict["age"]) else { return nil }
            return factory.atLeast(age: age, sourceLabel: sourceLabel)
        case "below":
            guard let age = int32(dict["age"]) else { return nil }
            return factory.below(age: age, sourceLabel: sourceLabel)
        case "between":
            guard let lower = int32(dict["lower"]), let upper = int32(dict["upper"]) else { return nil }
            return factory.between(lower: lower, upper: upper, sourceLabel: sourceLabel)
        default:
            return nil
        }
    }
}

// A Dart int has 64 bits. One outside the Int32 range is clamped instead of truncated, so an age that is far out of
// range stays out of range (the native SDK refuses it) and does not wrap into an age that is valid.
private func int32(_ value: Any?) -> Int32? {
    guard let value = value as? Int else { return nil }
    return Int32(clamping: value)
}
