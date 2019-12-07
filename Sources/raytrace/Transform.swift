//
//  Transform.swift
//  
//
//  Created by Calle Englund on 2019-12-05.
//

import simd

typealias Transform = simd_double4x4

extension Transform {
    static let identity = Self(diagonal: simd_make_double4(1,1,1,1))

    static func translate(to position: Point) -> Transform {
        assert(position.isPoint)
        return simd_matrix(.vector(1,0,0),
                           .vector(0,1,0),
                           .vector(0,0,1),
                           position)
    }

    static func quaternion(_ quatd: simd_quatd) -> Transform {
        simd_matrix4x4(quatd)
    }

    static func rotate(by angle: Double, around axis: Vector) -> Transform {
        assert(axis.isVector)
        return quaternion(simd_quaternion(angle, simd_make_double3(axis)))
    }
}
