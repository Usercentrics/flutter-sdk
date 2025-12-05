import Usercentrics

extension Bool {
    init?(from value: KotlinBoolean?) {
        guard
            let value = value
        else { return nil }
        self.init(value.boolValue)
    }
}

extension Dictionary where Key == Int, Value == Bool {
    func asKotlinIntBooleanDict() -> [KotlinInt: KotlinBoolean] {
        var result: [KotlinInt: KotlinBoolean] = [:]
        for (key, value) in self {
            result[KotlinInt(int: Int32(key))] = KotlinBoolean(bool: value)
        }
        return result
    }
}
