
public class MulticastDelegate<ProtocolType> {
    private class DelegateWrapper {
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    private var delegateWrappers: [DelegateWrapper]
    
    public var delegates: [ProtocolType] {
        delegateWrappers = delegateWrappers.filter{ $0.delegate != nil }
        return delegateWrappers.map { $0.delegate! } as! [ProtocolType]
    }
    
    public init(delegates: [ProtocolType] = []) {
        delegateWrappers = delegates.map {
            DelegateWrapper($0 as AnyObject)
        }
    }
    
    public func addDelegate(_ delegate: ProtocolType) {
        let wrapper = DelegateWrapper(delegate as AnyObject)
        delegateWrappers.append(wrapper)
    }
    
    public func removeDelegate(_ delegate:ProtocolType) {
        guard let index = delegateWrappers.index(where: { $0.delegate === (delegate as AnyObject) }) else { return }
        delegateWrappers.remove(at: index)
    }
    
    public func invokeDelegates(_ closure: (ProtocolType) -> ()) {
        delegates.forEach { closure($0) }
    }
}


public protocol EmergencyResponding {
    func notifyFire(at location: String)
    func notifyCarCrash(at location: String)
}


public class FireStation: EmergencyResponding {
    public func notifyFire(at location: String) {
        print("Firefighters were notified about a fire at" + location)
    }
    
    public func notifyCarCrash(at location: String) {
        print("Firefighter were notified about a car crash at" + location)
    }
}

public class PoliceStation: EmergencyResponding {
    
    public func notifyFire(at location: String) {
        print("Police were notified about a fire at "
            + location)
    }
    
    public func notifyCarCrash(at location: String) {
        print("Police were notified about a car crash at "
            + location)
    }
}

public class DispatchSystem {
    let multicastDelegate = MulticastDelegate<EmergencyResponding>()
}

let dispatch = DispatchSystem()
var policeStation: PoliceStation! = PoliceStation()
var fireStation: FireStation! = FireStation()

dispatch.multicastDelegate.addDelegate(policeStation)
dispatch.multicastDelegate.addDelegate(fireStation)

dispatch.multicastDelegate.invokeDelegates{
    $0.notifyFire(at: "Ray's house")
}

print()

fireStation = nil

dispatch.multicastDelegate.invokeDelegates {
    $0.notifyCarCrash(at: "Ray's garage!")
}
