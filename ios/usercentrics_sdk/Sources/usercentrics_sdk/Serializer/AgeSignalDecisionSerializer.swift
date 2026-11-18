import Foundation
import Usercentrics

extension UsercentricsAgeSignalDecision {

    // Enums travel by their native name, and a missing value stays null (NSNull).
    func serialize() -> Any {
        return [
            "source": self.source.name,
            "trust": nullable(self.trust?.name),
            "band": nullable(self.band?.name),
            "ageLower": nullable(self.ageLower?.intValue),
            "ageUpper": nullable(self.ageUpper?.intValue),
            "unavailableReason": nullable(self.unavailableReason?.name),
        ]
    }
}

private func nullable(_ value: Any?) -> Any {
    return value ?? NSNull()
}
