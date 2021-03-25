//
//  SubstringAlgorithm.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/20.
//

import Foundation
import CryptoKit

/*
 Find the substring pattern of length M in a text of length N. (Assume that N >= M)
     (Return the index of the starting index)
 - Time complexity: O(N) or O(N + M)
 - Space complexity: O(M)
*/

/// Karp-Rabin algorithm　using rolling hash
//文字一文字を値とし、その値と算数の積の総和をハッシュ値とするハッシュ関数を使う

var pattern = "NEEDLE"
var text = "INAHAYSTACKNEEDLEINA"

//func something(pattern: String) -> Void {
//
//    let baseNumber = 10
//    let stringInPattern = pattern.coun
//    var hushedPattern = 0
//
//    /// find hash of pattern
//    for i in 0..<stringInPattern {
//        hushedPattern = hushedPattern + (baseNumber^i)
//    }
//    print(hushedPattern)
//    /// find hash in text
//    something(pattern: text[0...3])
//}

/// patternの数だけ繰り返す、もしpatternと同じhash 値ならtrue
//func RabinKarp(text: String, pattern: String) -> Bool {
//    let patternData = Data(pattern.utf8)
//    let hashed = SHA256.hash(data: patternData)
//    print(hashed)
//
//
//    let textData = Data(text.utf8)
//    let hashed2 = SHA256.hash(data: textData)
//    print(textData)
//
//    if hashed == hashed2 {
//        return true
//    }
//    return false
//}

func some(text: String, pattern: String) {
    /// hash value of pattern string
    let patternData = Data(pattern.utf8)
    let hashed = SHA256.hash(data: patternData)
    
    print(temp(text: text, pattern: pattern, hashedPattern: hashed))

}

//func subSome(text: String, patternHash: String, count: Int) -> Bool {
//    if text == patternHash {
//        return true
//    } else {
//        if text[0] == pattern[0] {
//            subSome(text: text[0, count], patternHash: patternHash, count: count - 1)
//
//        } else {
//            subSome(text: text[1, 1 + count], patternHash: patternHash, count: count - 1)
//        }
//
//    }
//}

//
//func noRecursion(text: String, patternString: String) ->  {
//    let hashedPattern = SHA256.hash(data: Data(pattern.utf8))
//    let hashedText = SHA256.hash(data: Data(text[1,patternString.count].utf8))
//
//    for i in 1...text.count {
//        if hashedPattern == hashedText {
//            if text[i, i + patternString.count - 1] = patternString {
//                return i
//            }
//            hashedPattern = SHA256.hash(data: Data(text[i + 1,i + patternString.count].utf8))
//            return not found
//        }
//    }
//}


func temp(text: String, pattern: String, hashedPattern: SHA256.Digest) -> Bool {
    /// if the first letter is the same
    if text[0] == pattern[0] {
        /// get the hash value
        let hashedText = SHA256.hash(data: Data(text[0,pattern.count].utf8))
        return hashedPattern == hashedText
    }
    return false
}

/// ラビンカープ法
func temp2(text: String, pattern: String) -> Bool {
    let patternData = Data(pattern.utf8)
    let hashedPattern = SHA256.hash(data: patternData)
    
    for i in 0...text.count - pattern.count {
        if text[i] == pattern[0] {
            let textData = Data(text[i, i + pattern.count].utf8)
            let hashedText = SHA256.hash(data: textData)
            if hashedPattern == hashedText {
                return true
            }
        }
    }
    return false
}


/// BM法
func BM(text: String, pattern: String) {
    
    for i in (0...pattern.count).reversed() {
        if text[i]  == pattern[pattern.count-1] {
            
        }
    }
}


/// Rabin-Karp algorithm
func RabinKarp(text: String, pattern: String) -> Int? {
    /// 1. get hash value of pattern
    let hashedPattern = SHA256.hash(data: Data(pattern.utf8))
    
    /// 2. Loop through text from index 0 to the end of text minus length of the pattern
    for i in 0...text.count - pattern.count {
        /// 3. get hash value of the text with the length of pattern
        let hashedText = SHA256.hash(data: Data(text[i, i + pattern.count].utf8))
        if hashedPattern == hashedText {
            return i
        }
    }
    return nil
}
  


/// Rabin-Karp algorithm using rolling hash
/// ASCII code
/// Recursively:  O (N + M)?
func RabinKarpRollingHash(text: String, pattern: String, hashedText: Int, hasedPattern: Int, indexCount: Int) {
    /// set base number to multiply (usually size of character set == 256)
    /// set modulus value
    ///
    /// Base case1: if hashedText == nil
    ///     get ASCII Code of each string in the pattern
    ///    hashed pattern = Sum of  hash value of patttern = (pattern[0] * base % mod) ... + pattern[m] ) %mod
    /// Base case2: else  hashed Text == hashedPattern
    ///     return indexCount
    ///  Base case3:
    ///     reset the hashedText?
    /// Recursive case:
    ///  else
    ///  (hashedText +  hash of new char) : add hash value of text
    ///  increment indexCount
}




// // ASCII a = 97, b = 98, r = 114.
//hash("abr") =  [ ( [ ( [  (97 × 256) % 101 + 98 ] % 101 ) × 256 ] %  101 ) + 114 ]   % 101   =  4


//
///// Rabin-Karp algorithm using rolling hash
///// ASCII code
//func RabinKarpRollingHash(text: String, pattern: String) -> Int? {
//    /// 1. set base number to multiply (usually size of character set == 256)
//    /// 2. set modulus value
//    var base = 256
//    var modulus = 101
//    var hashedPattern = 0
//
//    /// 3. get ASCII Code of each string in the pattern
//    /// Sum the hash value of patttern = (pattern[0] * base % mod) ... + pattern[m] ) %mod
//    let asciiText = text.cString(using: .ascii)!
//    for char in asciiText {
//        hashedPattern = hashedPattern + (char * base) % modulus
//    }
//    /// 4.. Loop through text from index 0 to the end of text minus length of the pattern
//    for i in 0...text.count - pattern.count {
//        /// 3. get hash value of the text with the length of pattern
//        hashedText = hashedText + SHA256.hash(data: Data(text[i, i + pattern.count].utf8))
//        if hashedPattern == hashedText {
//            return i
//        }
//    }
//    return nil
//}
