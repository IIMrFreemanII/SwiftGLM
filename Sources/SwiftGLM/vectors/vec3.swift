public struct vec3<T> where T: AdditiveArithmetic {
  public var x: T
  public var y: T
  public var z: T

  public init(_ x: T, _ y: T, _ z: T) {
    self.x = x
    self.y = y
    self.z = z
  }

  public init(_ value: T) {
    self.x = value
    self.y = value
    self.z = value
  }

  public static func + (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  public static func - (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }

  // Subscript for easy access
  public subscript(column: Int) -> T {
    get {
      switch column {
      case 0:
        return self.x
      case 1:
        return self.y
      case 2:
        return self.z
      default:
        fatalError("Index out of range")
      }
    }
    set {
      switch column {
      case 0:
        self.x = newValue
        return
      case 1:
        self.y = newValue
        return
      case 2:
        self.z = newValue
        return
      default:
        fatalError("Index out of range")
      }
    }
  }
}