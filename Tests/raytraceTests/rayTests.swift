import XCTest
@testable import raytrace

final class rayTests: XCTestCase {
    func testMakeRayOriginDirection() {
        let r = Ray(origin: .point(1,2,3), direction: .vector(1,1,1))

        XCTAssertTrue(r.origin ==~ .point(1,2,3))
        XCTAssertTrue(r.direction ==~ .vector(sqrt(1/3)))
    }

    func testMakeRayFromToward() {
        let r = Ray(from: .point(1,2,3), toward: .point(2,3,4))

        XCTAssertTrue(r.origin ==~ .point(1,2,3))
        XCTAssertTrue(r.direction ==~ .vector(sqrt(1/3)))
    }

    func testRayPositionAt() {
        let r = Ray(origin: .point(0,0,0), direction: .vector(1,1,1))
        let p = r.position(at: 2)
        XCTAssertTrue(p ==~ .point(sqrt(1/3)*2))
    }

    static var allTests = [
        ("testMakeRayOriginDirection", testMakeRayOriginDirection),
        ("testMakeRayFromToward", testMakeRayFromToward),
    ]
}
