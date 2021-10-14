import XCTest

@testable import Usercentrics
@testable import usercentrics_sdk

class ShowCMPBridgeTest: XCTestCase, BaseBridgeTestProtocol {

    var bridgeName: String! = "showCMP"
    var bridge: MethodBridge!

    private var usercentrics: FakeUsercentricsManager!

    override func setUp() {
        usercentrics = FakeUsercentricsManager()
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
