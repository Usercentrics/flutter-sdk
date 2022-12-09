import Foundation

@testable import Usercentrics
@testable import usercentrics_sdk

final class FakeFlutterMethodCall: FlutterMethodCall {
    var methodName: String
    var argumentsMap: Any?

    override var method: String {
        return methodName
    }

    override var arguments: Any? {
        return argumentsMap
    }

    init(methodName: String, argumentsMap: Any? = nil) {
        self.methodName = methodName
        self.argumentsMap = argumentsMap
    }
}
