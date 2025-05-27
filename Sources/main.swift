let consoleModeChosen = CommandLine.arguments.count == 1

let coefficientsSource: CoefficientsSource = consoleModeChosen 
    ? ConsoleCoefficientsSource() 
    : FileCoefficientsSource(
        path: CommandLine.arguments[1]
    )


let (a, b, c) = coefficientsSource.get()
let result = solveQuadraticEquation(a, b, c)

print("Equation is: (\(a)) x^2 + (\(b)) x + (\(c)) = 0")
printEquationResult(result)

func printEquationResult(_ result: QuadraticEquationResult) {
    if case let .twoRoots(x1, x2) = result {
        print("There are 2 roots:")
        print("x1 = \(x1)")
        print("x2 = \(x2)")
    }

    if case let .oneRoot(x) = result {
        print("There is 1 root:")
        print("x = \(x)")
    }

    if case .noRoots = result {
        print("No roots for such coefficients")
    }
}


func someUnnecessaryFunction() {
    print("Doing something unnecessary")
}