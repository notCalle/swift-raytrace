//
//  Point.swift
//  
//
//  Created by Calle Englund on 2019-11-30.
//

import simd

typealias Point = simd_double4

extension Point {
    static func point(_ xyz: simd_double3) -> Point {
        Point(xyz, 1.0)
    }

    static func point(_ x: Double, _ y: Double, _ z: Double) -> Point {
        Point(x, y, z, 1.0)
    }

    static func point(_ d: Double) -> Point {
        point(d, d, d)
    }

    var isPoint: Bool { w ==~ 1.0 }
}
