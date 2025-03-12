import XCTest

@testable import Usercentrics
import Flutter
@testable import usercentrics_sdk

class TrackBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "track"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsProxy!
    private var usercentricsSdk: FakeUsercentricsSDK!

    override func setUp() {
        usercentricsSdk = FakeUsercentricsSDK()
        usercentrics = FakeUsercentricsProxy(shared: usercentricsSdk)
        bridge = TrackBridge(usercentrics: usercentrics)
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
            XCTAssertEqual(self.usercentricsSdk.trackCalls.count, 1)
            XCTAssertEqual(UsercentricsAnalyticsEventType.acceptAllFirstLayer, self.usercentricsSdk.trackCalls[0])
            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        method.argumentsMap = [
            "event": "ACCEPT_ALL_FIRST_LAYER",
        ]
        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
