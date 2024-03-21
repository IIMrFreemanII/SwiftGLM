// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

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

  public init(_ value: T) {
    self.x = value
    self.y = value
    self.z = value
    self.w = value
  }

  // Subscript for easy access
  subscript(column: Int) -> T {
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
  subscript(column: Int) -> T {
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
  subscript(column: Int) -> T {
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
  }
}

public typealias vec2f = vec2<Float>
public typealias vec3f = vec3<Float>
public typealias vec4f = vec4<Float>

extension vec2f {
  public var normalized: Self {
    let magnitude = sqrt(self.x * self.x + self.y * self.y)

    // Handle potential division by zero
    guard magnitude > 0 else { return Self(0, 0) }

    return Self(self.x / magnitude, self.y / magnitude)
  }
}

extension vec3f {
  public var normalized: Self {
    let magnitude = sqrt(self.x * self.x + self.y * self.y + self.z * self.z)

    // Handle potential division by zero
    guard magnitude > 0 else { return Self(0, 0, 0) }

    return Self(self.x / magnitude, self.y / magnitude, self.z / magnitude)
  }
}

extension vec4f {
  // Transforms the vec4f with a mat4.
  public static func * (v: Self, m: mat4) -> Self {
    return Self(
      v.x * m[0][0] + v.y * m[1][0] + v.z * m[2][0] + v.w * m[3][0],
      v.x * m[0][1] + v.y * m[1][1] + v.z * m[2][1] + v.w * m[3][1],
      v.x * m[0][2] + v.y * m[1][2] + v.z * m[2][2] + v.w * m[3][2],
      v.x * m[0][3] + v.y * m[1][3] + v.z * m[2][3] + v.w * m[3][3]
    )
  }
  public static func * (m: mat4, v: Self) -> Self {
    return v * m
  }
}

extension vec3f {
  // Transforms the vec3f with a mat4.
  // 4th vector component is implicitly '1'
  public static func * (v: Self, m: mat4) -> Self {
    var w = v.x * m[0][3] + v.y * m[1][3] + v.z * m[2][3] + m[3][3]
    w = w == 0 ? 1 : w

    return Self(
      (v.x * m[0][0] + v.y * m[1][0] + v.z * m[2][0] + m[3][0]) / w,
      (v.x * m[0][1] + v.y * m[1][1] + v.z * m[2][1] + m[3][1]) / w,
      (v.x * m[0][2] + v.y * m[1][2] + v.z * m[2][2] + m[3][2]) / w
    )
  }

  public static func * (m: mat4, v: Self) -> Self {
    return v * m
  }
}

// extension vec2f {
//   public static func * (v: Self, m: mat4) -> Self {
//     return Self(
//       v.x * m[0][0] + v.y * m[1][0],
//       v.x * m[0][1] + v.y * m[1][1]
//     )
//   }
// }

public func dot(_ v1: vec3<Float>, _ v2: vec3<Float>) -> Float {
  return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
}

public func dot(_ v1: vec2<Float>, _ v2: vec2<Float>) -> Float {
  return v1.x * v2.x + v1.y * v2.y
}

public func cross(_ v1: vec3<Float>, _ v2: vec3<Float>) -> vec3<Float> {
  return vec3<Float>(
    (v1.y * v2.z) - (v1.z * v2.y),
    (v1.z * v2.x) - (v1.x * v2.z),
    (v1.x * v2.y) - (v1.y * v2.x)
  )
}

// How to type π
// macOS
// Option + p

// Windows
// Make sure Num Lock is on.
// Hold down the Alt key.
// Type 227 on the numeric keypad.
// Release the Alt key.
public let π = Float.pi

extension Float {
  public var radiansToDegrees: Float {
    (self / π) * 180
  }
  public var degreesToRadians: Float {
    (self / 180) * π
  }
}

// mat4
public struct mat4 {
  var columns: (vec4<Float>, vec4<Float>, vec4<Float>, vec4<Float>)

  // Identity initializer
  init(_ value: Float = 1) {
    self.columns = (
      vec4<Float>(value, 0, 0, 0),
      vec4<Float>(0, value, 0, 0),
      vec4<Float>(0, 0, value, 0),
      vec4<Float>(0, 0, 0, value)
    )
  }
  init(_ c0: vec4<Float>, _ c1: vec4<Float>, _ c2: vec4<Float>, _ c3: vec4<Float>) {
    self.columns = (c0, c1, c2, c3)
  }

  // Subscript for easy access
  subscript(column: Int) -> vec4<Float> {
    get {
      switch column {
      case 0:
        return self.columns.0
      case 1:
        return self.columns.1
      case 2:
        return self.columns.2
      case 3:
        return self.columns.3
      default:
        fatalError("Index out of range")
      }
    }
    set {
      switch column {
      case 0:
        self.columns.0 = newValue
        return
      case 1:
        self.columns.1 = newValue
        return
      case 2:
        self.columns.2 = newValue
        return
      case 3:
        self.columns.3 = newValue
        return
      default:
        fatalError("Index out of range")
      }
    }
  }

}

extension mat4 {
  public static func * (lhs: Self, rhs: Self) -> Self {
    var result = Self(0)

    // Multiply
    for i in 0..<4 {
      for j in 0..<4 {
        for k in 0..<4 {
          result[i][j] += lhs[i][k] * rhs[k][j]
        }
      }
    }

    return result
  }
}
extension mat4: CustomStringConvertible {
  private func formatFloat(_ value: Float) -> String {
    return String(format: "%.3f", value)
  }
  public var description: String {
    return """
      mat4<Float>
      \(self.formatFloat(self[0][0])), \(self.formatFloat(self[1][0])), \(self.formatFloat(self[2][0])), \(self.formatFloat(self[3][0])) 
      \(self.formatFloat(self[0][1])), \(self.formatFloat(self[1][1])), \(self.formatFloat(self[2][1])), \(self.formatFloat(self[3][1]))
      \(self.formatFloat(self[0][2])), \(self.formatFloat(self[1][2])), \(self.formatFloat(self[2][2])), \(self.formatFloat(self[3][2]))
      \(self.formatFloat(self[0][3])), \(self.formatFloat(self[1][3])), \(self.formatFloat(self[2][3])), \(self.formatFloat(self[3][3]))
      """
  }
}

// translate
public func translate(_ translation: vec3<Float>) -> mat4 {
  return mat4(
    vec4f(1, 0, 0, 0),
    vec4f(0, 1, 0, 0),
    vec4f(0, 0, 1, 0),
    vec4f(translation.x, translation.y, translation.z, 1))
}
// scale
public func scale(_ scaling: vec3<Float>) -> mat4 {
  return mat4(
    vec4f(scaling.x, 0, 0, 0),
    vec4f(0, scaling.y, 0, 0),
    vec4f(0, 0, scaling.z, 0),
    vec4f(0, 0, 0, 1))
}
// rotate
public func rotateX(_ angle: Float) -> mat4 {
  return mat4(
    vec4f(1, 0, 0, 0),
    vec4f(0, cos(angle), sin(angle), 0),
    vec4f(0, -sin(angle), cos(angle), 0),
    vec4f(0, 0, 0, 1)
  )
}
public func rotateY(_ angle: Float) -> mat4 {
  return mat4(
    vec4f(cos(angle), 0, -sin(angle), 0),
    vec4f(0, 1, 0, 0),
    vec4f(sin(angle), 0, cos(angle), 0),
    vec4f(0, 0, 0, 1)
  )
}
public func rotateZ(_ angle: Float) -> mat4 {
  return mat4(
    vec4f(cos(angle), sin(angle), 0, 0),
    vec4f(-sin(angle), cos(angle), 0, 0),
    vec4f(0, 0, 1, 0),
    vec4f(0, 0, 0, 1)
  )
}
public func rotate(_ angle: vec3<Float>) -> mat4 {
  let rotationX = rotateX(angle.x)
  let rotationY = rotateY(angle.y)
  let rotationZ = rotateZ(angle.z)
  return rotationX * rotationY * rotationZ
}

// Left handed projection matrix
public func perspective(fov: Float, near: Float, far: Float, aspect: Float, lhs: Bool = true)
  -> mat4
{
  let y = 1 / tan(fov * 0.5)
  let x = y / aspect
  let z = lhs ? far / (far - near) : far / (near - far)
  let X = vec4<Float>(x, 0, 0, 0)
  let Y = vec4<Float>(0, y, 0, 0)
  let Z = lhs ? vec4<Float>(0, 0, z, 1) : vec4<Float>(0, 0, z, -1)
  let W = lhs ? vec4<Float>(0, 0, z * -near, 0) : vec4<Float>(0, 0, z * near, 0)

  return mat4(X, Y, Z, W)
}

// Orthographic matrix
public func orthographic(
  left: Float, right: Float, bottom: Float, top: Float, near: Float, far: Float
) -> mat4 {
  let invRL = 1 / (right - left)
  let invTB = 1 / (top - bottom)
  let invFN = 1 / (far - near)

  let X = vec4<Float>(2 * invRL, 0, 0, 0)
  let Y = vec4<Float>(0, 2 * invTB, 0, 0)
  let Z = vec4<Float>(0, 0, -invFN, 0)
  let W = vec4<Float>(
    -(right + left) * invRL,
    -(top + bottom) * invTB,
    -(far + near) * invFN,
    1
  )

  return mat4(X, Y, Z, W)
}

// left-handed LookAt
public func lookAt(eye: vec3<Float>, center: vec3<Float>, up: vec3<Float>) -> mat4 {
  let zAxis = (center - eye).normalized
  let xAxis = cross(up, zAxis).normalized
  let yAxis = cross(zAxis, xAxis)

  let x = vec4<Float>(xAxis.x, yAxis.x, zAxis.x, 0)
  let y = vec4<Float>(xAxis.y, yAxis.y, zAxis.y, 0)
  let z = vec4<Float>(xAxis.z, yAxis.z, zAxis.z, 0)
  let w = vec4<Float>(-dot(xAxis, eye), -dot(yAxis, eye), -dot(zAxis, eye), 1)

  return mat4(x, y, z, w)
}

public func remap(
  _ value: Float,
  _ inMinMax: vec2<Float>,
  _ outMinMax: vec2<Float>
) -> Float {
  return outMinMax.x + (value - inMinMax.x) * (outMinMax.y - outMinMax.x)
    / (inMinMax.y - inMinMax.x)
}

public func lerp(min: Float, max: Float, t: Float) -> Float {
  return (max - min) * t + min
}

public func normalize(value: Float, min: Float, max: Float) -> Float {
  return (value - min) / (max - min)
}
