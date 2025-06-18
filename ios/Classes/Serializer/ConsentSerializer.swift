import Usercentrics

extension UsercentricsServiceConsent {
    func serialize() -> Any {
        return [
            "templateId": self.templateId,
            "status": self.status,
            "type": self.type?.name as Any,
            "version": self.version,
            "dataProcessor": self.dataProcessor,
            "isEssential": self.isEssential,
            "history": self.history.map { $0.serialize() },
            "category": self.category
        ]
    }
}

extension UsercentricsConsentHistoryEntry {
    func serialize() -> Any {
        return [
            "status": self.status,
            "timestampInMillis": self.timestampInMillis,
            "type": self.type.name as Any,
        ]
    }
}
