public func normalize(value: Float, min: Float, max: Float) -> Float {
  return (value - min) / (max - min)
}