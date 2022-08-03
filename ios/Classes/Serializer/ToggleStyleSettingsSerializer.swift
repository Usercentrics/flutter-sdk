import UsercentricsUI

extension ToggleStyleSettings {
    init?(from value: Any?) {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        self.init(activeBackgroundColor: UIColor(unsafeHex: dict["activeBackgroundColor"] as? String),
                  inactiveBackgroundColor: UIColor(unsafeHex: dict["inactiveBackgroundColor"] as? String),
                  disabledBackgroundColor: UIColor(unsafeHex: dict["disabledBackgroundColor"] as? String),
                  activeThumbColor: UIColor(unsafeHex: dict["activeThumbColor"] as? String),
                  inactiveThumbColor: UIColor(unsafeHex: dict["inactiveThumbColor"] as? String),
                  disabledThumbColor: UIColor(unsafeHex: dict["disabledThumbColor"] as? String))
    }
}
