import Foundation

public typealias vec3f = vec3<Float>

extension vec3f {
  public var normalized: Self {
    let magnitude = sqrt(self.x * self.x + self.y * self.y + self.z * self.z)

    // Handle potential division by zero
    guard magnitude > 0 else { return Self(0, 0, 0) }

    return Self(self.x / magnitude, self.y / magnitude, self.z / magnitude)
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

extension vec3f {
  public static let up = vec3f(0, 1, 0)
  public static let down = vec3f(0, -1, 0)

  public static let left = vec3f(-1, 0, 0)
  public static let right = vec3f(1, 0, 0)

  public static let forward = vec3f(0, 0, 1)
  public static let back = vec3f(0, 0, -1)
}