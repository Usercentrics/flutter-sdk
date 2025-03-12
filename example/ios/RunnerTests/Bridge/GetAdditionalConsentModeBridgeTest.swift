import XCTest
import Flutter

@testable import Usercentrics
@testable import usercentrics_sdk

class GetAdditionalConsentModeBridgeTest: XCTestCase, BaseBridgeTestProtocol {
    
    var bridgeName: String! = "getAdditionalConsentModeData"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsSDK!

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = GetAdditionalConsentModeBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics))
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
        let additionalConsentModeData = AdditionalConsentModeData(
            acString: "2~1.2.3~dv.4.5",
            adTechProviders: [
                AdTechProvider(
                    id: 1, name: "atp1", privacyPolicyUrl: "www.atp1.com", consent: true
                ),
                AdTechProvider(
                    id: 2, name: "atp2", privacyPolicyUrl: "www.atp2.com", consent: true
                ),
                AdTechProvider(
                    id: 3, name: "atp3", privacyPolicyUrl: "www.atp3.com", consent: true
                ),
                AdTechProvider(
                    id: 4, name: "atp4", privacyPolicyUrl: "www.atp4.com", consent: false
                ),
                AdTechProvider(
                    id: 5, name: "atp5", privacyPolicyUrl: "www.atp5.com", consent: false
                )
            ]
        )
        
        usercentrics.getAdditionalConsentModeAnswer = additionalConsentModeData
        
        let expectation = XCTestExpectation(description: "resultCompletion")
        
        let resultCompletion: FlutterResult = { result in
            guard
                let result = result as? [String: Any],
                let atps = result["adTechProviders"] as? [[String: Any]]
            else {
                XCTFail()
                return
            }
            
            let resultAcString = result["acString"] as? String
            
            XCTAssertEqual(1, self.usercentrics.getAdditionalConsentModeCount)
            XCTAssertEqual(resultAcString, additionalConsentModeData.acString)
            XCTAssertEqual(atps.count, additionalConsentModeData.adTechProviders.count)
            expectation.fulfill()
        }

        bridge.invoke(FakeFlutterMethodCall(methodName: bridgeName), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
