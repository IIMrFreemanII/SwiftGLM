import Foundation

public struct mat4 {
  var columns: (vec4<Float>, vec4<Float>, vec4<Float>, vec4<Float>)
}

extension mat4 {
  // Identity initializer
  public init(_ value: Float = 1) {
    self.columns = (
      vec4<Float>(value, 0, 0, 0),
      vec4<Float>(0, value, 0, 0),
      vec4<Float>(0, 0, value, 0),
      vec4<Float>(0, 0, 0, value)
    )
  }
  public init(_ c0: vec4<Float>, _ c1: vec4<Float>, _ c2: vec4<Float>, _ c3: vec4<Float>) {
    self.columns = (c0, c1, c2, c3)
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

extension mat4 {
  // Subscript for easy access
  public subscript(column: Int) -> vec4<Float> {
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
