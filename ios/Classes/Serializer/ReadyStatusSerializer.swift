import Usercentrics

extension UsercentricsReadyStatus {
    func serialize() -> Any {
        return [
            "shouldShowCMP": self.shouldShowCMP,
            "consents": self.consents.map { $0.serialize() }
        ]
    }
}
