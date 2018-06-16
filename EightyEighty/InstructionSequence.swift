import Foundation



public struct InstructionSequence: Sequence {
  private let data: Data
  
  public init(data: Data) {
    self.data = data
  }
  
  public func makeIterator() -> InstructionIterator {
    return InstructionIterator(byteIterator: data.makeIterator())
  }
}
