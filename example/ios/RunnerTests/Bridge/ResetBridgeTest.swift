import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class ResetBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "reset"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsManager!

    override func setUp() {
        usercentrics = FakeUsercentricsManager()
        bridge = ResetBridge(usercentricsManager: usercentrics)
        super.setUp()
    }

    override func tearDown() {
        usercentrics = nil
        bridge = nil
    }

    func testName() {
        testNameProtocol()
    }

    func testInvoke() {
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { [unowned self] result in
            XCTAssertNil(result)
            XCTAssertEqual(self.usercentrics.resetCount, 1)
            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
