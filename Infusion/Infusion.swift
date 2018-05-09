import Foundation

public protocol Infusible: class {
    init(_: Flask)
}

public class Flask {
    public init() {}
    
    // Map of Class-ObjectIdentifier => Object Instance
    var flask = [ObjectIdentifier: AnyObject]()

    func prepare<T:Infusible>() -> T {
        let id = ObjectIdentifier(T.self)
        if let i = flask[id] {
            return i as! T
        } else {
            let i = T(self)
            flask[id] = i
            return i
        }
    }
    
    public func extract<T>() -> T? {
        let i = flask[ObjectIdentifier(T.self)] as! T?
        if i == nil {
            let t = type(of: T.self)
            print("Infusion: Failed to extract \(t)")
        }
        return i
    }
    
    public func dissove<
        A:Infusible,
        Z:Infusible> (_:(A)->Z?) {
        let _:A = prepare()
        let _:Z = prepare()
    }
    public func dissove<
        A:Infusible,B:Infusible,
        Z:Infusible> (_:(A,B)->Z?) {
        let _:A = prepare()
        dissove({(_:B)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,
        Z:Infusible> (_:(A,B,C)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,
        Z:Infusible> (_:(A,B,C,D)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,
        Z:Infusible> (_:(A,B,C,D,E)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,F:Infusible,
        Z:Infusible> (_:(A,B,C,D,E,F)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E,_:F)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,F:Infusible,
        G:Infusible,
        Z:Infusible> (_:(A,B,C,D,E,F,G)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E,_:F,_:G)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,F:Infusible,
        G:Infusible,H:Infusible,
        Z:Infusible> (_:(A,B,C,D,E,F,G,H)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E,_:F,_:G,_:H)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,F:Infusible,
        G:Infusible,H:Infusible,I:Infusible,
        Z:Infusible> (_:(A,B,C,D,E,F,G,H,I)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E,_:F,_:G,_:H,_:I)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,F:Infusible,
        G:Infusible,H:Infusible,I:Infusible,J:Infusible,
        Z:Infusible> (_:(A,B,C,D,E,F,G,H,I,J)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E,_:F,_:G,_:H,_:I,_:J)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,F:Infusible,
        G:Infusible,H:Infusible,I:Infusible,J:Infusible,K:Infusible,
        Z:Infusible> (_:(A,B,C,D,E,F,G,H,I,J,K)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E,_:F,_:G,_:H,_:I,_:J,_:K)->Z? in nil})
    }
    public func dissove<
        A:Infusible,B:Infusible,C:Infusible,D:Infusible,E:Infusible,F:Infusible,
        G:Infusible,H:Infusible,I:Infusible,J:Infusible,K:Infusible,L:Infusible,
        Z:Infusible> (_:(A,B,C,D,E,F,G,H,I,J,K,L)->Z?) {
        let _:A = prepare()
        dissove({(_:B,_:C,_:D,_:E,_:F,_:G,_:H,_:I,_:J,_:K,_:L)->Z? in nil})
    }
    
}
