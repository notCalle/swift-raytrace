import XCTest
@testable import raytrace

final class cameraTests: XCTestCase {
    func testRenderSphere() {
        var camera = Camera(focalLength: 2)
        let canvas = Canvas(width: 8, height: 8)
        let surface = Surface.sphere()

        camera.transform = .translate(to: .point(0,0,-3))
        camera.render(world: surface, onto: canvas)

        XCTAssertEqual(canvas.get(x: 0, y: 0), .gray(0))
        XCTAssertEqual(canvas.get(x: 0, y: 7), .gray(0))
        XCTAssertEqual(canvas.get(x: 7, y: 7), .gray(0))
        XCTAssertEqual(canvas.get(x: 7, y: 0), .gray(0))
        XCTAssertEqual(canvas.get(x: 4, y: 4), .gray(1))
    }

    func testRenderSphereImage() {
        var camera = Camera(focalLength: 2)
        let canvas = Canvas(width: 512, height: 512)
        let surface = Surface.sphere()

        camera.transform = .translate(to: .point(0,0,-3))
        camera.render(world: surface, onto: canvas)
        let image = canvas.image
        XCTAssertNotNil(image)
    }

    static var allTests = [
        ("testRenderSphere", testRenderSphere),
        ("testRenderSphereImage", testRenderSphereImage),
    ]
}
