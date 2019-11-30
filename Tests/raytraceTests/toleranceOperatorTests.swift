import XCTest
@testable import raytrace

final class toleranceOperatorTests: XCTestCase {
    func testDoubleEquality() {
        XCTAssertTrue(0.1 + 0.2 ==~ 0.3)
        XCTAssertFalse(0.1 ==~ 0.1 + .ulpOfOne)
        XCTAssertFalse(0.1 ==~ 0.1 - .ulpOfOne)
    }

    func testDoubleInEquality() {
        XCTAssertFalse(0.1 + 0.2 !=~ 0.3)
        XCTAssertTrue(0.1 !=~ 0.1 + .ulpOfOne)
        XCTAssertTrue(0.1 !=~ 0.1 - .ulpOfOne)
    }

    static var allTests = [
        ("testDoubleEquality", testDoubleEquality),
        ("testDoubleInEquality", testDoubleInEquality),
    ]
}
