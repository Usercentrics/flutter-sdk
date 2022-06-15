import Usercentrics

extension UsercentricsOptions {

    static func initialize(from value: Any?) -> UsercentricsOptions? {
        guard let dict = value as? Dictionary<String, Any>
        else { return nil }

        let options = UsercentricsOptions()

        if let settingsId = dict["settingsId"] as? String {
            options.settingsId = settingsId
        }

        if let ruleSetId = dict["ruleSetId"] as? String {
            options.ruleSetId = ruleSetId
        }

        if let defaultLanguage = dict["defaultLanguage"] as? String {
            options.defaultLanguage = defaultLanguage
        }

        if let loggerLevelString = dict["loggerLevel"] as? String {
            if let loggerLevel = UsercentricsLoggerLevel.initialize(from: loggerLevelString) {
                options.loggerLevel = loggerLevel
            }
        }

        if let timeoutMillis = dict["timeoutMillis"] as? Int {
            options.timeoutMillis = Int64(timeoutMillis)
        }

        if let version = dict["version"] as? String {
            options.version = version
        }

        if let networkModeString = dict["networkMode"] as? String {
            if let networkMode = NetworkMode.initialize(from: networkModeString) {
                options.networkMode = networkMode
            }
        }

        return options
    }
    
}
