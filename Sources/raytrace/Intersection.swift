//
//  Intersection.swift
//  
//
//  Created by Calle Englund on 2019-12-01.
//

struct Intersection {
    let surface: Surface
    let t: Double
}

extension Surface {
    func intersections(with ray: Ray) -> [Intersection] {
        self.intersect(ray).map { Intersection(surface: self, t: $0) }
            .sorted { $0.t < $1.t }
    }
}
