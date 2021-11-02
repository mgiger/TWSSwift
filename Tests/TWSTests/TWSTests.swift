import XCTest
import TWSSwift

final class TWSTests: XCTestCase {

	func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
		let bar = TWSBar()
        XCTAssertEqual(bar.open, 0)
    }
}
