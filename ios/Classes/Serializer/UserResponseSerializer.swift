import UsercentricsUI

struct UserResponseSerializer : DataSerializer {

    let userInteractionSerializer = UsercentricsUserInteractionSerializer()
    let consentSerializer = ConsentSerializer()

    typealias T = UsercentricsConsentUserResponse

    func serialize(value: UsercentricsConsentUserResponse) -> Any {
        return [
            "controllerId": value.controllerId,
            "userInteraction": userInteractionSerializer.serialize(value: value.userInteraction),
            "consents": value.consents.map { consentSerializer.serialize(value: $0) }
        ]

    }
}
