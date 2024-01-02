import Usercentrics

extension AdditionalConsentModeData {
    func serialize()-> Any {
        return [
            "acString" : acString,
            "adTechProviders" : adTechProviders.map { $0.serialize() }
        ] as [String : Any]
    }
}

extension AdTechProvider {
    func serialize()-> Any {
        return [
            "id" : id,
            "name" : name,
            "privacyPolicyUrl" : privacyPolicyUrl,
            "consent" : consent
        ] as [String : Any]
    }
}
