//
//  Equality.swift
//  
//
//  Created by Calle Englund on 2019-12-01.
//

import simd

infix operator ==~: ComparisonPrecedence
infix operator !=~: ComparisonPrecedence

// MARK: - float

func ==~(lhs: Float, rhs: Float) -> Bool {
    lhs.nextUp >= rhs && rhs.nextUp >= lhs
}

func !=~(lhs: Float, rhs: Float) -> Bool {
    lhs.nextUp < rhs || rhs.nextUp < lhs
}

// MARK: - double

func ==~(lhs: Double, rhs: Double) -> Bool {
    lhs.nextUp >= rhs && rhs.nextUp >= lhs
}

func !=~(lhs: Double, rhs: Double) -> Bool {
    lhs.nextUp < rhs || rhs.nextUp < lhs
}

// MARK: - simd_float3 (Pixel)

func ==~(lhs: simd_float3, rhs: simd_float3) -> Bool {
    lhs.x ==~ rhs.x && lhs.y ==~ rhs.y && lhs.z ==~ rhs.z
}

func !=~(lhs: simd_float3, rhs: simd_float3) -> Bool {
    lhs.x !=~ rhs.x || lhs.y !=~ rhs.y || lhs.z !=~ rhs.z
}

// MARK: - simd_double4 (Point, Vector)

func ==~(lhs: simd_double4, rhs: simd_double4) -> Bool {
    lhs.x ==~ rhs.x && lhs.y ==~ rhs.y && lhs.z ==~ rhs.z && lhs.w ==~ rhs.w
}

func !=~(lhs: simd_double4, rhs: simd_double4) -> Bool {
    lhs.x !=~ rhs.x || lhs.y !=~ rhs.y || lhs.z !=~ rhs.z || lhs.w !=~ rhs.w
}
