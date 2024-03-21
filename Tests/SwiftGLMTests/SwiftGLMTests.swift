import XCTest

@testable import SwiftGLM

final class SwiftGLMTests: XCTestCase {
  func testExample() throws {
    // XCTest Documentation
    // https://developer.apple.com/documentation/xctest

    // Defining Test Cases and Test Methods
    // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

    // let mat1 = mat4()
    // let mat2 = mat4(2)
    // let result = mat1 * mat2
    // print(result)

    let mat1 = scale(vec3f(1, 2, 3))
    // let mat2 = translate(vec3f(1, 1, 1))
    // var result = mat1 * mat2
    var vec = mat1 * vec3f(0.5)

    print(mat1)
    print(vec)
  }
}
