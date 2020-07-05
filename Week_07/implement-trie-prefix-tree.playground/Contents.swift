import UIKit

//208. 实现 Trie (前缀树)
//实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。
//
//示例:
//
//Trie trie = new Trie();
//trie.insert("apple");
//trie.search("apple");   // 返回 true
//trie.search("app");     // 返回 false
//trie.startsWith("app"); // 返回 true
//trie.insert("app");
//trie.search("app");     // 返回 true
//说明:
//
//你可以假设所有的输入都是由小写字母 a-z 构成的。
//保证所有输入均为非空字符串。


// ************************ 解法一 ************************ //
class Trie {

    var root: TrieNode = TrieNode()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        if word == "" { return }
        var pnode: TrieNode = root
        for ch in word {
            if !pnode.containsKey(ch) {
                pnode.put(ch, TrieNode())
            }
            pnode = pnode.get(ch)!
        }
        pnode.isEnd = true
    }

    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var pnode: TrieNode = root
        for ch in word {
            if let node = pnode.get(ch) {
                pnode = node
            } else {
                return false
            }
        }
        return pnode.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var pnode: TrieNode = root
        for ch in prefix {
            if let node = pnode.get(ch) {
                pnode = node
            } else {
                return false
            }
        }
        return true
    }
    
    class TrieNode {
        static let size: Int = 26
        var childs: [TrieNode?] = Array.init(repeating: nil, count: TrieNode.size)
        var isEnd: Bool = false
        
        func containsKey(_ ch: Character) -> Bool {
            if let asciival = ch.asciiValue {
                if childs[Int(asciival)-97] != nil {
                    return true
                }
            }
            return false
        }
        
        func get(_ ch: Character) -> TrieNode? {
            if let asciiVal = ch.asciiValue {
                return childs[Int(asciiVal)-97]
            }
            return nil
        }
        
        func put(_ ch: Character, _ node: TrieNode) {
            if let asciiVal = ch.asciiValue {
                childs[Int(asciiVal)-97] = node
            }
        }
    }
}
let trie = Trie();
trie.insert("apple");
let result1 = trie.search("apple");   // 返回 true
let result2 = trie.search("app");     // 返回 false
let result3 = trie.startsWith("app"); // 返回 true
trie.insert("app");
let result4 = trie.search("app");     // 返回 true
print("result1:\(result1);result2:\(result2);result3:\(result3);result4:\(result4)")
