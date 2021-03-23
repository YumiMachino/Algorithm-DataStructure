//
//  LCA.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/23.
//

import Foundation

/*
 LCA (Lowest Common Ancestor)
 N vertices are given. Each vertex in the tree is numbered from 1 to N, and the root is number 1. Given a pair of two nodes M, write a program to print the Lowest Common Ancestor (LCA) of the two nodes. (This is an n-ary tree)
 (Time Complexity: O(n))

 Input Specification
 First line: N (The number of nodes, 2 <= N <= 50,000)
 Next N-1 lines: two nodes connected on the tree are given.
 N+1 th line: M (The number of pairs to process LCA, 1 <= M <= 10,000)
 Next M lines: each line represents two nodes to get the LCA


 Output Specification
 Outputs the Lowest Common Ancestor of the two nodes (M lines)

 */


func lowestCommonAncestor(){
    // input spec
    let n = Int(readLine()!)!
    var adj = [[Int]](repeating: [], count: n + 1)
    
    // first sample input
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ").map { Int($0)!}
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v)
        adj[v].append(u)
    }
    print(adj)
    
    // get num of pairs to process (m)
    let m = Int(readLine()!)!
    var arr = [[Int]](repeating: [], count: m)
    
    for i in 0..<m {
        let edge = readLine()!.split(separator: " ").map { Int($0)!}
        arr[i].append(contentsOf: edge)
    }
    print(arr)
//
//    // find the common ancestor of 2 nodes (loop through parents until they are the same?)
//    let first = arr[0][0]   // 6
//    let second = arr[0][1]  // 11
//
//    let ancestorsOfFirst = adj[first]      // 6's ancestor -> 2
//    let ancestorsOfSecond = adj[second]     // 11's ancestors = 5, 15
//
//    // case when both ancestors are matched
//    if ancestorsOfFirst.count == 1 && ancestorsOfSecond.count == 1 && ancestorsOfFirst == ancestorsOfSecond {
//        print(ancestorsOfFirst)
//    }
//
//    // case when only there is 1
//    if ancestorsOfFirst.count == 1 {
//        for i in 0...ancestorsOfSecond.count {
//            if ancestorsOfSecond[i] == ancestorsOfFirst {
//                print(ancestorsOfSecond)
//            } else {
//
//            }
//        }
    }
}



// arr: [[], [2, 3], [1, 4, 6, 5], [1, 7, 8], [2, 9, 10], [2, 11, 12], [2], [3, 13, 14], [3], [4], [4], [5, 15], [5], [7], [7], [11]]
// firstInput: 6
// secondInput: 11
// search through array inside array: recursion
func recursion(firstInput: Int, secondInput: Int, arr: inout [[Int]], firstDepth: inout [Int], secondDepth: inout [Int], count: Int) {
    
    // base case
    // find match in firstDepth array and secondDepth array
    for i in 0...secondDepth.count {
        if firstDepth.contains(secondDepth[i]) {
            print(secondDepth[i])
        }
    }
    
    // recursive case each
    
    // firstInput
    let first = arr[firstInput]
    if first.count != 1 {
        let count = first.count
        recursion(firstInput: first[0], secondInput: secondInput, arr: &arr, firstDepth: &firstDepth, secondDepth: &secondDepth, count: first.count)
    }
    firstDepth.append(contentsOf: first)
    
    // secondInput
    let second = arr[secondInput]
    secondDepth.append(contentsOf: second)
    
    
    
}
