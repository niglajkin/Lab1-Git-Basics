func solveQuadraticEquation(_ a: Double, _ b: Double, _ c: Double) -> QuadraticEquationResult {
    let discriminator = b * b - 4 * a * c

    if discriminator == 0 { 
        return .oneRoot(
            x: -b / (2 * a) 
        )
    }

    if discriminator > 0 {
        return .twoRoots(
            x1: (-b - discriminator.squareRoot()) / (2 * a),
            x2: (-b + discriminator.squareRoot()) / (2 * a)
        )
    }

    return .noRoots
}