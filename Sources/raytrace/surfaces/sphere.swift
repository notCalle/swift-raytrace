//
//  Sphere.swift
//  
//
//  Created by Calle Englund on 2019-12-01.
//

import simd

class Sphere: Surface {
    /// Intersect a spherical surface with a ray
    ///
    ///     O = ray.origin
    ///     D = ray.direction
    ///     C = sphere.origin = (0, 0, 0)
    ///     R = sphere.radius = 1.0
    ///
    ///     |O + tD - C|^2 - R^2 = 0
    ///     |O + tD - 0|^2 - 1 = 0
    ///
    override func intersect(with ray: Ray) -> [Double] {
        let l = ray.origin - .point(0)
        let d = ray.direction
        let a = simd_dot(d, d)
        let b = 2 * simd_dot(d, l)
        let c = simd_dot(l, l) - 1

        guard let (t0, t1) = quadratic(a, b, c) else { return [] }

        return [t0, t1]
    }

    override func normal(at position: Point) -> Vector {
        position - .point(0)
    }
}
