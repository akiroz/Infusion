import XCTest
import Nimble
@testable import Infusion

class InfusionTests: XCTestCase {
    
    func testDependencyGraph() {
        class A:Infusible {
            required init() {}
        }
        class B:Infusible {
            let a: A = Flask.shared.extract()
            required init() {}
        }
        class C:Infusible {
            let b: B = Flask.shared.extract()
            required init() {}
        }
        class D:Infusible {
            let a: A = Flask.shared.extract()
            let b: B = Flask.shared.extract()
            let c: C = Flask.shared.extract()
            required init() {}
        }
        let _: D = Flask.shared.extract()
    }

    func testSameInstance() {
        class E:Infusible { required init() {} }
        let e1: E = Flask.shared.extract()
        let e2: E = Flask.shared.extract()
        XCTAssert(e1 === e2)
    }

    func testCyclicSelf() {
        class F:Infusible {
            let f: F = Flask.shared.extract()
            required init() {}
        }
        expect { () -> Void in
            let _: F = Flask.shared.extract()
        }.to(throwAssertion())
    }
    
    func testCyclicLoop() {
        class G:Infusible {
            let h: H = Flask.shared.extract()
            required init() {}
        }
        class H:Infusible {
            let g: G = Flask.shared.extract()
            required init() {}
        }
        expect { () -> Void in
            let _: G = Flask.shared.extract()
        }.to(throwAssertion())
    }
    
}
