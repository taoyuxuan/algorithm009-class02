import UIKit

//127. 单词接龙
//给定两个单词（beginWord 和 endWord）和一个字典，找到从 beginWord 到 endWord 的最短转换序列的长度。转换需遵循如下规则：
//
//每次转换只能改变一个字母。
//转换过程中的中间单词必须是字典中的单词。
//
//说明:
//如果不存在这样的转换序列，返回 0。
//所有单词具有相同的长度。
//所有单词只由小写字母组成。
//字典中不存在重复的单词。
//你可以假设 beginWord 和 endWord 是非空的，且二者不相同。
//
//示例 1:
//输入:
//beginWord = "hit",
//endWord = "cog",
//wordList = ["hot","dot","dog","lot","log","cog"]
//输出: 5
//解释: 一个最短转换序列是 "hit" -> "hot" -> "dot" -> "dog" -> "cog",
//     返回它的长度 5。
//
//示例 2:
//输入:
//beginWord = "hit"
//endWord = "cog"
//wordList = ["hot","dot","dog","lot","log"]
//输出: 0
//解释: endWord "cog" 不在字典中，所以无法进行转换。


// *************************** 解法一 类似基因序列的BFS *************************** //
/// base 字典是 a到z的字母
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // 1.构建词典列表
        var hashmap: [String: Int] = [:]
        for (i,item) in wordList.enumerated() {
            hashmap[item] = i
        }
        
        // 2.开始查找转换序列
        var queue: [(String, Int)] = [(beginWord, 1)]
        while !queue.isEmpty {
            let (curWord, step) = queue.removeFirst()
            if curWord == endWord {
                return step
            }
            let wordchars: [Character] = curWord.map { $0 }
            for (i, c) in wordchars.enumerated() {
                for j in 0..<26 {
                    if let scalar = Unicode.Scalar(97+j) {
                        let nc = Character(scalar)
                        if c == nc {
                            continue
                        }
                        var nwordchars: [Character] = wordchars
                        nwordchars[i] = nc
                        let nword: String = String(nwordchars)
                        if let _ = hashmap[nword] {
                            queue.append((nword, step + 1))
                            hashmap.removeValue(forKey: nword)
                        }
                    }
                }
            }
        }
        
        return 0
    }
}
let solu = Solution()
let result = solu.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
print(result)


// *************************** 解法二 官方题解法BFS *************************** //
///
class Solution2 {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        if !wordList.contains(endWord) {
            return 0
        }
        
        let count = beginWord.count
        
        //1.构造转换词典
        var allComboDict: [String: [String]] = [:] // hashmap 是每个单词对应的可转换单词
        wordList.forEach { item in
            let itemchars: [Character] = item.map { $0 }
            for (i, c) in itemchars.enumerated() {
                var nchars: [Character] = itemchars
                nchars[i] = "*"
                let nword: String = String(nchars)
                if let _ = allComboDict[nword] {
                    allComboDict[nword]?.append(item)
                } else {
                    allComboDict[nword] = [item]
                }
            }
        }
        
        //2.构造寻找队列
        var queue: [(String, Int)] = [(beginWord, 1)]
        
        // 3.构造已读map
        var visited: [String: Bool] = [beginWord:true]
        
        // 4.开始寻找序列
        while !queue.isEmpty {
            let (word, step) = queue.removeFirst()
            let wordchars: [Character] = word.map { $0 }
            for i in 0..<count {
                var nwordchars: [Character] = wordchars
                nwordchars[i] = "*"
                let transforms: [String] = allComboDict[String(nwordchars)] ?? []
                for item in transforms {
                    if item == endWord {
                        return step + 1
                    }
                    if let isVisited = visited[item], isVisited {} else {
                        visited[item] = true
                        queue.append((item, step+1))
                    }
                }
            }
        }
        
        
        return 0
    }
}
let solu2 = Solution2()
let result2 = solu2.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
print(result2)


// *************************** 解法三 官方题解法双向BFS *************************** //
///
class Solution3 {
    var allComboDict: [String: [String]] = [:] // hashmap 是每个单词对应的可转换单词
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        if !wordList.contains(endWord) {
            return 0
        }
        
        let count = beginWord.count
        
        //1.构造转换词典
        wordList.forEach { item in
            let itemchars: [Character] = item.map { $0 }
            for (i, c) in itemchars.enumerated() {
                var nchars: [Character] = itemchars
                nchars[i] = "*"
                let nword: String = String(nchars)
                if let _ = allComboDict[nword] {
                    allComboDict[nword]?.append(item)
                } else {
                    allComboDict[nword] = [item]
                }
            }
        }
        
        //2.构造寻找队列
        var bqueue: [(String, Int)] = [(beginWord, 1)]
        var equeue: [(String, Int)] = [(endWord, 1)]
        
        // 3.构造已读map
        var bvisited: [String: Int] = [beginWord:1]
        var evisited: [String: Int] = [endWord:1]
        
        // 4.开始寻找序列
        while !bqueue.isEmpty && !equeue.isEmpty {
            var ans = visitWordNode(&bqueue, &bvisited, evisited)
            if ans > -1 {
                return ans
            }
            
            ans = visitWordNode(&equeue, &evisited, bvisited)
            if ans > -1 {
                return ans
            }
        }
        
        return 0
    }
    
    private func visitWordNode(_ queue: inout [(String, Int)], _ visited: inout [String: Int], _ otherVisited: [String: Int]) -> Int {
        
        let (word, step) = queue.removeFirst()
        let wordchars: [Character] = word.map { $0 }
        for (i, c) in wordchars.enumerated() {
            var nchars: [Character] = wordchars
            nchars[i] = Character("*")
            let nword: String = String(nchars)
            let transforms: [String] = allComboDict[nword] ?? []
            for item in transforms {
                if let otherStep = otherVisited[item] {
                    return step + otherStep
                }
                
                if let _ = visited[item] {} else {
                    visited[item] = step + 1
                    queue.append((item, step+1))
                }
            }
        }
        
        return -1
    }
}
let solu3 = Solution3()
let result3 = solu3.ladderLength("hit", "cog", ["hit","cog"])
print(result3)
