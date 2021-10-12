import Usercentrics

struct InitializeOptionsSerializer : DataDeserializer {

    typealias T = UsercentricsOptions

    let loggerLevelSerializer = UsercentricsLoggerLevelSerializer()

    func deserialize(value: Any?) -> UsercentricsOptions {
        let dict = value as! Dictionary<String,Any>
        let options = UsercentricsOptions(settingsId: dict["settingsId"] as! String)

        if let defaultLanguage = dict["defaultLanguage"] as? String {
            options.defaultLanguage = defaultLanguage
        }

        if let loggerLevelString = dict["loggerLevel"] as? String {
            if let loggerLevel = loggerLevelSerializer.deserialize(value: loggerLevelString) {
                options.loggerLevel = loggerLevel
            }
        }

        if let timeoutMillis = dict["timeoutMillis"] as? Int64 {
            options.timeoutMillis = timeoutMillis
        }

        return options
    }

}
