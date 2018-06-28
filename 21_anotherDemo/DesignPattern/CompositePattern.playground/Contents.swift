
import Foundation


protocol File {
    var name: String { get set }
    func open()
}

final class eBook: File {
    var name: String
    var author: String
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
    
    func open() {
        print("Opening \(name) by \(author) in iBooks...\n")
    }
}


final class Music: File {
    var name: String
    var artist: String
    
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    
    func open() {
        print("Playing \(name) by \(artist) in iTunes...\n")
    }
}

final class Folder: File {
    var name: String
    lazy var files: [File] = []
    
    init(name: String) {
        self.name = name
    }
    
    func add(file: File) {
        files.append(file)
    }
    
    func open() {
        print("Displaying the following files in \(name) ...")
        
        files.forEach {
            print($0.name)
        }
        
        print()
    }
}

let psychoKiller = Music(name: "Psycho Killer", artist: "The Talking Heads")
let rebelRebel = Music(name: "Rebel Rebel", artist: "David Bowie")
let blisterInTheSun = Music(name: "Blister in the Sun", artist: "Violent Femmes")

let justKids = eBook(name: "Just Kids", author: "Patti Smith")

let documents = Folder(name: "Documents")
let musicFolder = Folder(name: "Great 70s Music")

documents.add(file: musicFolder)
documents.add(file: justKids)

musicFolder.add(file: psychoKiller)
musicFolder.add(file: rebelRebel)

blisterInTheSun.open()
justKids.open()

documents.open()
musicFolder.open()

