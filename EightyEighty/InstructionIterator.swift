import Foundation



public struct InstructionIterator: IteratorProtocol {
  private var bytes: Data.Iterator
  private var offset: Address
  
  
  public init(byteIterator: Data.Iterator) {
    self.bytes = byteIterator
    offset = 0
  }
  
  
  public mutating func next() -> Instruction? {
    guard let byte = bytes.next() else { return nil }
    guard let opcode = Opcode.byteMap[byte] else { return nil }
    let operand = takeBytes(opcode.length - 1)
    let instruction = Instruction(offset: offset, opcode: opcode, operand: operand)
    offset += Address(opcode.length)
    return instruction
  }
  
  
  private mutating func takeBytes(_ n: Int) -> Address? {
    guard n > 0 else { return nil }
    var acc: Address = 0
    for i in 0..<n {
      guard let byte = bytes.next() else {
        return nil
      }
      acc += (Address(byte) << (8*i))
    }
    return acc
  }
}
