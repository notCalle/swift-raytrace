//
//  Surface.swift
//  
//
//  Created by Calle Englund on 2019-12-01.
//

class Surface {
    let intersect: (Ray) -> [Double]

    init(intersect: @escaping (Ray) -> [Double]) {
        self.intersect = intersect
    }
}

// MARK: - Equatable
extension Surface: Equatable {
    static func == (lhs: Surface, rhs: Surface) -> Bool {
        lhs === rhs
    }
}
