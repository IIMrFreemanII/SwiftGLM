// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct vec3<T> where T : AdditiveArithmetic  {
  public var x: T
  public var y: T
  public var z: T

  public init(_ x: T, _ y: T, _ z: T) {
    self.x = x
    self.y = y
    self.z = z
  }

  public static func + (lhs: Self, rhs: Self) -> Self {
    vec3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }
}