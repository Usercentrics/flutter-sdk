import Usercentrics
import Flutter

extension Bool {
    init?(from value: KotlinBoolean?) {
        guard
            let value = value
        else { return nil }
        self.init(value.boolValue)
    }
}
