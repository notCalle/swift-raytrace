import XCTest
@testable import raytrace

final class intersectionTests: XCTestCase {
    class TestSurface: Surface {
        override func intersect(with ray: Ray) -> [Double] {
            guard ray.direction.x !=~ 0 else { return [] }

            return [1.0]
        }

        override func normal(at position: Point) -> Vector {
            position - .point(0)
        }
    }

    func testIntersectionHit() {
        let s = TestSurface()
        let r = Ray(origin: .point(0,0,0), direction: .vector(1,0,0))
        let isects = s.intersections(with: r)

        XCTAssertTrue(isects.count == 1)
        XCTAssertTrue(isects.first!.surface == s)
        XCTAssertTrue(isects.first!.t ==~ 1)
    }

    func testIntersectionMiss() {
        let s = TestSurface()
        let r = Ray(origin: .point(0,0,0), direction: .vector(0,1,0))
        let isects = s.intersections(with: r)

        XCTAssertTrue(isects.count == 0)
    }

    static var allTests = [
        ("testIntersectionHit", testIntersectionHit),
        ("testIntersectionMiss", testIntersectionMiss),
    ]
}
