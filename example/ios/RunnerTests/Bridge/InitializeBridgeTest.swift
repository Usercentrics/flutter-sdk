import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class InitializeBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "initialize"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsProxy!

    override func setUp() {
        usercentrics = FakeUsercentricsProxy()
        bridge = InitializeBridge(usercentrics: usercentrics)
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
        let expectation =  XCTestExpectation(description: "resultCompletion")
        let resultCompletion: FlutterResult = { [unowned self] result in
            XCTAssertNil(result)

            XCTAssertEqual(self.usercentrics.configureCount, 1)
            XCTAssertNotNil(self.usercentrics.configureOptions)

            XCTAssertEqual(self.usercentrics.configureOptions?.settingsId, "AAAAA")
            XCTAssertEqual(self.usercentrics.configureOptions?.ruleSetId, "BBBBB")
            XCTAssertEqual(self.usercentrics.configureOptions?.loggerLevel, .debug)
            XCTAssertEqual(self.usercentrics.configureOptions?.timeoutMillis, 1000)
            XCTAssertEqual(self.usercentrics.configureOptions?.version, "1.2.3")
            XCTAssertEqual(self.usercentrics.configureOptions?.networkMode, .eu)

            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        method.argumentsMap = [
            "settingsId": "AAAAA",
            "ruleSetId": "BBBBB",
            "loggerLevel": "DEBUG",
            "timeoutMillis": 1000,
            "version": "1.2.3",
            "networkMode": "EU"
        ]

        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }

    func testInvokeTwice() {
        let expectation =  XCTestExpectation(description: "resultCompletion")
        expectation.expectedFulfillmentCount = 2
        let resultCompletion: FlutterResult = { [unowned self] result in
            XCTAssertNil(result)

            XCTAssertNotNil(self.usercentrics.configureOptions)

            XCTAssertEqual(self.usercentrics.configureOptions?.settingsId, "AAAAA")
            XCTAssertEqual(self.usercentrics.configureOptions?.loggerLevel, .debug)
            XCTAssertEqual(self.usercentrics.configureOptions?.timeoutMillis, 1000)
            XCTAssertEqual(self.usercentrics.configureOptions?.version, "1.2.3")

            expectation.fulfill()
        }

        let method = FakeFlutterMethodCall(methodName: bridgeName)
        method.argumentsMap = [
            "settingsId": "AAAAA",
            "loggerLevel": "DEBUG",
            "timeoutMillis": 1000,
            "version": "1.2.3"
        ]

        bridge.invoke(method, resultCompletion)
        bridge.invoke(method, resultCompletion)
        wait(for: [expectation], timeout: 2.0)
    }
}
