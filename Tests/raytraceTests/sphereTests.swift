import XCTest
import Runes
@testable import raytrace

final class sphereTests: XCTestCase {
    let s = Surface.sphere()

    func testCenterInfront() {
        let r = Ray(origin: point(0,0,2), direction: vector(0,0,-1))
        let isects = s.intersections(with: r)
        let expect: [Double] = [1, 3]

        XCTAssertTrue(isects.count == 2)

        for (isect, expected) in zip(isects, expect) {
            XCTAssertEqual(isect.surface, self.s)
            XCTAssertEqual(isect.t, expected)
        }
    }

    func testCenterBehind() {
        let r = Ray(origin: point(0,0,-2), direction: vector(0,0,-1))
        let isects = s.intersections(with: r)
        let expect: [Double] = [-3, -1]

        XCTAssertTrue(isects.count == 2)

        for (isect, expected) in zip(isects, expect) {
            XCTAssertEqual(isect.surface, self.s)
            XCTAssertEqual(isect.t, expected)
        }
    }

    func testCenterInside() {
        let r = Ray(origin: point(0,0,0), direction: vector(0,0,-1))
        let isects = s.intersections(with: r)
        let expect: [Double] = [-1, 1]

        XCTAssertTrue(isects.count == 2)

        for (isect, expected) in zip(isects, expect) {
            XCTAssertEqual(isect.surface, self.s)
            XCTAssertEqual(isect.t, expected)
        }
    }

    func testTangential() {
        let r = Ray(origin: point(0,1,2), direction: vector(0,0,-1))
        let isects = s.intersections(with: r)
        let expect: [Double] = [2, 2]

        XCTAssertTrue(isects.count == 2)

        for (isect, expected) in zip(isects, expect) {
            XCTAssertEqual(isect.surface, self.s)
            XCTAssertEqual(isect.t, expected)
        }
    }

    func testMiss() {
        let r = Ray(origin: point(0,0,2), direction: vector(0,-1,0))
        let isects = s.intersections(with: r)

        XCTAssertTrue(isects.count == 0)
    }

    static var allTests = [
        ("testCenterInfront", testCenterInfront),
        ("testCenterBehind", testCenterBehind),
        ("testCenterInside", testCenterInside),
        ("testTangential", testTangential),
    ]
}
