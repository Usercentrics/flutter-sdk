import Usercentrics

extension GppData {
    func serialize() -> Any {
        return [
            "gppString": gppString,
            "applicableSections": applicableSections,
            "sections": sections,
        ]
    }
}

extension GppSectionChangePayload {
    func serialize() -> Any {
        return [
            "data": data,
        ]
    }
}
