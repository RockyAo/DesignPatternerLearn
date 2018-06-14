import Foundation

public class Observable<Type> {
    
    public var value: Type {
        didSet{
            removeNilObserverCallBacks()
            
            notifyCallBacks(value: oldValue, option: .old)
            notifyCallBacks(value: value, option: .new)
        }
    }
    public init(_ value: Type) {
        self.value = value
    }
    
    private var callBacks:[CallBack] = []
    
    private func removeNilObserverCallBacks() {
        callBacks = callBacks.filter{ $0.observer != nil }
    }
    
    private func notifyCallBacks(value: Type,
                                 option: ObservableOptions) {
        let callBacksToNotify = callBacks.filter{
            $0.options.contains(option)
        }
        
        callBacksToNotify.forEach { $0.closure(value, option) }
    }
    
    public func addObserver(_ observer: AnyObject,
                            removeIfExists: Bool = true,
                            options: [ObservableOptions] = [.new],
                            closure: @escaping (Type, ObservableOptions) -> Void) {
        
        if removeIfExists {
            removeObserver(observer)
        }
        
        let callBack = CallBack(observer: observer,
                                options: options,
                                closure: closure)
        
        callBacks.append(callBack)
        
        if options.contains(.initial) {
            closure(value, .initial)
        }
        
    }
    
    public func removeObserver(_ observer: AnyObject) {
        callBacks = callBacks.filter{ $0.observer !== observer }
    }
    
    fileprivate class CallBack {
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObservableOptions]
        fileprivate let closure: (Type,ObservableOptions) -> Void
        fileprivate init(observer: AnyObject,
                         options: [ObservableOptions],
                         closure: @escaping (Type, ObservableOptions) -> Void) {
            
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }
}

public struct ObservableOptions: OptionSet {
    
    public static let initial =
        ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

