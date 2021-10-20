import Foundation

@testable import Usercentrics

final class FakeUsercentricsSDK: UsercentricsSDK {

    var getConsentsData: [UsercentricsServiceConsent]?
    var getControllerIdData: String?
    var getTCStringData: String?

    var controllerId: String?

    var restoreError: Error?
    var restoreSuccess: UsercentricsReadyStatus?

    override func getConsents() -> [UsercentricsServiceConsent] {
        return getConsentsData!
    }

    override func getControllerId() -> String {
        return getControllerIdData!
    }

    override func getTCString() -> String {
        return getTCStringData!
    }

    override func restoreUserSession(controllerId: String, onSuccess: @escaping (UsercentricsReadyStatus) -> Void, onFailure: @escaping (Error) -> Void) {
        self.controllerId = controllerId

        if let restoreError = restoreError {
            onFailure(restoreError)
            return
        }

        if let restoreSuccess = restoreSuccess {
            onSuccess(restoreSuccess)
            return
        }
    }
}
