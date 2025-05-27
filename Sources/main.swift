let consoleModeChosen = CommandLine.arguments.count == 1

let coefficientsSource: CoefficientsSource = consoleModeChosen 
    ? ConsoleCoefficientsSource() 
    : FileCoefficientsSource(
        path: CommandLine.arguments[1]
    )