import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class IsReadyBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "isReady"
    var bridge: MethodBridge!

    private let consent = UsercentricsServiceConsent(
        templateId: "ocv9HNX_g",
        status: false,
        type: .explicit_,
        dataProcessor: "Facebook SDK",
        version: "1.0.1"
    )

    private var usercentrics: FakeUsercentricsManager!

    override func setUp() {
        usercentrics = FakeUsercentricsManager()
        bridge = IsReadyBridge(usercentricsManager: usercentrics)
        super.setUp()
    }

    override func tearDown() {
        usercentrics = nil
        bridge = nil
    }

    func testName() {
        testNameProtocol()
    }

    func testInvokeWithOtherName() {
        testInvokeWithOtherNameProtocol()
    }

    func testInvoke() {
        usercentrics.readyStatus = UsercentricsReadyStatus(shouldShowCMP: false,
                                                           consents: [
                                                            consent
                                                           ])
        
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { [unowned self] result in
            guard
                let result = result as? [String: Any],
                let shouldShowCMP = result["shouldShowCMP"] as? Bool,
                let consentsMap = result["consents"] as? [[String: Any]],
                let consent = consentsMap.first
            else {
                XCTFail()
                return
            }

            XCTAssertEqual(shouldShowCMP, false)
            XCTAssertEqual(consent["version"] as! String, "1.0.1")
            XCTAssertEqual(consent["dataProcessor"] as! String, "Facebook SDK")
            XCTAssertEqual(consent["templateId"] as! String, "ocv9HNX_g")
            XCTAssertEqual(consent["type"] as! String, "EXPLICIT")
            XCTAssertEqual(consent["status"] as! Bool, false)

            XCTAssertEqual(self.usercentrics.isReadyCount, 1)
            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }

    func testInvokeWithError() {
        usercentrics.readyError = DataDeserializerError.invalidData
        
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { [unowned self] result in
            guard let result = result as? FlutterError else {
                XCTFail()
                return
            }
            XCTAssertEqual(result.code, "usercentrics_flutter_isReady_error")
            XCTAssertEqual(self.usercentrics.isReadyCount, 1)
            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
