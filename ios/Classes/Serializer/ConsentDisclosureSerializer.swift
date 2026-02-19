import Usercentrics

extension ConsentDisclosureObject {
    func serialize() -> Any {
        return [
            "disclosures": self.disclosures.map { $0.serialize() },
            "sdks": self.sdks.map { ["name": $0.name, "use": $0.use] }
        ] as [String: Any]
    }
}

extension ConsentDisclosure {
    func serialize() -> Any {
        return [
            "identifier": self.identifier as Any,
            "type": self.type?.name ?? "",
            "name": self.name as Any,
            "maxAgeSeconds": self.maxAgeSeconds as Any,
            "cookieRefresh": self.cookieRefresh,
            "purposes": self.purposes,
            "domain": self.domain ?? "",
            "description": self.description,
        ] as [String : Any]
    }
}
