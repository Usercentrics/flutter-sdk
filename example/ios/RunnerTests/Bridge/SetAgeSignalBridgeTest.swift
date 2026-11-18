import Flutter
import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class SetAgeSignalBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "setAgeSignal"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsSDK!
    private var signalFactory: FakePublisherAgeSignalFactory!

    // What the Dart layer sends: every key is always there, the ones that a kind does not use are null.
    // The numbers are NSNumber, like the ones that the channel delivers.
    private let atLeastArguments: [String: Any] = [
        "kind": "atLeast",
        "age": NSNumber(value: 16),
        "lower": NSNull(),
        "upper": NSNull(),
        "sourceLabel": "my-age-gate",
    ]

    private let belowArguments: [String: Any] = [
        "kind": "below",
        "age": NSNumber(value: 16),
        "lower": NSNull(),
        "upper": NSNull(),
        "sourceLabel": NSNull(),
    ]

    private let betweenArguments: [String: Any] = [
        "kind": "between",
        "age": NSNull(),
        "lower": NSNumber(value: 13),
        "upper": NSNumber(value: 15),
        "sourceLabel": "my-age-gate",
    ]

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        signalFactory = FakePublisherAgeSignalFactory()
        bridge = SetAgeSignalBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics),
                                    signalFactory: signalFactory)
        super.setUp()
    }

    override func tearDown() {
        usercentrics = nil
        signalFactory = nil
        bridge = nil
    }

    func testName() {
        testNameProtocol()
    }

    func testInvokeWithAtLeast() {
        usercentrics.setAgeSignalDecision = decision(trust: .publisherProvided, band: .minor, ageLower: 16)

        let results = invoke(atLeastArguments)

        XCTAssertEqual(signalFactory.atLeastCalls, [AgeSignalCall(age: 16, sourceLabel: "my-age-gate")])
        XCTAssertTrue(signalFactory.belowCalls.isEmpty)
        XCTAssertTrue(signalFactory.betweenCalls.isEmpty)
        XCTAssertEqual(usercentrics.setAgeSignalCount, 1)
        XCTAssertTrue(usercentrics.setAgeSignalSignalArg === signalFactory.atLeastAnswer)
        assertResult(results, equals: [
            "source": "PUBLISHER_PROVIDED",
            "trust": "PUBLISHER_PROVIDED",
            "band": "MINOR",
            "ageLower": 16,
            "ageUpper": NSNull(),
            "unavailableReason": NSNull(),
        ])
    }

    func testInvokeWithBelowAndNoSourceLabel() {
        usercentrics.setAgeSignalDecision = decision(trust: .publisherProvided, band: .belowMinimum, ageUpper: 15)

        let results = invoke(belowArguments)

        XCTAssertEqual(signalFactory.belowCalls, [AgeSignalCall(age: 16, sourceLabel: nil)])
        XCTAssertTrue(signalFactory.atLeastCalls.isEmpty)
        XCTAssertTrue(signalFactory.betweenCalls.isEmpty)
        XCTAssertEqual(usercentrics.setAgeSignalCount, 1)
        XCTAssertTrue(usercentrics.setAgeSignalSignalArg === signalFactory.belowAnswer)
        assertResult(results, equals: [
            "source": "PUBLISHER_PROVIDED",
            "trust": "PUBLISHER_PROVIDED",
            "band": "BELOW_MINIMUM",
            "ageLower": NSNull(),
            "ageUpper": 15,
            "unavailableReason": NSNull(),
        ])
    }

    func testInvokeWithBetween() {
        usercentrics.setAgeSignalDecision = decision(trust: .publisherProvided,
                                                     band: .belowMinimum,
                                                     ageLower: 13,
                                                     ageUpper: 15)

        let results = invoke(betweenArguments)

        XCTAssertEqual(signalFactory.betweenCalls, [AgeRangeSignalCall(lower: 13, upper: 15, sourceLabel: "my-age-gate")])
        XCTAssertTrue(signalFactory.atLeastCalls.isEmpty)
        XCTAssertTrue(signalFactory.belowCalls.isEmpty)
        XCTAssertEqual(usercentrics.setAgeSignalCount, 1)
        XCTAssertTrue(usercentrics.setAgeSignalSignalArg === signalFactory.betweenAnswer)
        assertResult(results, equals: [
            "source": "PUBLISHER_PROVIDED",
            "trust": "PUBLISHER_PROVIDED",
            "band": "BELOW_MINIMUM",
            "ageLower": 13,
            "ageUpper": 15,
            "unavailableReason": NSNull(),
        ])
    }

    func testInvokeWithoutSignalAvailable() {
        usercentrics.setAgeSignalDecision = decision(source: .googlePlayAgeSignals, unavailableReason: .notShared)

        let results = invoke(atLeastArguments)

        // Nulls stay null (the keys are there), and no signal is a success, not an error
        assertResult(results, equals: [
            "source": "GOOGLE_PLAY_AGE_SIGNALS",
            "trust": NSNull(),
            "band": NSNull(),
            "ageLower": NSNull(),
            "ageUpper": NSNull(),
            "unavailableReason": "NOT_SHARED",
        ])
    }

    func testInvokeWithErrorOnUsercentrics() {
        let message = "Invalid age signal: an age is not between 0 and 120"
        usercentrics.setAgeSignalError = NSError(domain: "NSUsercentricsErrorDomain",
                                                 code: 0,
                                                 userInfo: [NSLocalizedDescriptionKey: message])

        let results = invoke(atLeastArguments)

        XCTAssertEqual(usercentrics.setAgeSignalCount, 1)
        XCTAssertEqual(results.count, 1)
        guard let error = results.first as? FlutterError else {
            XCTFail("The result is not a FlutterError")
            return
        }
        XCTAssertEqual(error.code, "usercentrics_flutter_setAgeSignal_error")
        XCTAssertEqual(error.message, message)
    }

    func testInvokeWithAPayloadTheDartLayerCannotProduce() {
        let payloads: [Any?] = [
            nil,
            "atLeast",
            [String: Any](),
            ["kind": "unknown", "age": 16],
            ["kind": NSNull(), "age": 16],
            ["kind": "atLeast"],
            ["kind": "atLeast", "age": "16"],
            ["kind": "atLeast", "age": 16.5],
            ["kind": "below", "age": NSNull()],
            ["kind": "between", "lower": 13],
            ["kind": "between", "upper": 15],
            ["kind": "atLeast", "age": 16, "sourceLabel": 1],
        ]

        for payload in payloads {
            let results = invoke(payload)

            // A fixed message, and the native SDK is never reached
            XCTAssertEqual(results.count, 1, "payload \(String(describing: payload))")
            guard let error = results.first as? FlutterError else {
                XCTFail("The result is not a FlutterError for payload \(String(describing: payload))")
                continue
            }
            XCTAssertEqual(error.code, "usercentrics_flutter_setAgeSignal_error")
            XCTAssertEqual(error.message, "Invalid Parameter")
            XCTAssertNil(error.details)
        }
        XCTAssertEqual(usercentrics.setAgeSignalCount, 0)
        XCTAssertTrue(signalFactory.atLeastCalls.isEmpty)
        XCTAssertTrue(signalFactory.belowCalls.isEmpty)
        XCTAssertTrue(signalFactory.betweenCalls.isEmpty)
    }

    func testInvokeWithAgeBeyondTheInt32RangeDoesNotWrapIntoAValidAge() {
        usercentrics.setAgeSignalDecision = decision(source: .googlePlayAgeSignals, unavailableReason: .notShared)

        // 2^32 + 16 would become 16 if it were truncated to an Int32: it has to reach the native SDK as an age that is far
        // out of range, for the native SDK to refuse it
        _ = invoke(["kind": "atLeast", "age": 4294967312, "lower": NSNull(), "upper": NSNull(), "sourceLabel": NSNull()])
        _ = invoke(["kind": "atLeast", "age": -4294967312, "lower": NSNull(), "upper": NSNull(), "sourceLabel": NSNull()])

        XCTAssertEqual(signalFactory.atLeastCalls, [
            AgeSignalCall(age: Int32.max, sourceLabel: nil),
            AgeSignalCall(age: Int32.min, sourceLabel: nil),
        ])
    }

    func testTheDecisionEnumsTravelByTheirNativeName() {
        // Written out on purpose: the Dart and the Android layers read these exact names, and a new or renamed native
        // value has to show up here
        XCTAssertEqual(
            UsercentricsAgeSignalSource.entries.compactMap { serialized(decision(source: $0), "source") },
            ["APPLE_DECLARED_AGE_RANGE", "GOOGLE_PLAY_AGE_SIGNALS", "PUBLISHER_PROVIDED"]
        )
        XCTAssertEqual(
            UsercentricsAgeSignalTrust.entries.compactMap { serialized(decision(trust: $0), "trust") },
            ["SELF_DECLARED", "GUARDIAN_DECLARED", "VERIFIED", "PUBLISHER_PROVIDED"]
        )
        XCTAssertEqual(
            UsercentricsAgeBand.entries.compactMap { serialized(decision(band: $0), "band") },
            ["BELOW_MINIMUM", "MINOR", "STANDARD"]
        )
        XCTAssertEqual(
            UsercentricsAgeSignalUnavailableReason.entries.compactMap { serialized(decision(unavailableReason: $0), "unavailableReason") },
            [
                "DECLINED",
                "NOT_SHARED",
                "VERIFICATION_REQUIRED",
                "UNSUPPORTED",
                "NOT_AVAILABLE",
                "INVALID_REQUEST",
                "TRANSIENT_ERROR",
                "TIMEOUT",
                "ERROR",
            ]
        )
    }

    // The fakes answer at once, so every result is there when invoke returns. The count shows that a result is sent
    // exactly once.
    private func invoke(_ arguments: Any?) -> [Any] {
        var results: [Any] = []
        let method = FakeFlutterMethodCall(methodName: bridgeName)
        method.argumentsMap = arguments
        bridge.invoke(method, { result in results.append(result ?? NSNull()) })
        return results
    }

    private func decision(source: UsercentricsAgeSignalSource = .publisherProvided,
                          trust: UsercentricsAgeSignalTrust? = nil,
                          band: UsercentricsAgeBand? = nil,
                          ageLower: Int32? = nil,
                          ageUpper: Int32? = nil,
                          unavailableReason: UsercentricsAgeSignalUnavailableReason? = nil) -> UsercentricsAgeSignalDecision {
        return UsercentricsAgeSignalDecision(source: source,
                                             trust: trust,
                                             band: band,
                                             ageLower: ageLower.map { KotlinInt(int: $0) },
                                             ageUpper: ageUpper.map { KotlinInt(int: $0) },
                                             unavailableReason: unavailableReason)
    }

    private func serialized(_ decision: UsercentricsAgeSignalDecision, _ key: String) -> String? {
        return (decision.serialize() as? [String: Any])?[key] as? String
    }

    private func assertResult(_ results: [Any],
                              equals expected: [String: Any],
                              file: StaticString = #filePath,
                              line: UInt = #line) {
        XCTAssertEqual(results.count, 1, file: file, line: line)
        guard let map = results.first as? [String: Any] else {
            XCTFail("The result is not a map", file: file, line: line)
            return
        }
        XCTAssertEqual(NSDictionary(dictionary: map), NSDictionary(dictionary: expected), file: file, line: line)
    }
}
