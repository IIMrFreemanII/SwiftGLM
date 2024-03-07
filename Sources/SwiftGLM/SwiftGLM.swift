// The Swift Programming Language
// https://docs.swift.org/swift-book

struct vec3<T> where T : AdditiveArithmetic  {
  var x: T
  var y: T
  var z: T

  init(_ x: T, _ y: T, _ z: T) {
    self.x = x
    self.y = y
    self.z = z
  }

  static func + (lhs: Self, rhs: Self) -> Self {
    vec3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }
}