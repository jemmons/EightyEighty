import Cocoa



class InstructionViewController: NSViewController {
  @IBOutlet weak var textView: NSTextView!
  @IBOutlet weak var tableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }

  
  var instructionArray: [Instruction]? {
    return representedObject as? [Instruction]
  }
  
  
  override var representedObject: Any? {
    didSet {
      tableView.reloadData()
    }
  }
}



extension InstructionViewController: NSTableViewDataSource {
  func numberOfRows(in tableView: NSTableView) -> Int {
    return instructionArray?.count ?? 0
  }
  
  func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
    guard let row = instructionArray?[row] else {
      return nil
    }
    switch tableColumn?.identifier {
    case NSUserInterfaceItemIdentifier("offset"):
      return row.description
    case NSUserInterfaceItemIdentifier("instruction"):
      return row.description
    default:
      return nil
    }
  }
}

