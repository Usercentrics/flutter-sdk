import XCTest

@testable import Usercentrics
import Flutter
@testable import usercentrics_sdk

class GetCMPDataBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "getCMPData"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsSDK!

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = GetCMPDataBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics))
        super.setUp()
    }

    override func tearDown() {
        usercentrics = nil
        bridge = nil
    }

    func testName() {
        testNameProtocol()
    }

//    TODO
//    func testInvoke() {
//        usercentrics.getCMPDataAnswer =
//        let expectation =  XCTestExpectation(description: "resultCompletion")
//        let resultCompletion: FlutterResult = { result in
//            guard let result = result as? String else {
//                XCTFail()
//                return
//            }
//
//            XCTAssertEqual(1, self.usercentrics.getCMPDataCount)
//            XCTAssertEqual(result, )
//            expectation.fulfill()
//        }
//
//        bridge.invoke(FakeFlutterMethodCall(methodName: bridgeName), resultCompletion)
//        wait(for: [expectation], timeout: 2.0)
//    }
}
