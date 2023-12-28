import Usercentrics

extension AdditionalConsentModeData {
    func serialize()-> Any {
        let x = [
            "acString" : acString,
            "adTechProviders" : adTechProviders.map { $0.serialize() }
        ] as [String : Any]
        return x
    }
}

extension AdTechProvider {
    func serialize()-> Any {
        let x = [
            "id" : id,
            "name" : name,
            "privacyPolicyUrl" : privacyPolicyUrl,
            "consent" : consent
        ] as [String : Any]
        return x
    }
}
