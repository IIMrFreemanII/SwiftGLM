/**
  How to type π
  macOS
  Option + p

  Windows
  Make sure Num Lock is on.
  Hold down the Alt key.
  Type 227 on the numeric keypad.
  Release the Alt key.
 */
public let π = Float.pi

extension Float {
  public var radiansToDegrees: Float {
    (self / π) * 180
  }
  public var degreesToRadians: Float {
    (self / 180) * π
  }
}