import Foundation

@testable import Usercentrics
@testable import usercentrics_sdk

struct AgeSignalCall: Equatable {
    let age: Int32
    let sourceLabel: String?
}

struct AgeRangeSignalCall: Equatable {
    let lower: Int32
    let upper: Int32
    let sourceLabel: String?
}

final class FakePublisherAgeSignalFactory: PublisherAgeSignalFactory {

    // Real signals from the native factories, told apart by identity: a signal shows neither its ages nor its label
    let atLeastAnswer = UsercentricsPublisherAgeSignal.companion.atLeast(age: 16, sourceLabel: nil)
    let belowAnswer = UsercentricsPublisherAgeSignal.companion.below(age: 16, sourceLabel: nil)
    let betweenAnswer = UsercentricsPublisherAgeSignal.companion.between(lower: 13, upper: 15, sourceLabel: nil)

    var atLeastCalls: [AgeSignalCall] = []
    var belowCalls: [AgeSignalCall] = []
    var betweenCalls: [AgeRangeSignalCall] = []

    func atLeast(age: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal {
        atLeastCalls.append(AgeSignalCall(age: age, sourceLabel: sourceLabel))
        return atLeastAnswer
    }

    func below(age: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal {
        belowCalls.append(AgeSignalCall(age: age, sourceLabel: sourceLabel))
        return belowAnswer
    }

    func between(lower: Int32, upper: Int32, sourceLabel: String?) -> UsercentricsPublisherAgeSignal {
        betweenCalls.append(AgeRangeSignalCall(lower: lower, upper: upper, sourceLabel: sourceLabel))
        return betweenAnswer
    }
}
