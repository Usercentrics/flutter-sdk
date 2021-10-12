import Usercentrics

struct ConsentSerializer : DataSerializer {

    typealias T = UsercentricsServiceConsent

    func serialize(value: UsercentricsServiceConsent) -> Any {
        return [
            "templateId": value.templateId,
            "status": value.status,
            "type": value.type?.name as Any,
            "version": value.version,
            "dataProcessor": value.dataProcessor,
        ]

    }
}
