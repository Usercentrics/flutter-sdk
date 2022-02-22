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
        history: [],
        type: .explicit_,
        dataProcessor: "Facebook SDK",
        version: "1.0.1",
        isEssential: true
    )

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = RestoreUserSessionBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics))
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
        usercentrics.restoreUSSuccess = .init(shouldCollectConsent: false, consents: [consent])

        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
            guard
                let result = result as? [String: Any],
                let shouldCollectConsent = result["shouldCollectConsent"] as? Bool,
                let consentsMap = result["consents"] as? [[String: Any]],
                let consent = consentsMap.first
            else {
                XCTFail()
                return
            }

            XCTAssertEqual(shouldCollectConsent, false)
            XCTAssertEqual(consentsMap.count, 1)
            XCTAssertEqual(consent["version"] as! String, "1.0.1")
            XCTAssertEqual(consent["dataProcessor"] as! String, "Facebook SDK")
            XCTAssertEqual(consent["templateId"] as! String, "ocv9HNX_g")
            let historyMap = consent["history"] as? [[String: Any]]
            XCTAssertEqual(historyMap?.isEmpty, true)
            XCTAssertEqual(consent["type"] as! String, "EXPLICIT")
            XCTAssertEqual(consent["status"] as! Bool, false)
            XCTAssertEqual(consent["isEssential"] as! Bool, true)

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
        usercentrics.restoreUSError = UsercentricsFakeError()

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
