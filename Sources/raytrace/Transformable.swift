//
//  Transformable.swift
//  
//
//  Created by Calle Englund on 2019-12-08.
//

import simd

protocol Transformable {
    var transform: Transform { get set }
}

extension Transformable {
    mutating func translate(to position: Point) {
        transform = transform * Transform.translate(to: position)
    }

    mutating func rotate(by angle: Double, around axis: Vector) {
        transform = transform * Transform.rotate(by: angle, around: axis)
    }
}
