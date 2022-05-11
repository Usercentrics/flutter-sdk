import Usercentrics

extension CCPAData {
    func serialize() -> Any {
        return [
            "version": self.version,
            "noticeGiven": Bool(from: self.noticeGiven) as Any,
            "optedOut": Bool(from: self.optedOut) as Any,
            "lspact": Bool(from: self.lspact) as Any,
            "uspString": toUSPString(),
        ]
    }
}
