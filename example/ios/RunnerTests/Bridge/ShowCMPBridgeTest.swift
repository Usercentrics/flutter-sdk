import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class ShowCMPBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "showCMP"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsProxy!

    override func setUp() {
        usercentrics = FakeUsercentricsProxy()
        bridge = ShowCMPBridge(assetProvider: FakeFlutterAssetProvider())
        super.setUp()
    }

    override func tearDown() {
        usercentrics = nil
        bridge = nil
    }

    func testName() {
        testNameProtocol()
    }
}
