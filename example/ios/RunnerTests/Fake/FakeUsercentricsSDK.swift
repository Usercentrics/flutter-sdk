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

    var getABTestingVariantAnswer: String?
    var getABTestingVariantCount = 0
    override func getABTestingVariant() -> String? {
        getABTestingVariantCount += 1
        return getABTestingVariantAnswer!
    }

    var setABTestingVariantArgument: String?
    var setABTestingVariantCount = 0
    override func setABTestingVariant(variantName: String) {
        setABTestingVariantCount += 1
        setABTestingVariantArgument = variantName
    }

    var trackCalls: Array<UsercentricsAnalyticsEventType> = []
    override func track(event: UsercentricsAnalyticsEventType) {
        trackCalls.append(event)
    }
}
