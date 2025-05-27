struct ConsoleCoefficientsSource: CoefficientsSource {

    func get() -> (a: Double, b: Double, c: Double) {
        let a = getValidatedDouble(for: "a")
        let b = getValidatedDouble(for: "b")
        let c = getValidatedDouble(for: "c")

        return (a, b, c)
    }

    private func getValidatedDouble(for name: String) -> Double {
        while true {
            print("\(name) = ", terminator: "")

            guard let inputStr = readLine() else {
                print("Error. No input received")
                continue
            }
        
            guard let input = Double(inputStr) else {
                print("Error. Expected a valid real number, got \(inputStr) instead")
                continue
            }

            let aIsZero = name == "a" && input == 0
            if aIsZero {
                print("Error. Coefficient a cannot be zero")
                continue
            }

            return input
        }
    }

}