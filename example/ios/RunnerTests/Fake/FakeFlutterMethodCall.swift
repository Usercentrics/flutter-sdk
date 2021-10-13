import Foundation

@testable import Usercentrics
@testable import usercentrics_sdk

final class FakeFlutterMethodCall: FlutterMethodCall {
    private let methodName: String

    override var method: String {
        return methodName
    }

    init(methodName: String) {
        self.methodName = methodName
    }
}
