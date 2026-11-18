import Usercentrics

// The native factories of a publisher age signal, behind a protocol. A signal shows neither its ages nor its label,
// so the bridge tests check what was asked of the factory.
protocol PublisherAgeSignalFactory {
    func atLeast(age: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal
    func below(age: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal
    func between(lower: Int32, upper: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal
}

struct NativePublisherAgeSignalFactory: PublisherAgeSignalFactory {

    func atLeast(age: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal {
        return UsercentricsPublisherAgeSignal.companion.atLeast(age: age, sourceLabel: sourceLabel)
    }

    func below(age: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal {
        return UsercentricsPublisherAgeSignal.companion.below(age: age, sourceLabel: sourceLabel)
    }

    func between(lower: Int32, upper: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal {
        return UsercentricsPublisherAgeSignal.companion.between(lower: lower, upper: upper, sourceLabel: sourceLabel)
    }
}
