import Foundation
import Usercentrics
import Flutter

protocol UsercentricsProxyProtocol {
    var shared: UsercentricsSDK { get }
    func isReady(onSuccess: @escaping ((UsercentricsReadyStatus) -> Void), onFailure: @escaping ((Error) -> Void))
    func configure(options: UsercentricsOptions)
}

struct UsercentricsProxy: UsercentricsProxyProtocol {
    var shared: UsercentricsSDK {
        UsercentricsCore.shared
    }

    func isReady(onSuccess: @escaping ((UsercentricsReadyStatus) -> Void), onFailure: @escaping ((Error) -> Void)) {
        UsercentricsCore.isReady(onSuccess: onSuccess, onFailure: onFailure)
    }

    func configure(options: UsercentricsOptions) {
        UsercentricsCore.configure(options: options)
    }
}
