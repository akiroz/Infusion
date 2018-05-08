import XCTest
@testable import Infusion

class InfusionTests: XCTestCase {
    class A:Infusible { required init(_: Flask) {} }
    class B:Infusible { required init(_: Flask) {} }
    class C:Infusible { required init(_: Flask) {} }
    class D:Infusible { required init(_: Flask) {} }
    class E:Infusible { required init(_: Flask) {} }
    class F:Infusible { required init(_: Flask) {} }
    class G:Infusible { required init(_: Flask) {} }
    class H:Infusible { required init(_: Flask) {} }
    class I:Infusible { required init(_: Flask) {} }
    class J:Infusible { required init(_: Flask) {} }
    class K:Infusible { required init(_: Flask) {} }
    class L:Infusible { required init(_: Flask) {} }
    
    func test() {
        class Z:Infusible {
            required init(_ f: Flask) {
                let _:A = f.extract()!
                let _:B = f.extract()!
                let _:C = f.extract()!
                let _:D = f.extract()!
                let _:E = f.extract()!
                let _:F = f.extract()!
                let _:G = f.extract()!
                let _:H = f.extract()!
                let _:I = f.extract()!
                let _:J = f.extract()!
                let _:K = f.extract()!
                let _:L = f.extract()!
            }
        }
        let f = Flask()
        f.dissove({(_:A,_:B,_:C,_:D,_:E,_:F,_:G,_:H,_:I,_:J,_:K,_:L) -> Z? in nil})
        let _:Z = f.extract()!
    }
    
    func testNone() {
        let a:A? = Flask().extract()
        XCTAssert(a == nil)
    }
    
}
