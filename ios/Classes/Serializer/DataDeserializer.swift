
enum DataDeserializerError: Error {
    case invalidData
}

protocol DataDeserializer {
    associatedtype T

    func deserialize(value: Any?) throws -> T
}
