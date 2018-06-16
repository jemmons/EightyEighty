import Foundation



public struct Instruction {
  private let opcode: Opcode
  private let offset: Address
  private let operand: Address?
  
  public init(offset: Address, opcode: Opcode, operand: Address?) {
    self.offset = offset
    self.opcode = opcode
    self.operand = operand
  }
}



extension Instruction: CustomStringConvertible {
  public var description: String {
    var buf = String(format:"$%04X", offset)
    buf += ": " + opcode.description(operand: operand)
    return buf
  }
}
