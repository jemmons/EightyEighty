import Foundation



public struct Opcode {
  static let byteMap: [Byte: Opcode] = [
    0x00: Opcode("NOP", length: 1, cycleCount: 4),
    0x01: Opcode("LXI B,d16", length: 3, cycleCount: 10),
    0x02: Opcode("STAX B", length: 1, cycleCount: 7),
    0x03: Opcode("INX B", length: 1, cycleCount: 5),
    0x04: Opcode("INR B", length: 1, cycleCount: 5),
    0x05: Opcode("DCR B", length: 1, cycleCount: 5),
    0x06: Opcode("MVI B,d8", length: 2, cycleCount: 7),
    0x07: Opcode("RLC", length: 1, cycleCount: 4),
    0x08: Opcode("NOP", length: 1, cycleCount: 4, isAlternative: true),
    0x09: Opcode("DAD B", length: 1, cycleCount: 10),
    0x0A: Opcode("LDAX B", length: 1, cycleCount: 7),
    0x0B: Opcode("DCX B", length: 1, cycleCount: 5),
    0x0C: Opcode("INR C", length: 1, cycleCount: 5),
    0x0D: Opcode("DCR C", length: 1, cycleCount: 5),
    0x0E: Opcode("MVI C,d8", length: 2, cycleCount: 7),
    0x0F: Opcode("RRC", length: 1, cycleCount: 4),
    0x10: Opcode("NOP", length: 1, cycleCount: 4, isAlternative: true),
    0x11: Opcode("LXI D,d16", length: 3, cycleCount: 10),
    0x12: Opcode("STAX D", length: 1, cycleCount: 7),
    0x13: Opcode("INX D", length: 1, cycleCount: 5),
    0x14: Opcode("INR D", length: 1, cycleCount: 5),
    0x15: Opcode("DCR D", length: 1, cycleCount: 5),
    0x16: Opcode("MVI D,d8", length: 2, cycleCount: 7),
    0x17: Opcode("RAL", length: 1, cycleCount: 4),
    0x18: Opcode("NOP", length: 1, cycleCount: 4, isAlternative: true),
    0x19: Opcode("DAD D", length: 1, cycleCount: 10),
    0x1A: Opcode("LDAX D", length: 1, cycleCount: 7),
    0x1B: Opcode("DCX D", length: 1, cycleCount: 5),
    0x1C: Opcode("INR E", length: 1, cycleCount: 5),
    0x1D: Opcode("DCR E", length: 1, cycleCount: 5),
    0x1E: Opcode("MVI E,d8", length: 2, cycleCount: 7),
    0x1F: Opcode("RAR", length: 1, cycleCount: 4),
    0x20: Opcode("NOP", length: 1, cycleCount: 4, isAlternative: true),
    0x21: Opcode("LXI H,d16", length: 3, cycleCount: 10),
    0x22: Opcode("SHLD a16", length: 3, cycleCount: 16),
    0x23: Opcode("INX H", length: 1, cycleCount: 5),
    0x24: Opcode("INR H", length: 1, cycleCount: 5),
    0x25: Opcode("DCR H", length: 1, cycleCount: 5),
    0x26: Opcode("MVI H,d8", length: 2, cycleCount: 7),
    0x27: Opcode("DAA", length: 1, cycleCount: 4),
    0x28: Opcode("NOP", length: 1, cycleCount: 4, isAlternative: true),
    0x29: Opcode("DAD H", length: 1, cycleCount: 10),
    0x2A: Opcode("LHLD a16", length: 3, cycleCount: 16),
    0x2B: Opcode("DCX H", length: 1, cycleCount: 5),
    0x2C: Opcode("INR L", length: 1, cycleCount: 5),
    0x2D: Opcode("DCR L", length: 1, cycleCount: 5),
    0x2E: Opcode("MVI L,d8", length: 2, cycleCount: 7),
    0x2F: Opcode("CMA", length: 1, cycleCount: 4),
    0x30: Opcode("NOP", length: 1, cycleCount: 4, isAlternative: true),
    0x31: Opcode("LXI SP,d16", length: 3, cycleCount: 10),
    0x32: Opcode("STA a16", length: 3, cycleCount: 13),
    0x33: Opcode("INX SP", length: 1, cycleCount: 5),
    0x34: Opcode("INR M", length: 1, cycleCount: 10),
    0x35: Opcode("DCR M", length: 1, cycleCount: 10),
    0x36: Opcode("MVI M,d8", length: 2, cycleCount: 10),
    0x37: Opcode("STC", length: 1, cycleCount: 4),
    0x38: Opcode("NOP", length: 1, cycleCount: 4, isAlternative: true),
    0x39: Opcode("DAD SP", length: 1, cycleCount: 10),
    0x3A: Opcode("LDA a16", length: 3, cycleCount: 13),
    0x3B: Opcode("DCX SP", length: 1, cycleCount: 5),
    0x3C: Opcode("INR A", length: 1, cycleCount: 5),
    0x3D: Opcode("DCR A", length: 1, cycleCount: 5),
    0x3E: Opcode("MVI A,d8", length: 2, cycleCount: 7),
    0x3F: Opcode("CMC", length: 1, cycleCount: 4),
    0x40: Opcode("MOV B,B", length: 1, cycleCount: 5),
    0x41: Opcode("MOV B,C", length: 1, cycleCount: 5),
    0x42: Opcode("MOV B,D", length: 1, cycleCount: 5),
    0x43: Opcode("MOV B,E", length: 1, cycleCount: 5),
    0x44: Opcode("MOV B,H", length: 1, cycleCount: 5),
    0x45: Opcode("MOV B,L", length: 1, cycleCount: 5),
    0x46: Opcode("MOV B,M", length: 1, cycleCount: 7),
    0x47: Opcode("MOV B,A", length: 1, cycleCount: 5),
    0x48: Opcode("MOV C,B", length: 1, cycleCount: 5),
    0x49: Opcode("MOV C,C", length: 1, cycleCount: 5),
    0x4A: Opcode("MOV C,D", length: 1, cycleCount: 5),
    0x4B: Opcode("MOV C,E", length: 1, cycleCount: 5),
    0x4C: Opcode("MOV C,H", length: 1, cycleCount: 5),
    0x4D: Opcode("MOV C,L", length: 1, cycleCount: 5),
    0x4E: Opcode("MOV C,M", length: 1, cycleCount: 7),
    0x4F: Opcode("MOV C,A", length: 1, cycleCount: 5),
    0x50: Opcode("MOV D,B", length: 1, cycleCount: 5),
    0x51: Opcode("MOV D,C", length: 1, cycleCount: 5),
    0x52: Opcode("MOV D,D", length: 1, cycleCount: 5),
    0x53: Opcode("MOV D,E", length: 1, cycleCount: 5),
    0x54: Opcode("MOV D,H", length: 1, cycleCount: 5),
    0x55: Opcode("MOV D,L", length: 1, cycleCount: 5),
    0x56: Opcode("MOV D,M", length: 1, cycleCount: 7),
    0x57: Opcode("MOV D,A", length: 1, cycleCount: 5),
    0x58: Opcode("MOV E,B", length: 1, cycleCount: 5),
    0x59: Opcode("MOV E,C", length: 1, cycleCount: 5),
    0x5A: Opcode("MOV E,D", length: 1, cycleCount: 5),
    0x5B: Opcode("MOV E,E", length: 1, cycleCount: 5),
    0x5C: Opcode("MOV E,H", length: 1, cycleCount: 5),
    0x5D: Opcode("MOV E,L", length: 1, cycleCount: 5),
    0x5E: Opcode("MOV E,M", length: 1, cycleCount: 7),
    0x5F: Opcode("MOV E,A", length: 1, cycleCount: 5),
    0x60: Opcode("MOV H,B", length: 1, cycleCount: 5),
    0x61: Opcode("MOV H,C", length: 1, cycleCount: 5),
    0x62: Opcode("MOV H,D", length: 1, cycleCount: 5),
    0x63: Opcode("MOV H,E", length: 1, cycleCount: 5),
    0x64: Opcode("MOV H,H", length: 1, cycleCount: 5),
    0x65: Opcode("MOV H,L", length: 1, cycleCount: 5),
    0x66: Opcode("MOV H,M", length: 1, cycleCount: 7),
    0x67: Opcode("MOV H,A", length: 1, cycleCount: 5),
    0x68: Opcode("MOV L,B", length: 1, cycleCount: 5),
    0x69: Opcode("MOV L,C", length: 1, cycleCount: 5),
    0x6A: Opcode("MOV L,D", length: 1, cycleCount: 5),
    0x6B: Opcode("MOV L,E", length: 1, cycleCount: 5),
    0x6C: Opcode("MOV L,H", length: 1, cycleCount: 5),
    0x6D: Opcode("MOV L,L", length: 1, cycleCount: 5),
    0x6E: Opcode("MOV L,M", length: 1, cycleCount: 7),
    0x6F: Opcode("MOV L,A", length: 1, cycleCount: 5),
    0x70: Opcode("MOV M,B", length: 1, cycleCount: 7),
    0x71: Opcode("MOV M,C", length: 1, cycleCount: 7),
    0x72: Opcode("MOV M,D", length: 1, cycleCount: 7),
    0x73: Opcode("MOV M,E", length: 1, cycleCount: 7),
    0x74: Opcode("MOV M,H", length: 1, cycleCount: 7),
    0x75: Opcode("MOV M,L", length: 1, cycleCount: 7),
    0x76: Opcode("HLT", length: 1, cycleCount: 7),
    0x77: Opcode("MOV M,A", length: 1, cycleCount: 7),
    0x78: Opcode("MOV A,B", length: 1, cycleCount: 5),
    0x79: Opcode("MOV A,C", length: 1, cycleCount: 5),
    0x7A: Opcode("MOV A,D", length: 1, cycleCount: 5),
    0x7B: Opcode("MOV A,E", length: 1, cycleCount: 5),
    0x7C: Opcode("MOV A,H", length: 1, cycleCount: 5),
    0x7D: Opcode("MOV A,L", length: 1, cycleCount: 5),
    0x7E: Opcode("MOV A,M", length: 1, cycleCount: 7),
    0x7F: Opcode("MOV A,A", length: 1, cycleCount: 5),
    0x80: Opcode("ADD B", length: 1, cycleCount: 4),
    0x81: Opcode("ADD C", length: 1, cycleCount: 4),
    0x82: Opcode("ADD D", length: 1, cycleCount: 4),
    0x83: Opcode("ADD E", length: 1, cycleCount: 4),
    0x84: Opcode("ADD H", length: 1, cycleCount: 4),
    0x85: Opcode("ADD L", length: 1, cycleCount: 4),
    0x86: Opcode("ADD M", length: 1, cycleCount: 7),
    0x87: Opcode("ADD A", length: 1, cycleCount: 4),
    0x88: Opcode("ADC B", length: 1, cycleCount: 4),
    0x89: Opcode("ADC C", length: 1, cycleCount: 4),
    0x8A: Opcode("ADC D", length: 1, cycleCount: 4),
    0x8B: Opcode("ADC E", length: 1, cycleCount: 4),
    0x8C: Opcode("ADC H", length: 1, cycleCount: 4),
    0x8D: Opcode("ADC L", length: 1, cycleCount: 4),
    0x8E: Opcode("ADC M", length: 1, cycleCount: 7),
    0x8F: Opcode("ADC A", length: 1, cycleCount: 4),
    0x90: Opcode("SUB B", length: 1, cycleCount: 4),
    0x91: Opcode("SUB C", length: 1, cycleCount: 4),
    0x92: Opcode("SUB D", length: 1, cycleCount: 4),
    0x93: Opcode("SUB E", length: 1, cycleCount: 4),
    0x94: Opcode("SUB H", length: 1, cycleCount: 4),
    0x95: Opcode("SUB L", length: 1, cycleCount: 4),
    0x96: Opcode("SUB M", length: 1, cycleCount: 7),
    0x97: Opcode("SUB A", length: 1, cycleCount: 4),
    0x98: Opcode("SBB B", length: 1, cycleCount: 4),
    0x99: Opcode("SBB C", length: 1, cycleCount: 4),
    0x9A: Opcode("SBB D", length: 1, cycleCount: 4),
    0x9B: Opcode("SBB E", length: 1, cycleCount: 4),
    0x9C: Opcode("SBB H", length: 1, cycleCount: 4),
    0x9D: Opcode("SBB L", length: 1, cycleCount: 4),
    0x9E: Opcode("SBB M", length: 1, cycleCount: 7),
    0x9F: Opcode("SBB A", length: 1, cycleCount: 4),
    0xA0: Opcode("ANA B", length: 1, cycleCount: 4),
    0xA1: Opcode("ANA C", length: 1, cycleCount: 4),
    0xA2: Opcode("ANA D", length: 1, cycleCount: 4),
    0xA3: Opcode("ANA E", length: 1, cycleCount: 4),
    0xA4: Opcode("ANA H", length: 1, cycleCount: 4),
    0xA5: Opcode("ANA L", length: 1, cycleCount: 4),
    0xA6: Opcode("ANA M", length: 1, cycleCount: 7),
    0xA7: Opcode("ANA A", length: 1, cycleCount: 4),
    0xA8: Opcode("XRA B", length: 1, cycleCount: 4),
    0xA9: Opcode("XRA C", length: 1, cycleCount: 4),
    0xAA: Opcode("XRA D", length: 1, cycleCount: 4),
    0xAB: Opcode("XRA E", length: 1, cycleCount: 4),
    0xAC: Opcode("XRA H", length: 1, cycleCount: 4),
    0xAD: Opcode("XRA L", length: 1, cycleCount: 4),
    0xAE: Opcode("XRA M", length: 1, cycleCount: 7),
    0xAF: Opcode("XRA A", length: 1, cycleCount: 4),
    0xB0: Opcode("ORA B", length: 1, cycleCount: 4),
    0xB1: Opcode("ORA C", length: 1, cycleCount: 4),
    0xB2: Opcode("ORA D", length: 1, cycleCount: 4),
    0xB3: Opcode("ORA E", length: 1, cycleCount: 4),
    0xB4: Opcode("ORA H", length: 1, cycleCount: 4),
    0xB5: Opcode("ORA L", length: 1, cycleCount: 4),
    0xB6: Opcode("ORA M", length: 1, cycleCount: 7),
    0xB7: Opcode("ORA A", length: 1, cycleCount: 4),
    0xB8: Opcode("CMP B", length: 1, cycleCount: 4),
    0xB9: Opcode("CMP C", length: 1, cycleCount: 4),
    0xBA: Opcode("CMP D", length: 1, cycleCount: 4),
    0xBB: Opcode("CMP E", length: 1, cycleCount: 4),
    0xBC: Opcode("CMP H", length: 1, cycleCount: 4),
    0xBD: Opcode("CMP L", length: 1, cycleCount: 4),
    0xBE: Opcode("CMP M", length: 1, cycleCount: 7),
    0xBF: Opcode("CMP A", length: 1, cycleCount: 4),
    0xC0: Opcode("RNZ", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xC1: Opcode("POP B", length: 1, cycleCount: 10),
    0xC2: Opcode("JNZ a16", length: 3, cycleCount: 10),
    0xC3: Opcode("JMP a16", length: 3, cycleCount: 10),
    0xC4: Opcode("CNZ a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xC5: Opcode("PUSH B", length: 1, cycleCount: 11),
    0xC6: Opcode("ADI d8", length: 2, cycleCount: 7),
    0xC7: Opcode("RST 0", length: 1, cycleCount: 11),
    0xC8: Opcode("RZ", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xC9: Opcode("RET", length: 1, cycleCount: 10),
    0xCA: Opcode("JZ a16", length: 3, cycleCount: 10),
    0xCB: Opcode("JMP a16", length: 3, cycleCount: 10, isAlternative: true),
    0xCC: Opcode("CZ a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xCD: Opcode("CALL a16", length: 3, cycleCount: 17),
    0xCE: Opcode("ACI d8", length: 2, cycleCount: 7),
    0xCF: Opcode("RST 1", length: 1, cycleCount: 11),
    0xD0: Opcode("RNC", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xD1: Opcode("POP D", length: 1, cycleCount: 10),
    0xD2: Opcode("JNC a16", length: 3, cycleCount: 10),
    0xD3: Opcode("OUT d8", length: 2, cycleCount: 10),
    0xD4: Opcode("CNC a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xD5: Opcode("PUSH D", length: 1, cycleCount: 11),
    0xD6: Opcode("SUI d8", length: 2, cycleCount: 7),
    0xD7: Opcode("RST 2", length: 1, cycleCount: 11),
    0xD8: Opcode("RC", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xD9: Opcode("RET", length: 1, cycleCount: 10, isAlternative: true),
    0xDA: Opcode("JC a16", length: 3, cycleCount: 10),
    0xDB: Opcode("IN d8", length: 2, cycleCount: 10),
    0xDC: Opcode("CC a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xDD: Opcode("CALL a16", length: 3, cycleCount: 17, isAlternative: true),
    0xDE: Opcode("SBI d8", length: 2, cycleCount: 7),
    0xDF: Opcode("RST 3", length: 1, cycleCount: 11),
    0xE0: Opcode("RPO", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xE1: Opcode("POP H", length: 1, cycleCount: 10),
    0xE2: Opcode("JPO a16", length: 3, cycleCount: 10),
    0xE3: Opcode("XTHL", length: 1, cycleCount: 18),
    0xE4: Opcode("CPO a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xE5: Opcode("PUSH H", length: 1, cycleCount: 11),
    0xE6: Opcode("ANI d8", length: 2, cycleCount: 7),
    0xE7: Opcode("RST 4", length: 1, cycleCount: 11),
    0xE8: Opcode("RPE", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xE9: Opcode("PCHL", length: 1, cycleCount: 5),
    0xEA: Opcode("JPE a16", length: 3, cycleCount: 10),
    0xEB: Opcode("XCHG", length: 1, cycleCount: 5),
    0xEC: Opcode("CPE a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xED: Opcode("CALL a16", length: 3, cycleCount: 17, isAlternative: true),
    0xEE: Opcode("XRI d8", length: 2, cycleCount: 7),
    0xEF: Opcode("RST 5", length: 1, cycleCount: 11),
    0xF0: Opcode("RP", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xF1: Opcode("POP PSW", length: 1, cycleCount: 10),
    0xF2: Opcode("JP a16", length: 3, cycleCount: 10),
    0xF3: Opcode("DI", length: 1, cycleCount: 4),
    0xF4: Opcode("CP a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xF5: Opcode("PUSH PSW", length: 1, cycleCount: 11),
    0xF6: Opcode("ORI d8", length: 2, cycleCount: 7),
    0xF7: Opcode("RST 6", length: 1, cycleCount: 11),
    0xF8: Opcode("RM", length: 1, cycleCount: 11, noOpCycleCount: 5),
    0xF9: Opcode("SPHL", length: 1, cycleCount: 5),
    0xFA: Opcode("JM a16", length: 3, cycleCount: 10),
    0xFB: Opcode("EI", length: 1, cycleCount: 4),
    0xFC: Opcode("CM a16", length: 3, cycleCount: 17, noOpCycleCount: 11),
    0xFD: Opcode("CALL a16", length: 3, cycleCount: 17, isAlternative: true),
    0xFE: Opcode("CPI d8", length: 2, cycleCount: 7),
    0xFF: Opcode("RST 7", length: 1, cycleCount: 11),
  ]
  
  public let mnemonic: String
  public let cycleCount: Int
  public let noOpCycleCount: Int?
  public let length: Int
  public let isAlternative: Bool
  
  public init(_ mnemonic: String, length: Int, cycleCount: Int, noOpCycleCount: Int? = nil, isAlternative: Bool = false) {
    self.mnemonic = mnemonic
    self.length = length
    self.cycleCount = cycleCount
    self.noOpCycleCount = noOpCycleCount
    self.isAlternative = isAlternative
  }
}



public extension Opcode {
  func description(operand: Address?) -> String {
    guard
      let someOperand = operand,
      let someType = operandType else {
        return description
    }

    return description.replacingOccurrences(of: someType.rawValue, with: someType.formatted(operand: someOperand))
  }
}


extension Opcode: CustomStringConvertible {
  public var description: String {
    var buf = ""
    if isAlternative {
      buf += "*"
    }
    buf += mnemonic
    return buf
  }
}



private extension Opcode {
  enum OperandType: String {
    case immediate8 = "d8"
    case immediate16 = "d16"
    case address = "a16"
    
    func formatted(operand: Address) -> String {
      switch self {
      case .immediate8:
        return String(format: "#0x%02X", operand)
      case .immediate16:
        return String(format: "#0x%04X", operand)
      case .address:
        return String(format: "($%04X)", operand)
      }
    }
  }
  
  
  var operandType: OperandType? {
    return [OperandType.immediate8, OperandType.immediate16, OperandType.address].first { type in
      return mnemonic.contains(type.rawValue)
    }
  }
}


