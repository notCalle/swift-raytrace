//
//  group.swift
//  
//
//  Created by Calle Englund on 2019-12-07.
//

class Group: Surface {
    var surfaces: [Surface]

    init(surfaces: [Surface]) {
        self.surfaces = surfaces
    }

    init(_ surfaces: Surface ...) {
        self.surfaces = surfaces
    }

    override func intersections(with ray: Ray) -> [Intersection] {
        let ray = ray.transformed(by: transform.inverse)

        return surfaces.flatMap { $0.intersections(with: ray) }
            .sorted(by: { $0.t < $1.t })
    }
}
