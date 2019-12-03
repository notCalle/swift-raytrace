import XCTest
@testable import raytrace

final class vectorTests: XCTestCase {
    func testMakeVector() {
        let v: Vector = .vector(1,2,3)

        XCTAssertTrue(v.isVector)
        XCTAssertEqual(v.x, 1)
        XCTAssertEqual(v.y, 2)
        XCTAssertEqual(v.z, 3)
    }

    static var allTests = [
        ("testMakeVector", testMakeVector),
    ]
}
