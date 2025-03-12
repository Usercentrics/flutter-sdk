import Usercentrics
import Flutter

extension ConsentDisclosureObject {
    func serialize() -> Any {
        return self.disclosures.map { $0.serialize() }
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
