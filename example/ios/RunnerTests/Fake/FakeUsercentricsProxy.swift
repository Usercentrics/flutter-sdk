import Foundation
import Flutter
@testable import usercentrics_sdk
@testable import Usercentrics
import UsercentricsUI

final class FakeUsercentricsProxy: UsercentricsProxyProtocol {

    var shared: UsercentricsSDK

    init(shared: UsercentricsSDK = FakeUsercentricsSDK()) {
        self.shared = shared
    }

    var isReadyCount = 0
    var readyStatus: UsercentricsReadyStatus?
    var readyError: Error?

    func isReady(onSuccess: @escaping ((UsercentricsReadyStatus) -> Void), onFailure: @escaping ((Error) -> Void)) {
        isReadyCount += 1

        if let readyStatus = readyStatus {
            onSuccess(readyStatus)
            return
        }

        if let readyError = readyError {
            onFailure(readyError)
            return
        }
    }

    var configureCount = 0
    var configureOptions: UsercentricsOptions?

    func configure(options: UsercentricsOptions) {
        configureCount += 1
        configureOptions = options
    }
}

struct UsercentricsFakeError: Error {}
