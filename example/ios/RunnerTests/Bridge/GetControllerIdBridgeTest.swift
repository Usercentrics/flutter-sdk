import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class GetControllerIdBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "getControllerId"
    var bridge: MethodBridge!
    
    private var usercentrics: FakeUsercentricsSDK!

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = GetControllerIdBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics))
        super.setUp()
    }

    override func tearDown() {
        bridge = nil
        usercentrics = nil
    }

    func testName() {
        testNameProtocol()
    }

    func testInvoke() {
        usercentrics.getControllerIdData = "abc"
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
            guard let result = result as? String else {
                XCTFail()
                return
            }

            XCTAssertEqual(result, "abc")
            expectation.fulfill()
        }

        bridge.invoke(FakeFlutterMethodCall(methodName: bridgeName), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
