
protocol DataDeserializer {
    associatedtype T

    func deserialize(value: Any?) -> T

}
