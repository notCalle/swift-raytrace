import XCTest
@testable import raytrace

final class hitTests: XCTestCase {
    func testSurface() -> Surface {
        Surface(intersect: { ray in
            guard ray.direction.x !=~ 0 else { return [] }

            return [1.0]
        }, normalAt: { pt in
            pt - point(0)
        })
    }

    func testHit() {
        let s = testSurface()
        let r = Ray(origin: point(0,0,0), direction: vector(1,0,0))
        let hit = r.hit(s)

        XCTAssertNotNil(hit)
        XCTAssertEqual(hit!.surface, s)
        XCTAssertTrue(hit!.position ==~ point(1,0,0))
        XCTAssertTrue(hit!.normal ==~ vector(1,0,0))
    }

    func testMiss() {
        let s = testSurface()
        let r = Ray(origin: point(0,0,0), direction: vector(0,1,0))
        let hit = r.hit(s)

        XCTAssertNil(hit)
    }

    static var allTests = [
        ("testHit", testHit),
        ("testMiss", testMiss),
    ]
}
