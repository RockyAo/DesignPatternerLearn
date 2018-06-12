import UIKit

let app = UIApplication.shared

public class MySingleton {
    static let shared = MySingleton()
    
    private init() {}
}

let mySingleton = MySingleton.shared

let defaultFileManager = FileManager.default
let customFileManager = FileManager()

public class MySingletonPlus {
    static let shared = MySingletonPlus()
    public init() { }
}


let singletonPlus = MySingletonPlus.shared

let singletonPlus2 = MySingletonPlus()
