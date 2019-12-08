//
//  Camera.swift
//  
//
//  Created by Calle Englund on 2019-12-04.
//

import simd

struct Camera: Transformable {
    var transform = Transform.identity

    let focalLength: Double

    func render(world: Surface, with lights: [Light], onto canvas: Canvas) {
        let height = Double(canvas.height)
        let width = Double(canvas.width)
        let size = 1/min(height, width)
        let base: Point = .point(-width*size/2, height*size/2, 0)

        for y in 0..<canvas.height {
            for x in 0..<canvas.width {
                let offset: Vector = .vector(Double(x)*size, -Double(y)*size, 0)
                let ray = Ray(from: .point(0, 0, -focalLength), toward: base+offset)
                    .transformed(by: self.transform)

                if let hit = ray.hit(world) {
                    let shades: [Pixel] = lights.compactMap { (light: Light) in
                        guard let lighting = light.lighting(for: hit, in: world)
                            else { return nil }
                        let diffuse = Float(simd_dot(-lighting.direction,
                                                     hit.normal))
                        return lighting.illumination * diffuse
                    }
                    canvas.set(x: x, y: y, shades.reduce(.black, +))
                }
            }
        }
    }
}
