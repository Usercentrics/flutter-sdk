import UsercentricsUI
import Flutter

extension UsercentricsConsentUserResponse {
    func serialize() -> Any {
        return [
            "controllerId": self.controllerId,
            "userInteraction": self.userInteraction.serialize(),
            "consents": self.consents.map { $0.serialize() },
        ]
    }
}
