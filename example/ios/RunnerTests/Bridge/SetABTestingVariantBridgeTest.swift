import XCTest
import Flutter

@testable import Usercentrics
@testable import usercentrics_sdk

class SetABTestingVariantBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "setABTestingVariant"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsSDK!

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = SetABTestingVariantBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics))
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
        let abTestingVariant = "ABC"
        usercentrics.getABTestingVariantAnswer = abTestingVariant
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
            if result != nil {
                XCTFail()
                return
            }

            XCTAssertEqual(1, self.usercentrics.setABTestingVariantCount)
            XCTAssertEqual(abTestingVariant, self.usercentrics.setABTestingVariantArgument)
            expectation.fulfill()
        }

        bridge.invoke(FakeFlutterMethodCall(methodName: bridgeName, argumentsMap: abTestingVariant), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
