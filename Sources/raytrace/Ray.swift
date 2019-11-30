//
//  Ray.swift
//  
//
//  Created by Calle Englund on 2019-11-30.
//

import simd

struct Ray {
    let origin: Point
    let direction: Vector

    init(origin: Point, direction: Vector) {
        self.origin = origin
        self.direction = simd_normalize(direction)
    }

    init(from: Point, toward: Point) {
        self.init(origin: from, direction: toward - from)
    }

    func position(at t: Double) -> Point {
        origin + direction * t
    }
}
