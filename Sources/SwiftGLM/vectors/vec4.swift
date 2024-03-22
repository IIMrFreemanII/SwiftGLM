public struct vec4<T> where T: AdditiveArithmetic {
  public var x: T
  public var y: T
  public var z: T
  public var w: T
}

extension vec4 {
  public init(_ x: T, _ y: T, _ z: T, _ w: T) {
    self.x = x
    self.y = y
    self.z = z
    self.w = w
  }

  public init(_ value: T) {
    self.x = value
    self.y = value
    self.z = value
    self.w = value
  }
}

extension vec4 {
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
      case 3:
        return self.w
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
      case 3:
        self.w = newValue
        return
      default:
        fatalError("Index out of range")
      }
    }
  }
}

extension vec4 {
  public static func + (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
  }

  public static func - (lhs: Self, rhs: Self) -> Self {
    Self(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
  }
}
