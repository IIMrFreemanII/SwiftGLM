import XCTest
@testable import SwiftGLM

final class SwiftGLMTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        let value = vec3(Float(1), Float(1), Float(1))
        print("result: \(value + value)")
    }
}
