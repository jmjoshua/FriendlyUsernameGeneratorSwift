import XCTest
@testable import FriendlyUsernameGeneratorSwift

final class FriendlyUsernameGeneratorSwiftTests: XCTestCase {
    func test_generateUsername_returnsUsername() throws {
        let sut = buildSut()

        let result = sut.generateUsername()

        let regex = try Regex("^.*-.*[0-9]{3}$")
        XCTAssert(result.contains(regex))
    }

    func test_generateUsername_containsNoSpaces() throws {
        let sut = buildSut()

        let result = sut.generateUsername()

        XCTAssertFalse(result.contains(" "))
    }

    func test_generateUsername_tenCharacterNumber() throws {
        let sut = buildSut(options: .init(randomNumberDigits: 10))

        let result = sut.generateUsername()

        let regex = try Regex("^.*-.*[0-9]{10}$")
        XCTAssert(result.contains(regex))
    }

    func test_generateUsername_noNumber() throws {
        let sut = buildSut(options: .init(randomNumberDigits: 0))

        let result = sut.generateUsername()

        let regex = try Regex("^.*-.*$")
        XCTAssert(result.contains(regex))
    }

    func test_generateUsername_noHyphen() throws {
        let sut = buildSut(options: .init(useHyphen: false))

        let result = sut.generateUsername()

        let regex = try Regex("^.*[0-9]{3}$")
        XCTAssert(result.contains(regex))
    }
}

private extension FriendlyUsernameGeneratorSwiftTests {
    func buildSut(options: Options = .init()) -> UsernameGenerator {
        .init(options: options)
    }
}
