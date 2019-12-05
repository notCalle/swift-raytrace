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
        assert(origin.isPoint)
        assert(direction.isVector)

        self.origin = origin
        self.direction = simd_normalize(direction)
    }

    init(from: Point, toward: Point) {
        assert(from.isPoint)
        assert(toward.isPoint)
        
        self.init(origin: from, direction: toward - from)
    }

    func position(at t: Double) -> Point {
        origin + direction * t
    }

    func transformed(by xform: Transform) -> Ray {
        Ray(origin: xform * origin, direction: xform * direction)
    }
}
