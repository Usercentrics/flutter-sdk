import Foundation

@testable import Usercentrics

final class FakeUsercentricsSDK: UsercentricsSDK {

    var getConsentsData: [UsercentricsServiceConsent]!

    override func getConsents() -> [UsercentricsServiceConsent] {
        return getConsentsData
    }

}
