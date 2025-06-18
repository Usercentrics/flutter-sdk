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
        bridge = GetConsentsBridge(usercentrics: FakeUsercentricsProxy(shared: usercentrics))

        super.setUp()
    }

    override func tearDown() {
        bridge = nil
        usercentrics = nil
    }

    func testName() {
        testNameProtocol()
    }

    func testInvoke() {
        let data = UsercentricsServiceConsent(templateId: "ABC",
                                              status: false,
                                              history: [
                                                UsercentricsConsentHistoryEntry(status: true, type: .explicit_, timestampInMillis: 123)
                                              ],
                                              type: .explicit_,
                                              dataProcessor: "TheProcessor",
                                              version: "1.3.4",
                                              isEssential: true,
                                              category: "essential")

        usercentrics.getConsentsData = [data]

        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { result in

            guard
                let consentsMap = result as? [[String: Any]],
                let consent = consentsMap.first
            else {
                XCTFail()
                return
            }

            XCTAssertEqual(consentsMap.count, 1)
            XCTAssertEqual(consent["version"] as! String, "1.3.4")
            XCTAssertEqual(consent["dataProcessor"] as! String, "TheProcessor")
            XCTAssertEqual(consent["templateId"] as! String, "ABC")
            let historyMap = consent["history"] as? [[String: Any]]
            XCTAssertEqual(historyMap?.count, 1)
            let historyEntry = historyMap!.first!
            XCTAssertEqual(historyEntry["status"] as! Bool, true)
            XCTAssertEqual(historyEntry["type"] as! String, "EXPLICIT")
            XCTAssertEqual(historyEntry["timestampInMillis"] as! Int64, 123)
            XCTAssertEqual(consent["type"] as! String, "EXPLICIT")
            XCTAssertEqual(consent["status"] as! Bool, false)
            XCTAssertEqual(consent["isEssential"] as! Bool, true)

            XCTAssertEqual(self.usercentrics.getConsentsDataCount, 1)

            expectation.fulfill()
        }

        bridge.invoke(FakeFlutterMethodCall(methodName: bridgeName), resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
