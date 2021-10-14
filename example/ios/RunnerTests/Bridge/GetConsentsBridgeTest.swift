import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class GetConsentsBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    private var usercentrics: FakeUsercentricsSDK!
    var bridgeName: String!
    var bridge: MethodBridge!


    override func setUp() {
        bridgeName = "getConsents"

        usercentrics = FakeUsercentricsSDK()
        bridge = GetConsentsBridge(usercentricsSDK: usercentrics)

        super.setUp()
    }

    override func tearDown() {
        bridge = nil
        usercentrics = nil
    }

    func testName() {
        testNameProtocol()
    }

    func testInvokeWithOtherName() {
        testInvokeWithOtherNameProtocol()
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
            guard
                let result = result as? [[String: Any]],
                let firstResultElement = result.first,
                !firstResultElement.isEmpty
            else {
                XCTFail()
                return
            }

            let expectedResult = [
                "templateId": data.templateId,
                "status": data.status,
                "type": data.type?.name as Any,
                "version": data.version,
                "dataProcessor": data.dataProcessor,
            ]

            firstResultElement.forEach { key, value in
                guard let element = expectedResult[key] else {
                    XCTFail()
                    return
                }

                XCTAssertEqual(String(describing: element), String(describing: value))
            }

            expectation.fulfill()
        }

        bridge.invoke(FakeFlutterMethodCall(methodName: bridgeName), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
