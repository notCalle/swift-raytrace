//
//  Quadratic.swift
//  
//
//  Created by Calle Englund on 2019-12-01.
//

/// Solve f(x) = ax^2 + bx + c, f(x) = 0 for Real values only
///
///     -b ± √bb-4ac
///     ------------
///          2a
///
/// - Parameters:
///   - a: quadratic coefficient
///   - b: linear coefficient
///   - c: constant coefficient
func quadratic(_ a: Double, _ b: Double, _ c: Double) -> (Double, Double)? {
    let discriminant = b*b - 4*a*c

    if discriminant < 0 {
        return .none
    } else if discriminant == 0 {
        let x = -0.5 * b / a
        return (x, x)
    } else {
        let d = discriminant.squareRoot()
        return (-0.5 * (b + d) / a,
                -0.5 * (b - d) / a)
    }
}
