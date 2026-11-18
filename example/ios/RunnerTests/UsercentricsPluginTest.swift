import Flutter
import XCTest

@testable import usercentrics_sdk

class UsercentricsPluginTest: XCTestCase {

    private var plugin: UsercentricsPlugin!

    override func setUp() {
        plugin = UsercentricsPlugin(assetProvider: FakeFlutterAssetProvider(),
                                    usercentrics: FakeUsercentricsProxy())
        super.setUp()
    }

    override func tearDown() {
        plugin = nil
    }

    func testSetAgeSignalIsRegistered() {
        var results: [Any] = []

        // No arguments: the bridge itself refuses the call, before it reaches the native SDK
        plugin.handle(FakeFlutterMethodCall(methodName: "setAgeSignal"), result: { result in
            results.append(result ?? NSNull())
        })

        XCTAssertEqual(results.count, 1)
        let error = results.first as? FlutterError
        XCTAssertEqual(error?.code, "usercentrics_flutter_setAgeSignal_error")
    }

    func testAnUnknownMethodIsNotImplemented() {
        var results: [Any] = []

        plugin.handle(FakeFlutterMethodCall(methodName: "unknownMethod"), result: { result in
            results.append(result ?? NSNull())
        })

        XCTAssertEqual(results.count, 1)
        guard let result = results.first else {
            XCTFail("There is no result")
            return
        }
        XCTAssertTrue(result as AnyObject === FlutterMethodNotImplemented)
    }
}
