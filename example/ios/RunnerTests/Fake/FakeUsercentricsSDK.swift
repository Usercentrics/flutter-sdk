import Foundation

@testable import Usercentrics

final class FakeUsercentricsSDK: UsercentricsSDK {

    var getConsentsData: [UsercentricsServiceConsent]?
    var getConsentsDataCount = 0

    override func getConsents() -> [UsercentricsServiceConsent] {
        getConsentsDataCount += 1
        return getConsentsData!
    }
    
    var getAdditionalConsentModeAnswer: AdditionalConsentModeData?
    var getAdditionalConsentModeCount = 0
    override func getAdditionalConsentModeData() -> AdditionalConsentModeData {
        getAdditionalConsentModeCount += 1
        return getAdditionalConsentModeAnswer!
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

    var getDpsMetadataAnswer: [String: Any]?
    var getDpsMetadataTemplateIdArg: String?
    override func getDpsMetadata(templateId: String) -> [String: Any]? {
        getDpsMetadataTemplateIdArg = templateId
        return getDpsMetadataAnswer
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
    
    var clearUSError: Error?
    var clearUSSuccess: UsercentricsReadyStatus?

    override func clearUserSession(onSuccess: @escaping (UsercentricsReadyStatus) -> Void, onError: @escaping (Error) -> Void) {

        if let clearUSError = clearUSError {
            onError(clearUSError)
            return
        }

        if let restoreUSSuccess = clearUSSuccess {
            onSuccess(clearUSSuccess!)
            return
        }
    }

    // MSDK-3160: GPP API
    var getGPPDataAnswer: GppData?
    override func getGPPData() -> GppData {
        return getGPPDataAnswer!
    }

    var getGPPStringAnswer: String?
    override func getGPPString() -> String? {
        return getGPPStringAnswer
    }

    override func setGPPConsent(sectionName: String, fieldName: String, value: Any) {}

    // MSDK-3297: denyAllForTCF gained unsavedVendorLIDecisions parameter
    var denyAllForTCFAnswer: [UsercentricsServiceConsent]?
    override func denyAllForTCF(
        fromLayer: TCFDecisionUILayer,
        consentType: UsercentricsConsentType,
        unsavedPurposeLIDecisions: [KotlinInt: KotlinBoolean]?,
        unsavedVendorLIDecisions: [KotlinInt: KotlinBoolean]?
    ) -> [UsercentricsServiceConsent] {
        return denyAllForTCFAnswer!
    }

    override func acceptAll(consentType: UsercentricsConsentType) -> [UsercentricsServiceConsent] {
        fatalError("not implemented")
    }

    override func acceptAllForTCF(fromLayer: TCFDecisionUILayer, consentType: UsercentricsConsentType) -> [UsercentricsServiceConsent] {
        fatalError("not implemented")
    }

    override func changeLanguage(language: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        fatalError("not implemented")
    }

    override func denyAll(consentType: UsercentricsConsentType) -> [UsercentricsServiceConsent] {
        fatalError("not implemented")
    }

    override func getTCFData(callback: @escaping (TCFData) -> Void) {
        fatalError("not implemented")
    }

    override func getUIApplication(predefinedUIVariant: PredefinedUIVariant) -> PredefinedUIApplicationManager {
        fatalError("not implemented")
    }

    override func getUIFactoryHolder(abTestingVariant: String?, predefinedUIVariant: PredefinedUIVariant?, callback: @escaping (PredefinedUIFactoryHolder) -> Void) {
        fatalError("not implemented")
    }

    override func getUSPData() -> CCPAData {
        fatalError("not implemented")
    }

    override func getUserSessionData() -> String {
        fatalError("not implemented")
    }

    override func saveDecisions(decisions: [UserDecision], consentType: UsercentricsConsentType) -> [UsercentricsServiceConsent] {
        fatalError("not implemented")
    }

    override func saveDecisionsForTCF(tcfDecisions: TCFUserDecisions, fromLayer: TCFDecisionUILayer, serviceDecisions: [UserDecision], consentType: UsercentricsConsentType) -> [UsercentricsServiceConsent] {
        fatalError("not implemented")
    }

    override func saveOptOutForCCPA(isOptedOut: Bool, consentType: UsercentricsConsentType) -> [UsercentricsServiceConsent] {
        fatalError("not implemented")
    }

    override func setCMPId(id: Int32) {}

    override func shouldCollectConsent() -> Bool {
        fatalError("not implemented")
    }
}
