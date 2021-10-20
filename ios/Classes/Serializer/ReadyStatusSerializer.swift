import Usercentrics

struct ReadyStatusSerializer : DataSerializer {

    typealias T = UsercentricsReadyStatus

    let consentSerializer = ConsentSerializer()

    func serialize(value: UsercentricsReadyStatus) -> Any {
        return [
            "shouldShowCMP": value.shouldShowCMP,
            "consents": value.consents.map { consentSerializer.serialize(value: $0) }
        ]

    }
}
