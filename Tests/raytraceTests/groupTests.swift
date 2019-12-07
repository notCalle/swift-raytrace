import XCTest
@testable import raytrace

final class groupTests: XCTestCase {
    let s1 = Sphere()
    let s2 = Sphere()
    let s3 = Sphere()

    var g: Surface {
        s2.transform = .translate(to: .point(-2, 0, 1))
        s3.transform = .translate(to: .point(2, 0, 1))

        return Group(s1, s2, s3)
    }

    func testCenter() {
        let r = Ray(origin: .point(0,0,-2), direction: .vector(0,0,1))
        let isects = g.intersections(with: r)
        let expect: [Double] = [1, 3]

        XCTAssertEqual(isects.count, 2)

        for (isect, expected) in zip(isects, expect) {
            XCTAssertEqual(isect.surface, self.s1)
            XCTAssertEqual(isect.t, expected)
        }
    }

    func testCenterLeft() {
        let r = Ray(origin: .point(-1,0,-2), direction: .vector(0,0,1))
        let isects = g.intersections(with: r)
        let expect = [
            Intersection(surface: s1, t: 2),
            Intersection(surface: s1, t: 2),
            Intersection(surface: s2, t: 3),
            Intersection(surface: s2, t: 3)
        ]

        XCTAssertEqual(isects.count, 4)

        for (isect, expected) in zip(isects, expect) {
            XCTAssertEqual(isect.surface, expected.surface)
            XCTAssertEqual(isect.t, expected.t)
        }
    }

    func testRight() {
        let r = Ray(origin: .point(2,0,-2), direction: .vector(0,0,1))
        let isects = g.intersections(with: r)
        let expect = [
            Intersection(surface: s3, t: 2),
            Intersection(surface: s3, t: 4)
        ]

        XCTAssertEqual(isects.count, 2)

        for (isect, expected) in zip(isects, expect) {
            XCTAssertEqual(isect.surface, expected.surface)
            XCTAssertEqual(isect.t, expected.t)
        }
    }

    func testMiss() {
        let r = Ray(origin: .point(0,0,2), direction: .vector(0,-1,0))
        let isects = g.intersections(with: r)

        XCTAssertEqual(isects.count, 0)
    }

    static var allTests = [
        ("testCenter", testCenter),
        ("testCenterLeft", testCenterLeft),
        ("testRight", testRight),
        ("testMiss", testMiss),
    ]
}
