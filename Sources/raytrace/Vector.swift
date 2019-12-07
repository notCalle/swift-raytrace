//
//  Vector.swift
//  
//
//  Created by Calle Englund on 2019-11-30.
//

import simd

typealias Vector = simd_double4

extension Vector {
    static func vector(_ xyz: simd_double3) -> Vector {
        simd_make_double4(xyz, 0.0)
    }

    static func vector(_ x: Double, _ y: Double, _ z: Double) -> Vector {
        simd_make_double4(x, y, z, 0.0)
    }

    static func vector(_ d: Double) -> Vector {
        vector(d, d, d)
    }

    static let axisX = vector(1,0,0)
    static let axisY = vector(0,1,0)
    static let axisZ = vector(0,0,1)

    var isVector: Bool { w ==~ 0.0 }
}
