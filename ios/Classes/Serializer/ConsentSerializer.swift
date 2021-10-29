import Usercentrics

extension UsercentricsServiceConsent {
    func serialize() -> Any {
        return [
            "templateId": self.templateId,
            "status": self.status,
            "type": self.type?.name as Any,
            "version": self.version,
            "dataProcessor": self.dataProcessor,
        ]
    }
}
