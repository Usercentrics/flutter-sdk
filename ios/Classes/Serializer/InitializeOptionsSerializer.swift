import Usercentrics

struct InitializeOptionsSerializer : DataDeserializer {

    typealias T = UsercentricsOptions

    let loggerLevelSerializer = UsercentricsLoggerLevelSerializer()

    func deserialize(value: Any?) throws -> UsercentricsOptions {
        guard let dict = value as? Dictionary<String, Any>,
              let settingsId = dict["settingsId"] as? String
        else { throw DataDeserializerError.invalidData }
        
        let options = UsercentricsOptions(settingsId: settingsId)

        if let defaultLanguage = dict["defaultLanguage"] as? String {
            options.defaultLanguage = defaultLanguage
        }

        if let loggerLevelString = dict["loggerLevel"] as? String {
            if let loggerLevel = loggerLevelSerializer.deserialize(value: loggerLevelString) {
                options.loggerLevel = loggerLevel
            }
        }

        if let timeoutMillis = dict["timeoutMillis"] as? Int {
            options.timeoutMillis = Int64(timeoutMillis)
        }

        if let version = dict["version"] as? String {
            options.version = version
        }

        return options
    }

}
