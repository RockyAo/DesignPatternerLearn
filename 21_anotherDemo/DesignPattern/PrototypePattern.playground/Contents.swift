
public protocol Copying: class {
    init(_ prototype: Self)
}


extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

public class Monster: Copying {
    public var health: Int
    public var level: Int
    
    public init(health: Int, level: Int) {
        self.health = health
        self.level = level
    }
    
    public required convenience init(_ monster: Monster) {
        self.init(health: monster.health, level: monster.level)
    }
}

public class EyeballMonster: Monster {
    public var redness = 0
    
    public init(health: Int, level: Int, redness: Int) {
        self.redness = redness
        super.init(health: health, level: level)
    }
    
    public required convenience init(_ prototype: Monster) {
        let eyeballMonster = prototype as! EyeballMonster
        self.init(health: eyeballMonster.health, level: eyeballMonster.level, redness: eyeballMonster.redness)
    }
}

let monster = Monster(health: 700, level: 37)
let monster2 = monster.copy()

print("Watch out! that monster's level is \(monster2.level)!")

let eyeBall = EyeballMonster(health: 3002, level: 60, redness: 999)
let eyeBall2 = eyeBall.copy()

print("Eww! Its eyeball redness is \(eyeBall2.redness)!")
