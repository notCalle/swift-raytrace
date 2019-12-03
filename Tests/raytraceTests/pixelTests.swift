import XCTest
@testable import raytrace

final class pixelTests: XCTestCase {
    func testMakePixel() {
        let p = Pixel.rgb(0.1, 0.2, 0.3)

        XCTAssertEqual(p.r, 0.1)
        XCTAssertEqual(p.g, 0.2)
        XCTAssertEqual(p.b, 0.3)
    }

    static var allTests = [
        ("testMakePixel", testMakePixel),
    ]
}
