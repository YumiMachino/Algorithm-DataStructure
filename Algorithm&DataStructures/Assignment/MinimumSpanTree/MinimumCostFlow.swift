import Foundation

// copy-paste all your classes/structs used in the program.

//struct Edge {}
//class Graph {}
// ...

func solution() {
    // your main logic (input processing, algorithm, etc.)
    
    /// create adj list by input
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    /// num of vertices
    let n = firstLine[0]
    /// num of pipe
    let m = firstLine[1]
    /// cost of enhancer
    let d = firstLine[2]
    var adjList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
    var inactiveList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
 
    /// all the active pipes
    for i in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        let w = Int(edge[2])!
        /// check if in active edge
        if i >= n - 1 {
            inactiveList[u].append((v, w))
            inactiveList[v].append((u, w))
        }
        adjList[u].append((v, w))
        adjList[v].append((u, w))
    }
    print(adjList)
    print(inactiveList)

    /// store picked vertex
    var picked = [Int]()
    /// count activated
    var activated = 0
    
    if d != 0 {
  
    }
    
    
    // remove all your debugging print statements

    // print the result (make sure you follow the output specification)
}

// you can include as many helper functions as you want.
func helper1() {}

func heloper2() {}

// make sure you run the function (before you submit)
//solution()
