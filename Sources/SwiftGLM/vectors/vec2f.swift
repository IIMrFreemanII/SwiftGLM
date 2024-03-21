import Foundation

public typealias vec2f = vec2<Float>

extension vec2f {
  public var normalized: Self {
    let magnitude = sqrt(self.x * self.x + self.y * self.y)

    // Handle potential division by zero
    guard magnitude > 0 else { return Self(0, 0) }

    return Self(self.x / magnitude, self.y / magnitude)
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