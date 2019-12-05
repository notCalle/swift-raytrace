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
}
