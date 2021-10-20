import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class RestoreUserSessionBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "restoreUserSession"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsSDK!

    private let consent = UsercentricsServiceConsent(
        templateId: "ocv9HNX_g",
        status: false,
        type: .explicit_,
        dataProcessor: "Facebook SDK",
        version: "1.0.1"
    )

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = RestoreUserSessionBridge(usercentricsManager: FakeUsercentricsManager(shared: usercentrics))
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
        usercentrics.restoreSuccess = .init(shouldShowCMP: false, consents: [consent])

        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
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

            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        method.argumentsMap = "abc"

        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }

    func testInvokeWithErrorOnParameters() {
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
            guard let result = result as? FlutterError else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(result.code, "usercentrics_flutter_restoreUserSession_error")
            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)

        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }

    func testInvokeWithErrorOnUsercentrics() {
        usercentrics.restoreError = DataDeserializerError.invalidData

        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
            guard let result = result as? FlutterError else {
                XCTFail()
                return
            }

            XCTAssertEqual(result.code, "usercentrics_flutter_restoreUserSession_error")
            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)

        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
