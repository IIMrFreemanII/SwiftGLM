public func dot(_ v1: vec3<Float>, _ v2: vec3<Float>) -> Float {
  return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
}

public func dot(_ v1: vec2<Float>, _ v2: vec2<Float>) -> Float {
  return v1.x * v2.x + v1.y * v2.y
}