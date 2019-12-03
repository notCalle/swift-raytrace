import XCTest
@testable import raytrace

final class pointTests: XCTestCase {
    func testMakePoint() {
        let p: Point = .point(1,2,3)

        XCTAssertTrue(p.isPoint)
        XCTAssertEqual(p.x, 1)
        XCTAssertEqual(p.y, 2)
        XCTAssertEqual(p.z, 3)
    }

    static var allTests = [
        ("testMakePoint", testMakePoint),
    ]
}
