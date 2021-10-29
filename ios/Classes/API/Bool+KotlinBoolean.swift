import Usercentrics

extension Bool {
    init?(from value: KotlinBoolean?) {
        if let value = value {
            self.init(value.boolValue)
        }
        return nil
    }
}
