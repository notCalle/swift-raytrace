//
//  Hit.swift
//  
//
//  Created by Calle Englund on 2019-12-02.
//

struct Hit {
    let surface: Surface
    let position: Point
    let normal: Vector
}

extension Ray {
    func hit(_ world: Surface) -> Hit? {
        let isects = world.intersections(with: self).filter { $0.t > .ulpOfOne }
        guard let hit = isects.first
            else { return nil }

        let s = hit.surface
        let p = position(at: hit.t)
        let n = s.normalAt(p)

        return Hit(surface: s, position: p, normal: n)
    }
}
