import LabKit
final class ArraySliceExample {
    
    static func example() {
        let array = [1, 2, 3, 4]
        print(array[labkit: -1])        // 4
        print(array[labkit: -2])        // 3
        print(array[from: 2])           // [3, 4]
        print(array[from: 1, to: 3])    // [2, 3, 4]
        print(array[from: -4, to: -1])  // [1, 2, 3]
    }
}
