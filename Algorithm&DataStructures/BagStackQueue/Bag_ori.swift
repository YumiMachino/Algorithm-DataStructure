//
//  Bag.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/15.
//

import Foundation

// MARK: -  implement custom API
// What to think of?
// - access modifier (public or private)
// - make it possble to create sub class?


// MARK: - Bag: O(N)
// support: insertion and iterating (not ordered, no index)- add, isEmpty
// data in a bag using sinle 'linked list' using 'Node' (node with a pointer to next element)

// good when caring only about adding fast and iterate -> infinite scroll

// 'open'-> user can create subclass, and accessible from different module
// 'final' -> can not create subclass(convention to put it to make sure it can not be subclassed)
// 'public' -> can not be inherited in anyway
// E (element) -> generic type function
//public final class Bag<E>: Sequence{
//    /// the beginning of bag
//    private var first: Node<E>? = nil
//
//    ///  number of elements in hte bag, setter is private, getter is public
//    private(set) var count: Int = 0
//
//
//
//    ///fileprivate -> can not access from outside of this file (extensionとかは大丈夫)
//    fileprivate class Node<E> {
//        fileprivate var item: E
//        fileprivate var next: Node<E>?
//        fileprivate init(item: E, next: Node<E>? = nil) {
//            self.item = item
//            self.next = next
//        }
//    }
//
//
//
//    /// initialize an empty bag
//    public init() {
//
//    }
//
//
//    // return true if this bag is empty
//    public func isEmpty() -> Bool {
//        return first == nil
//    }
//
//    public func add(item: E) {
//        // add to the first
//        let oldFirst = first
//        first = Node<E>(item: item, next: oldFirst)
//        count += 1
//    }
////
////    public struct BagIterator<E>: IteratorProtocol {
////        public typealias Element = E
////
////        private var current: Node<E>?
////
////        fileprivate init(_ first: Node<E>?) {
////            if let item = current?.item {
////
////            }
////
////        }
////
////
////        public func next() -> E? {
////
////        }
////
////    }
////
////    public func makeIterator() -> BagIterator<E> {
////        <#code#>
////    }
////
//
//
//}
//



// Stack

// last in last out


// Queue


/// associatedType -> placeholder  <= generic type 使えない(protocolだと)

// element type, T type, associated type



// opt click doc でdocument見れるようにする
