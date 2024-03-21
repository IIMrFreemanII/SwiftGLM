public func remap(
  _ value: Float,
  _ inMinMax: vec2<Float>,
  _ outMinMax: vec2<Float>
) -> Float {
  return outMinMax.x + (value - inMinMax.x) * (outMinMax.y - outMinMax.x)
    / (inMinMax.y - inMinMax.x)
}