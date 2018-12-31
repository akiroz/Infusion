import Foundation

public protocol Infusible {
    init()
}

public class Flask {
    public init() {}
    public static let shared = Flask()

    // Map of Class-ObjectIdentifier => Object Instance
    var flask = [ObjectIdentifier: Infusible]()

    // Set of currently extracting classes (detects cyclic dependencies)
    var extracting = Set<ObjectIdentifier>()

    public func extract<T:Infusible>() -> T {
        let classId = ObjectIdentifier(T.self)
        if let instance = flask[classId] {
            return instance as! T
        }
        if extracting.contains(classId) {
            fatalError("Infusion: Cyclic dependency detected: \(T.self)")
        }
        extracting.insert(classId)
        let instance = T()
        flask[classId] = instance
        extracting.remove(classId)
        return instance
    }

}
