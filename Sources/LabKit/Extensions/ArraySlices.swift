import Foundation

public extension Array {
    subscript(labkit index: Int) -> Element {
        get { getElement(index: index) }
        set { setElement(index: index, value: newValue) }
    }

    subscript(from startIndex: Int) -> Array {
        get { getSubscript(from: realIndex(of: startIndex), to: self.endIndex) }
        set { setSubscript(from: realIndex(of: startIndex), to: self.endIndex, newValue: newValue) }
    }

    subscript(from startIndex: Int = 0, to endIndex: Int) -> Array {
        get { getSubscript(from: realIndex(of: startIndex), to: realIndex(of: endIndex)) }
        set { setSubscript(from: realIndex(of: startIndex), to: realIndex(of: endIndex), newValue: newValue) }
    }
}

extension Array {
    
    //MARK: - Index magic

    func realIndex(of index: Int) -> Int { index > 0 ? index : self.count + index }
    
    //MARK: - Subscript from to
    
    func getSubscript(
        from startIndex: Int,
        to endIndex: Int
    ) -> Array {
        return endIndex - startIndex >= 0 ? Array(self.prefix(upTo: endIndex).suffix(from: startIndex)) : []
    }
    
    mutating func setSubscript(
        from startIndex: Int,
        to endIndex: Int,
        newValue: Array<Element>
    ) {
        guard indices.contains(startIndex) && indices.contains(endIndex) else {
            self.insert(contentsOf: newValue, at: self.count)
            return
        }
        self.removeSubrange(startIndex..<endIndex)
        self.insert(contentsOf: newValue, at: startIndex)
    }
    
    //MARK: - Subscript signle value
    
    func getElement(index: Int) -> Element {
        self[realIndex(of: index)]
    }
    
    mutating func setElement(index: Int, value: Element) {
        self[realIndex(of: index)] = value
    }
    
}
