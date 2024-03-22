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

  // Subscript for easy access
  public subscript(column: Int) -> T {
    get {
      switch column {
      case 0:
        return self.x
      case 1:
        return self.y
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
      default:
        fatalError("Index out of range")
      }
    }
  }}