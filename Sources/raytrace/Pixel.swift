//
//  Pixel.swift
//  
//
//  Created by Calle Englund on 2019-12-03.
//

import simd

typealias Pixel = simd_float3

extension Pixel {
    static func gray(_ value: Float) -> Pixel {
        Pixel(value, value, value)
    }

    static func rgb(_ r: Float, _ g: Float, _ b: Float) -> Pixel {
        Pixel(r, g, b)
    }

    var r: Float { x }
    var g: Float { y }
    var b: Float { z }
}

// MARK: - Predefined colors
extension Pixel {
    static let white = gray(1)
    static let black = gray(0)
}
