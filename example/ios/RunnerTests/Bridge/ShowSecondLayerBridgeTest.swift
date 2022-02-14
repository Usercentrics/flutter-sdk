import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk
import UsercentricsUI

class ShowSecondLayerBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "showSecondLayer"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsProxy!
    private var bannerProxy: FakeUsercentricsBannerProxy!

    override func setUp() {
        usercentrics = FakeUsercentricsProxy()
        bannerProxy = FakeUsercentricsBannerProxy()
        bridge = ShowSecondLayerBridge(assetProvider: FakeFlutterAssetProvider(),
                                       bannerProxy: bannerProxy)
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
        let consent = UsercentricsServiceConsent(templateId: "ABC",
                                                 status: false,
                                                 history: [],
                                                 type: .explicit_,
                                                 dataProcessor: "TheProcessor",
                                                 version: "1.3.4",
                                                 isEssential: true)
        bannerProxy.showSecondLayerAnswer = UsercentricsConsentUserResponse(consents: [consent],
                                                                            controllerId: "controllerIdABC",
                                                                            userInteraction: .acceptAll)

        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in

            guard
                let result = result as? [String: Any],
                let controllerId = result["controllerId"] as? String,
                let userInteraction = result["userInteraction"] as? String,
                let consentsMap = result["consents"] as? [[String: Any]],
                let consent = consentsMap.first
            else {
                XCTFail()
                return
            }

            XCTAssertEqual(controllerId, "controllerIdABC")
            XCTAssertEqual(userInteraction, "ACCEPT_ALL")
            XCTAssertEqual(consentsMap.count, 1)
            XCTAssertEqual(consent["version"] as! String, "1.3.4")
            XCTAssertEqual(consent["dataProcessor"] as! String, "TheProcessor")
            XCTAssertEqual(consent["templateId"] as! String, "ABC")
            let historyMap = consent["history"] as? [[String: Any]]
            XCTAssertEqual(historyMap?.isEmpty, true)
            XCTAssertEqual(consent["type"] as! String, "EXPLICIT")
            XCTAssertEqual(consent["status"] as! Bool, false)
            XCTAssertEqual(consent["isEssential"] as! Bool, true)

            XCTAssertEqual(self.bannerProxy.showSecondLayerCount, 1)
            XCTAssertEqual(self.bannerProxy.showSecondLayerCloseButtonArg, true)
            XCTAssertNil(self.bannerProxy.showSecondLayerBannerSettingsArg)

            expectation.fulfill()
        }

        let call = FakeFlutterMethodCall(methodName: bridgeName)
        call.argumentsMap = [
            "bannerSettings": nil,
            "showCloseButton": true,
        ]
        bridge.invoke(call, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
