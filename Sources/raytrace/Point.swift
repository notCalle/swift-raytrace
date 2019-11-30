//
//  Point.swift
//  
//
//  Created by Calle Englund on 2019-11-30.
//

import simd

typealias Point = simd_double4

func point(_ xyz: simd_double3) -> Point {
    simd_make_double4(xyz, 1.0)
}

func point(_ x: Double, _ y: Double, _ z: Double) -> Point {
    simd_make_double4(x, y, z, 1.0)
}

func point(_ d: Double) -> Point {
    point(d, d, d)
}

extension Point {
    var isPoint: Bool { w ==~ 1.0 }
}
