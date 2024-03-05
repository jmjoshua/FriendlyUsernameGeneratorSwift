/// A random username generator.
public struct UsernameGenerator {
    private let options: Options

    public init(options: Options = .init()) {
        self.options = options
    }
    
    /// Generate a username with the options specified in the generator's options.
    /// The username includes an adjective and an animal name.
    /// Optionally, a hyphen between the adjective and animal can be included.
    /// A random number can also be included at the end of the username.
    /// - Returns: The username. Example: \"handy-dogfish788\"
    public func generateUsername() -> String {
        let randomAdjective = adjectives.randomElement() ?? ""
        let randomAnimal = animals.randomElement() ?? ""
        let separator = options.useHyphen ? "-" : ""
        let username = "\(randomAdjective)\(separator)\(randomAnimal)\(randomNumber(digits: options.randomNumberDigits))"

        return username
    }

    private func randomNumber(digits:Int) -> String {
        guard digits > 0 else { return "" }
        var number = String()
        for _ in 1...digits {
            number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}

/// The options for the username generator.
public struct Options {
    /// Whether to include a hyphen between the username's adjective and animal.
    public let useHyphen: Bool
    /// The number of digits the random number at the end of the username should include.
    /// If no random number is desired, set `0`.
    public let randomNumberDigits: Int

    public init(useHyphen: Bool = true, randomNumberDigits: Int = 3) {
        self.useHyphen = useHyphen
        self.randomNumberDigits = randomNumberDigits
    }
}
