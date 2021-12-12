import Foundation

private final class LabKitString {
    var array = [Character]()
    
    var string: String {
        return String(self.array)
    }
    
    init(_ string: String) { self.array = [Character](string) }
    init(_ array: [Character]) { self.array = array }
}



public extension String {
    
    subscript(labkit index: Int) -> Element {
        get {
            return LabKitString(self).array[index]
        }
        set {
            let lks = LabKitString(self)
            lks.array[index] = newValue
            self = lks.string
        }
    }
    
    subscript(from startIndex: Int) -> String {
        get {
            let lks = LabKitString(self)
            return String(lks.array[from: startIndex])
        }
        set {
            let lks = LabKitString(self)
            lks.array[from: lks.array.realIndex(of: startIndex), to: lks.array.count] = Array<Character>(newValue)
            self = lks.string
        }
    }
    
    subscript(from startIndex: Int = 0, to endIndex: Int) -> String {
        get {
            let lks = LabKitString(self)
            return String(lks.array[from: startIndex, to: lks.array.realIndex(of: endIndex)])
        }
        set {
            let lks = LabKitString(self)
            lks.array[from: lks.array.realIndex(of: startIndex), to: lks.array.realIndex(of: endIndex)] = Array<Character>(newValue)
            self = lks.string
        }
    }

}
