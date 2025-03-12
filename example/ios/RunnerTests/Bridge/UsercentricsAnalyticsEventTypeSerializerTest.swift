import XCTest
import Flutter

@testable import Usercentrics
@testable import usercentrics_sdk

class UsercentricsAnalyticsEventTypeSerializerTest: XCTestCase {

    func testInitialize() {
        XCTAssertEqual(UsercentricsAnalyticsEventType.acceptAllFirstLayer, UsercentricsAnalyticsEventType.initialize(from: "ACCEPT_ALL_FIRST_LAYER"))
    }

    func testInitializeUnknownKey() {
        XCTAssertEqual(nil, UsercentricsAnalyticsEventType.initialize(from: "SOME_KEY"))
    }

    func testInitializeItemsCount() {
        XCTAssertEqual(Int(UsercentricsAnalyticsEventType.values().size), usercentricsAnalyticsEventKeysAndValues.count)
    }
}
