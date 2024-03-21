public typealias vec4f = vec4<Float>

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