import Usercentrics

extension UsercentricsOptions {
    convenience init?(from value: Any?) {
        guard let dict = value as? Dictionary<String, Any>,
              let settingsId = dict["settingsId"] as? String
        else { return nil }

        let options = UsercentricsOptions(settingsId: settingsId)

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

        self.init(settingsId: options.settingsId,
                  defaultLanguage: options.defaultLanguage,
                  version: options.version,
                  timeoutMillis: options.timeoutMillis,
                  loggerLevel: options.loggerLevel)
    }
}
