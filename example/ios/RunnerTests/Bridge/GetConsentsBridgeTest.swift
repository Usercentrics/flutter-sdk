import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class GetConsentsBridgeTest: XCTestCase {

    private var bridge: GetConsentsBridge!
    private var usercentrics: FakeUsercentricsSDK!

    override func setUp() {
        usercentrics = FakeUsercentricsSDK()
        bridge = GetConsentsBridge(consentSerializer: ConsentSerializer(),
                                   usercentricsSDK: usercentrics)
        super.setUp()
    }

    override func tearDown() {
        bridge = nil
        usercentrics = nil
    }

    func testName() {
        XCTAssertEqual("getConsents", bridge.name)
    }

    func testInvokeWithOtherName() {
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in
            XCTAssertEqual(result as! NSObject, FlutterMethodNotImplemented)
            expectation.fulfill()
        }
        bridge.invoke(FakeFlutterMethodCall(methodName: "otherName"), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }

    func testInvoke() {
        let data = UsercentricsServiceConsent(templateId: "ABC",
                                              status: false,
                                              type: .explicit_,
                                              dataProcessor: "TheProcessor",
                                              version: "1.3.4")

        usercentrics.getConsentsData = [data]

        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in

            let expectedResult = [
                "templateId": data.templateId,
                "status": data.status,
                "type": data.type?.name as Any,
                "version": data.version,
                "dataProcessor": data.dataProcessor,
            ]


            let result = result as? [[String:Any]]
            XCTAssertNotNil(result)

            result!.first!.forEach { key, value in
                XCTAssertEqual(String(describing: expectedResult[key]!), String(describing: value))
            }

            expectation.fulfill()
        }

        bridge.invoke(FakeFlutterMethodCall(methodName: "getConsents"), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
