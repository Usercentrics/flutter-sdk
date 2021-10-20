protocol DataSerializer {
    associatedtype T

    func serialize(value: T) -> Any
}
