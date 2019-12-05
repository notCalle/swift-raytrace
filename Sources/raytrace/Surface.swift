//
//  Surface.swift
//  
//
//  Created by Calle Englund on 2019-12-01.
//

class Surface {
    let intersect: (Ray) -> [Double]
    let normalAt: (Point) -> Vector
    var transform = Transform.identity

    init(intersect: @escaping (Ray) -> [Double],
         normalAt: @escaping (Point) -> Vector)
    {
        self.intersect = intersect
        self.normalAt = normalAt
    }
}

// MARK: - Equatable
extension Surface: Equatable {
    static func == (lhs: Surface, rhs: Surface) -> Bool {
        lhs === rhs
    }
}
