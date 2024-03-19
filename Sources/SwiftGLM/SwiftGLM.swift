// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct vec4<T> where T: AdditiveArithmetic {
  public var x: T
  public var y: T
  public var z: T
  public var w: T

  public init(_ x: T, _ y: T, _ z: T, _ w: T) {
    self.x = x
    self.y = y
    self.z = z
    self.w = w
  }

  public static func + (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
  }

  public static func - (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
  }
}

public struct vec3<T> where T: AdditiveArithmetic {
  public var x: T
  public var y: T
  public var z: T

  public init(_ x: T, _ y: T, _ z: T) {
    self.x = x
    self.y = y
    self.z = z
  }

  public static func + (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  public static func - (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }
}

public struct vec2<T> where T: AdditiveArithmetic {
  public var x: T
  public var y: T

  public init(_ x: T, _ y: T) {
    self.x = x
    self.y = y
  }

  public static func + (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x + rhs.x, lhs.y + rhs.y)
  }

  public static func - (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x - rhs.x, lhs.y - rhs.y)
  }
}
