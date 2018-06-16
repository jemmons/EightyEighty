import Cocoa

class Document: NSDocument {
  private var instructionArray: [Instruction]?
  
  override init() {
    super.init()
  }

  
  override class var autosavesInPlace: Bool {
    return false
  }

  
  override func makeWindowControllers() {
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
    if let vc = windowController.contentViewController {
      vc.representedObject = instructionArray
    }
    
    self.addWindowController(windowController)
  }

  
  override func read(from data: Data, ofType typeName: String) throws {
    instructionArray = Array(InstructionSequence(data: data))
  }
}
