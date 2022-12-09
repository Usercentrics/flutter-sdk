import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class GetABTestingVariantBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "getABTestingVariant"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsSDK!

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = GetABTestingVariantBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics))
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
            guard let result = result as? String else {
                XCTFail()
                return
            }

            XCTAssertEqual(1, self.usercentrics.getABTestingVariantCount)
            XCTAssertEqual(result, abTestingVariant)
            expectation.fulfill()
        }

        bridge.invoke(FakeFlutterMethodCall(methodName: bridgeName), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
