import XCTest
@testable import raytrace

final class hitTests: XCTestCase {
    class TestSurface: Surface {
        override func intersect(with ray: Ray) -> [Double] {
            guard ray.direction.x !=~ 0 else { return [] }

            return [1.0]
        }

        override func normal(at position: Point) -> Vector {
            position - .point(0)
        }
    }

    func testHit() {
        let s = TestSurface()
        let r = Ray(origin: .point(0,0,0), direction: .vector(1,0,0))
        let hit = r.hit(s)

        XCTAssertNotNil(hit)
        XCTAssertEqual(hit!.surface, s)
        XCTAssertTrue(hit!.position ==~ .point(1,0,0))
        XCTAssertTrue(hit!.normal ==~ .vector(1,0,0))
    }

    func testMiss() {
        let s = TestSurface()
        let r = Ray(origin: .point(0,0,0), direction: .vector(0,1,0))
        let hit = r.hit(s)

        XCTAssertNil(hit)
    }

    static var allTests = [
        ("testHit", testHit),
        ("testMiss", testMiss),
    ]
}
