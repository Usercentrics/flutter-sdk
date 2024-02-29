import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class IsReadyBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "isReady"
    var bridge: MethodBridge!

    private let consent = UsercentricsServiceConsent(
        templateId: "ocv9HNX_g",
        status: false,
        history: [],
        type: .explicit_,
        dataProcessor: "Facebook SDK",
        version: "1.0.1",
        isEssential: true
    )

    private var usercentrics: FakeUsercentricsProxy!

    override func setUp() {
        usercentrics = FakeUsercentricsProxy()
        bridge = IsReadyBridge(usercentrics: usercentrics)
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
        usercentrics.readyStatus = UsercentricsReadyStatus(shouldCollectConsent: false,
                                                           consents: [consent],
                                                           geolocationRuleset: GeolocationRuleset(activeSettingsId: "settingsId", bannerRequiredAtLocation: true),
                                                           location: UsercentricsLocation(countryCode: "PT", regionCode: "PT11"))
        
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { [unowned self] result in
            guard
                let result = result as? [String: Any],
                let shouldCollectConsent = result["shouldCollectConsent"] as? Bool,
                let consentsMap = result["consents"] as? [[String: Any]],
                let geolocationRulesetMap = result["geolocationRuleset"] as? NSDictionary,
                let locationMap = result["location"] as? NSDictionary,
                let consent = consentsMap.first
            else {
                XCTFail()
                return
            }

            XCTAssertEqual(shouldCollectConsent, false)

            XCTAssertEqual("settingsId", geolocationRulesetMap["activeSettingsId"] as! String)
            XCTAssertEqual(true, geolocationRulesetMap["bannerRequiredAtLocation"] as! Bool)

            XCTAssertEqual("PT", locationMap["countryCode"] as! String)
            XCTAssertEqual("PT11", locationMap["regionCode"] as! String)

            XCTAssertEqual(consentsMap.count, 1)
            XCTAssertEqual(consent["version"] as! String, "1.0.1")
            XCTAssertEqual(consent["dataProcessor"] as! String, "Facebook SDK")
            XCTAssertEqual(consent["templateId"] as! String, "ocv9HNX_g")
            let historyMap = consent["history"] as? [[String: Any]]
            XCTAssertEqual(historyMap?.isEmpty, true)
            XCTAssertEqual(consent["type"] as! String, "EXPLICIT")
            XCTAssertEqual(consent["status"] as! Bool, false)
            XCTAssertEqual(consent["isEssential"] as! Bool, true)

            XCTAssertEqual(self.usercentrics.isReadyCount, 1)
            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }

    func testInvokeWithError() {
        usercentrics.readyError = UsercentricsFakeError()
        
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
