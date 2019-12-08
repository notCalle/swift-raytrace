//
//  Lighting.swift
//  
//
//  Created by Calle Englund on 2019-12-08.
//

struct Lighting {
    let direction: Vector
    let illumination: Pixel

    static let offset: Double = 1e3.ulp
}

extension Light {
    func lighting(for hit: Hit, in world: Surface) -> Lighting? {
        let direction = self.direction(to: hit)
        let shadowRay = Ray(origin: hit.position + hit.normal * Lighting.offset,
                            direction: -direction)

        guard shadowRay.hit(world) == nil else { return nil }

        return Lighting(direction: direction,
                        illumination: illumination(for: hit))
    }
}
