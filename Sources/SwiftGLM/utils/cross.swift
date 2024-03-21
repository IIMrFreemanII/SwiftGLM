public func cross(_ v1: vec3<Float>, _ v2: vec3<Float>) -> vec3<Float> {
  return vec3<Float>(
    (v1.y * v2.z) - (v1.z * v2.y),
    (v1.z * v2.x) - (v1.x * v2.z),
    (v1.x * v2.y) - (v1.y * v2.x)
  )
}