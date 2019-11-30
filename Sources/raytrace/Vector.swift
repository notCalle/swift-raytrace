//
//  Vector.swift
//  
//
//  Created by Calle Englund on 2019-11-30.
//

import simd

typealias Vector = simd_double4

func vector(_ xyz: simd_double3) -> Vector {
    simd_make_double4(xyz, 0.0)
}

func vector(_ x: Double, _ y: Double, _ z: Double) -> Vector {
    simd_make_double4(x, y, z, 0.0)
}

func vector(_ d: Double) -> Vector {
    vector(d, d, d)
}

extension Vector {
    var isVector: Bool { w ==~ 0.0 }
}
