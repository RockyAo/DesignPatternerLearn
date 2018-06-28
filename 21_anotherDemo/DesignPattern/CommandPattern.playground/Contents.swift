import Foundation

public class Door {
    public var isOpen = false
}

public class DoorCammand {
    public let door: Door
    public init(_ door: Door) {
        self.door = door
    }
    public func execute() {
        
    }
}

public class OpenCommand: DoorCammand {
    public override func execute() {
        print("opening the door")
        door.isOpen = true
    }
}

public class CloseCommand: DoorCammand {
    public override func execute() {
        print("Closing the door")
        door.isOpen = false
    }
}


public class Doorman {
    public let commands: [DoorCammand]
    public let door: Door
    
    public init(door: Door) {
        let commandCount = arc4random_uniform(10) + 1
        self.commands = (0..<commandCount).map({ (index) in
            return index % 2 == 0 ? OpenCommand(door) : CloseCommand(door)
        })
        self.door = door
    }
    
    public func excute() {
        print("doorman is")
        commands.forEach{
            $0.execute()
        }
    }
}


public let isOpen = true
print("You predict the door will be" + "\(isOpen ? "open" : "closed").")
print()

let door = Door()
let doorman = Doorman(door: door)
doorman.excute()
print()

if door.isOpen == isOpen {
    print("You were right! :]")
} else {
    print("You were wrong! [:")
}

print("The door is \(door.isOpen ? "open" : "closed")")
