//
//  Light.swift
//  
//
//  Created by Calle Englund on 2019-12-06.
//

import simd

protocol Light {
    var color: Pixel { get }
    var power: Float { get }
    var transform: Transform { get set }

    func direction(to hit: Hit) -> Vector
    func illumination(for hit: Hit) -> Pixel
}

class BaseLight {
    let color: Pixel
    let power: Float
    var transform: Transform

    init(color: Pixel = .white,
         power: Float = 1,
         transform: Transform = .identity)
    {
        self.color = color
        self.power = power
        self.transform = transform
    }
}

class PointLight: BaseLight, Light {
    func direction(to hit: Hit) -> Vector {
        let position = transform * Point.point(0,0,0)
        return simd_normalize(hit.position - position)
    }

    func illumination(for hit: Hit) -> Pixel {
        let position = transform * Point.point(0,0,0)
        let hitV = hit.position - position
        let attenuation = Float(simd_dot(hitV, hitV))

        return color * power / attenuation
    }
}

// MARK: - Distant Light
class DistantLight: BaseLight, Light {
    func direction(to hit: Hit) -> Vector {
        transform * Vector.vector(0,0,1)
    }

    func illumination(for hit: Hit) -> Pixel {
        color * power
    }
}

// MARK: - Equatable
extension BaseLight: Equatable {
    static func == (lhs: BaseLight, rhs: BaseLight) -> Bool {
        lhs === rhs
    }
}
