import Usercentrics

extension UsercentricsReadyStatus {
    func serialize() -> Any {
        return [
            "shouldCollectConsent": self.shouldCollectConsent,
            "consents": self.consents.map { $0.serialize() }
        ]
    }
}
