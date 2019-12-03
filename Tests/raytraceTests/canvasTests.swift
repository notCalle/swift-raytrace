import XCTest
@testable import raytrace

final class canvasTests: XCTestCase {
    func testMakeCanvas() {
        let c = Canvas(width: 16, height: 32)

        XCTAssertEqual(c.width, 16)
        XCTAssertEqual(c.height, 32)
        XCTAssertEqual(c.get(x: 15, y: 31), .gray(0))
    }

    func testCanvasSetPixel() {
        let c = Canvas(width: 16, height: 32)

        c.set(x: 8, y: 16, .gray(1))
        XCTAssertEqual(c.get(x: 8, y: 16), .gray(1))
    }

    func testCanvasImage() {
        let c = Canvas(width: 16, height: 32)
        guard let img = c.image else { return XCTAssert(false) }

        XCTAssertEqual(img.height, c.height)
        XCTAssertEqual(img.width, c.width)
    }

    static var allTests = [
        ("testMakeCanvas", testMakeCanvas),
    ]
}
