import Foundation
@testable import usercentrics_sdk
@testable import Usercentrics
import UsercentricsUI

final class FakeUsercentricsManager: UsercentricsManagerProtocol {
    var shared: UsercentricsSDK

    var isReadyCount = 0

    var readyStatus: UsercentricsReadyStatus?
    var readyError: Error?
    
    var configureCount = 0
    var configureOptions: UsercentricsOptions?

    var resetCount = 0

    init(shared: UsercentricsSDK = FakeUsercentricsSDK()) {
        self.shared = shared
    }

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

    func configure(options: UsercentricsOptions) {
        configureCount += 1
        configureOptions = options
    }

    func reset() {
        resetCount += 1
    }
}
