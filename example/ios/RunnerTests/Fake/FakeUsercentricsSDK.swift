import Foundation

@testable import Usercentrics

final class FakeUsercentricsSDK: UsercentricsSDK {

    var getConsentsData: [UsercentricsServiceConsent]?
    var getConsentsDataCount = 0

    override func getConsents() -> [UsercentricsServiceConsent] {
        getConsentsDataCount += 1
        return getConsentsData!
    }

    var getControllerIdData: String?

    override func getControllerId() -> String {
        return getControllerIdData!
    }

    var getTCStringData: String?

    override func getTCString() -> String {
        return getTCStringData!
    }

    var restoreUSError: Error?
    var restoreUSSuccess: UsercentricsReadyStatus?
    var restoreUSControllerIdArg: String?

    override func restoreUserSession(controllerId: String, onSuccess: @escaping (UsercentricsReadyStatus) -> Void, onFailure: @escaping (Error) -> Void) {
        self.restoreUSControllerIdArg = controllerId

        if let restoreUSError = restoreUSError {
            onFailure(restoreUSError)
            return
        }

        if let restoreUSSuccess = restoreUSSuccess {
            onSuccess(restoreUSSuccess)
            return
        }
    }

    var getCMPDataAnswer: UsercentricsCMPData?
    var getCMPDataCount = 0

    override func getCMPData() -> UsercentricsCMPData {
        getCMPDataCount += 1
        return getCMPDataAnswer!
    }
}
