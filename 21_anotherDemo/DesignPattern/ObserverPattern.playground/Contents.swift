
import Foundation

@objcMembers public class KVOUser: NSObject {
    dynamic var name: String
    
    public init(name: String) {
        self.name = name
    }
}

print("KVO Example")

let kvoUser = KVOUser(name: "Ray")

var kvoObserver: NSKeyValueObservation? = kvoUser.observe(\.name, options: [.initial, .new]) { (user, change) in
    print("User's name is \(user.name)")
}

kvoUser.name = "Rockin ray"

kvoObserver = nil
kvoUser.name = "Ray has left building"


public class User {
    public let name: Observable<String>
    public init(name: String) {
        self.name = Observable(name)
    }
}

public class Observer { }

print("")
print("-- Observable Example --")

let user = User(name: "Madeline")
var observer: Observer? = Observer()

user.name.addObserver(observer!, options: [.initial, .new]) { (name, change) in
    print("User name is \(name)")
}

user.name.value = "Amelia"

observer = nil

user.name.value = "Amelia is outta here"
