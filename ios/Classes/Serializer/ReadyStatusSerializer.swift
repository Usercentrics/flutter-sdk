import Usercentrics

extension UsercentricsReadyStatus {
    func serialize() -> Any {
        return [
            "shouldCollectConsent": self.shouldCollectConsent,
            "consents": self.consents.map { $0.serialize() },
            "geolocationRuleset": self.geolocationRuleset?.serialize(),
            "location": self.location.serialize()
        ]
    }
}


extension GeolocationRuleset {
    func serialize() -> Any {
        return [
            "activeSettingsId": self.activeSettingsId,
            "bannerRequiredAtLocation": self.bannerRequiredAtLocation
        ]
    }
}
