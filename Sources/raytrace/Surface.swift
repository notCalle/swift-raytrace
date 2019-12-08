//
//  Surface.swift
//  
//
//  Created by Calle Englund on 2019-12-01.
//

class Surface: Transformable {
    var transform = Transform.identity

    func intersections(with ray: Ray) -> [Intersection] {
        let ray = ray.transformed(by: transform.inverse)

        return self.intersect(with: ray)
            .map { Intersection(surface: self, t: $0) }
            .sorted { $0.t < $1.t }
    }

    func intersect(with ray: Ray) -> [Double] {
        assert(false, "Surface.intersect(with:) must be overridden")
        return []
    }

    func normal(at position: Point) -> Vector {
        assert(false, "Surface.normal(at:) must be overridden")
        return .vector(0)
    }
}

// MARK: - Equatable
extension Surface: Equatable {
    static func == (lhs: Surface, rhs: Surface) -> Bool {
        lhs === rhs
    }
}
