import Foundation
import Usercentrics

protocol UsercentricsManagerProtocol {
    var shared: UsercentricsSDK { get }
    func isReady(onSuccess: @escaping ((UsercentricsReadyStatus) -> Void), onFailure: @escaping ((Error) -> Void))
    func configure(options: UsercentricsOptions)
    func reset()
}

struct UsercentricsManager: UsercentricsManagerProtocol {
    var shared: UsercentricsSDK {
        UsercentricsCore.shared
    }

    func isReady(onSuccess: @escaping ((UsercentricsReadyStatus) -> Void), onFailure: @escaping ((Error) -> Void)) {
        UsercentricsCore.isReady(onSuccess: onSuccess, onFailure: onFailure)
    }

    func configure(options: UsercentricsOptions) {
        UsercentricsCore.configure(options: options)
    }

    func reset() {
        UsercentricsCore.reset()
    }
}
