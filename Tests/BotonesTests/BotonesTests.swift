import XCTest
@testable import Botones

final class BotonesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Botones().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
