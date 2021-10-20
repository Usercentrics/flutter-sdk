import Foundation
import XCTest

@testable import usercentrics_sdk

protocol BaseBridgeTestProtocol: XCTestCase {
    var bridgeName: String! { get }
    var bridge: MethodBridge! { get }
}

extension BaseBridgeTestProtocol {
    func testNameProtocol() {
        XCTAssertEqual(bridgeName, bridge.name)
    }
}
