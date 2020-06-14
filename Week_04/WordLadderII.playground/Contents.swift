import UIKit

//126. 单词接龙 II
//给定两个单词（beginWord 和 endWord）和一个字典 wordList，找出所有从 beginWord 到 endWord 的最短转换序列。转换需遵循如下规则：
//
//每次转换只能改变一个字母。
//转换后得到的单词必须是字典中的单词。
//
//说明:
//如果不存在这样的转换序列，返回一个空列表。
//所有单词具有相同的长度。
//所有单词只由小写字母组成。
//字典中不存在重复的单词。
//你可以假设 beginWord 和 endWord 是非空的，且二者不相同。
//示例 1:
//输入:
//beginWord = "hit",
//endWord = "cog",
//wordList = ["hot","dot","dog","lot","log","cog"]
//输出:
//[
//  ["hit","hot","dot","dog","cog"],
//  ["hit","hot","lot","log","cog"]
//]
//
//示例 2:
//输入:
//beginWord = "hit"
//endWord = "cog"
//wordList = ["hot","dot","dog","lot","log"]
//输出: []
//解释: endWord "cog" 不在字典中，所以不存在符合要求的转换序列。

class Solution {
    var wordId: [String: Int] = [:] //单词到id的映射
    var idword: [String] = []  // id到单词的映射
    var edges: [[Int]] = [] // 图的边
    
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        
        var id: Int = 0
        for word in wordList {
            if let _ = wordId[word] {} else {
                wordId[word] = id
                idword.append(word)
                id += 1
            }
        }
        
        // 如果不存在
        if let _ = wordId[endWord] {} else {
            return []
        }
        if let _ = wordId[beginWord] {} else {
            wordId[beginWord] = id
            id += 1
            idword.append(beginWord)
        }
        
        // 初始化存边用的数据
        edges = Array(repeating: [], count: idword.count)

        // 添加边
        for i in 0..<idword.count {
            for j in (i+1..<idword.count) {
                if transformCheck(str1: idword[i], str2: idword[j]) {
                    edges[i].append(j)
                    edges[j].append(i)
                }
            }
        }
        
        let dest: Int = wordId[endWord]!
        var ans: [[String]] = []
        var cost: [Int] = Array.init(repeating: Int.max, count: id)
        var queue: [[Int]] = []
        var tmpBegin: [Int] = []
        let beginWordId = wordId[beginWord]!
        tmpBegin.append(beginWordId)
        queue.append(tmpBegin)
        cost[beginWordId] = 0
        
        // 开始广度优先搜索
        while !queue.isEmpty {
            let now = queue.removeFirst()
            if now.count > 0 {
                let last = now.last!
                if last == dest {
                    var tmp: [String] = []
                    for index in now {
                        tmp.append(idword[index])
                    }
                    ans.append(tmp)
                } else { // 该点不为终点  继续搜索
                    let edgeLast: [Int] = edges[last]
                    for i in 0..<edgeLast.count {
                        // 循环边
                        let to: Int = edgeLast[i]
                        if cost[last] + 1 <= cost[to] {
                            cost[to] = cost[last] + 1
                            var tmp: [Int] = now
                            tmp.append(to)
                            queue.append(tmp)
                        }
                    }
                }
            }
        }
        return ans
    }
    
    func transformCheck(str1: String, str2: String) -> Bool {
        var diff: Int = 0
        let chars1: [Character] = str1.map { $0 }
        let chars2: [Character] = str2.map { $0 }
        
        for i in 0..<chars1.count {
            if diff >= 2 {
                return false
            }
            if chars1[i] != chars2[i] {
                diff += 1
            }
        }
        
        return diff == 1
    }
}
let solu = Solution()
let result = solu.findLadders("cet", "ism", ["kid","tag","pup","ail","tun","woo","erg","luz","brr","gay","sip","kay","per","val","mes","ohs","now","boa","cet","pal","bar","die","war","hay","eco","pub","lob","rue","fry","lit","rex","jan","cot","bid","ali","pay","col","gum","ger","row","won","dan","rum","fad","tut","sag","yip","sui","ark","has","zip","fez","own","ump","dis","ads","max","jaw","out","btu","ana","gap","cry","led","abe","box","ore","pig","fie","toy","fat","cal","lie","noh","sew","ono","tam","flu","mgm","ply","awe","pry","tit","tie","yet","too","tax","jim","san","pan","map","ski","ova","wed","non","wac","nut","why","bye","lye","oct","old","fin","feb","chi","sap","owl","log","tod","dot","bow","fob","for","joe","ivy","fan","age","fax","hip","jib","mel","hus","sob","ifs","tab","ara","dab","jag","jar","arm","lot","tom","sax","tex","yum","pei","wen","wry","ire","irk","far","mew","wit","doe","gas","rte","ian","pot","ask","wag","hag","amy","nag","ron","soy","gin","don","tug","fay","vic","boo","nam","ave","buy","sop","but","orb","fen","paw","his","sub","bob","yea","oft","inn","rod","yam","pew","web","hod","hun","gyp","wei","wis","rob","gad","pie","mon","dog","bib","rub","ere","dig","era","cat","fox","bee","mod","day","apr","vie","nev","jam","pam","new","aye","ani","and","ibm","yap","can","pyx","tar","kin","fog","hum","pip","cup","dye","lyx","jog","nun","par","wan","fey","bus","oak","bad","ats","set","qom","vat","eat","pus","rev","axe","ion","six","ila","lao","mom","mas","pro","few","opt","poe","art","ash","oar","cap","lop","may","shy","rid","bat","sum","rim","fee","bmw","sky","maj","hue","thy","ava","rap","den","fla","auk","cox","ibo","hey","saw","vim","sec","ltd","you","its","tat","dew","eva","tog","ram","let","see","zit","maw","nix","ate","gig","rep","owe","ind","hog","eve","sam","zoo","any","dow","cod","bed","vet","ham","sis","hex","via","fir","nod","mao","aug","mum","hoe","bah","hal","keg","hew","zed","tow","gog","ass","dem","who","bet","gos","son","ear","spy","kit","boy","due","sen","oaf","mix","hep","fur","ada","bin","nil","mia","ewe","hit","fix","sad","rib","eye","hop","haw","wax","mid","tad","ken","wad","rye","pap","bog","gut","ito","woe","our","ado","sin","mad","ray","hon","roy","dip","hen","iva","lug","asp","hui","yak","bay","poi","yep","bun","try","lad","elm","nat","wyo","gym","dug","toe","dee","wig","sly","rip","geo","cog","pas","zen","odd","nan","lay","pod","fit","hem","joy","bum","rio","yon","dec","leg","put","sue","dim","pet","yaw","nub","bit","bur","sid","sun","oil","red","doc","moe","caw","eel","dix","cub","end","gem","off","yew","hug","pop","tub","sgt","lid","pun","ton","sol","din","yup","jab","pea","bug","gag","mil","jig","hub","low","did","tin","get","gte","sox","lei","mig","fig","lon","use","ban","flo","nov","jut","bag","mir","sty","lap","two","ins","con","ant","net","tux","ode","stu","mug","cad","nap","gun","fop","tot","sow","sal","sic","ted","wot","del","imp","cob","way","ann","tan","mci","job","wet","ism","err","him","all","pad","hah","hie","aim","ike","jed","ego","mac","baa","min","com","ill","was","cab","ago","ina","big","ilk","gal","tap","duh","ola","ran","lab","top","gob","hot","ora","tia","kip","han","met","hut","she","sac","fed","goo","tee","ell","not","act","gil","rut","ala","ape","rig","cid","god","duo","lin","aid","gel","awl","lag","elf","liz","ref","aha","fib","oho","tho","her","nor","ace","adz","fun","ned","coo","win","tao","coy","van","man","pit","guy","foe","hid","mai","sup","jay","hob","mow","jot","are","pol","arc","lax","aft","alb","len","air","pug","pox","vow","got","meg","zoe","amp","ale","bud","gee","pin","dun","pat","ten","mob"])
print(result)



/// 自己的解法 有问题  没找到为什么！！ 好像产生了循环，但是不知道在哪里循环了！
//class Solution2 {
//    var ans: [[String]] = []
//    var combodict: [String: [String]] = [:]
//    var endWord: String = ""
//    var minStep: Int?
//
//    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
//        self.endWord = endWord
//        if !wordList.contains(endWord) {
//            return [] // 如果不包含结束字符串
//        }
//        // 1.构造列表
//        for word in wordList {
//            for (i, c) in word.enumerated() {
//                var wordchars: [Character] = word.map { $0 }
//                wordchars[i] = "*"
//                let nword: String = String(wordchars)
//                if let _ = combodict[nword] {
//                    combodict[nword]?.append(word)
//                } else {
//                    combodict[nword] = [word]
//                }
//            }
//        }
//
//        // 2.开始深度搜索
//        dfs(beginWord, 1, [beginWord], [beginWord: true])
//
//        return ans
//    }
//
//    func dfs(_ curword: String, _ curStep: Int, _ list: [String], _ visited: [String: Bool]) {
//        if curword == endWord {
//            if let minStep = minStep {
//                if curStep == minStep {
//                    ans.append(list)
//                } else if curStep < minStep {
//                    self.minStep = curStep
//                    ans.removeAll()
//                    ans.append(list)
//                }
//            } else {
//                ans.append(list)
//                self.minStep = curStep
//            }
//            return
//        }
//
//        if let tmpstep = self.minStep {
//            if curStep >= tmpstep {
//                return
//            }
//        }
//
//        let wordchars: [Character] = curword.map { $0 }
//        for (i, c) in wordchars.enumerated() {
//            var nwordchars: [Character] = wordchars
//            nwordchars[i] = "*"
//            let nword: String = String(nwordchars)
//            if let isvisited = visited[nword], isvisited {
//                continue
//            }
//            var nvisited: [String: Bool] = visited
//            nvisited[nword] = true
//            if let transList = combodict[nword] {
//                for item in transList {
//                    if let isvisited = visited[item], isvisited {} else {
//                        var nlist: [String] = list
//                        nlist.append(item)
//                        nvisited[item] = true
//                        dfs(item, curStep+1, nlist, nvisited)
//                    }
//                }
//            }
//        }
//    }
//}
//let solu2 = Solution2()
//let result2 = solu2.findLadders("cet", "ism", ["kid","tag","pup","ail","tun","woo","erg","luz","brr","gay","sip","kay","per","val","mes","ohs","now","boa","cet","pal","bar","die","war","hay","eco","pub","lob","rue","fry","lit","rex","jan","cot","bid","ali","pay","col","gum","ger","row","won","dan","rum","fad","tut","sag","yip","sui","ark","has","zip","fez","own","ump","dis","ads","max","jaw","out","btu","ana","gap","cry","led","abe","box","ore","pig","fie","toy","fat","cal","lie","noh","sew","ono","tam","flu","mgm","ply","awe","pry","tit","tie","yet","too","tax","jim","san","pan","map","ski","ova","wed","non","wac","nut","why","bye","lye","oct","old","fin","feb","chi","sap","owl","log","tod","dot","bow","fob","for","joe","ivy","fan","age","fax","hip","jib","mel","hus","sob","ifs","tab","ara","dab","jag","jar","arm","lot","tom","sax","tex","yum","pei","wen","wry","ire","irk","far","mew","wit","doe","gas","rte","ian","pot","ask","wag","hag","amy","nag","ron","soy","gin","don","tug","fay","vic","boo","nam","ave","buy","sop","but","orb","fen","paw","his","sub","bob","yea","oft","inn","rod","yam","pew","web","hod","hun","gyp","wei","wis","rob","gad","pie","mon","dog","bib","rub","ere","dig","era","cat","fox","bee","mod","day","apr","vie","nev","jam","pam","new","aye","ani","and","ibm","yap","can","pyx","tar","kin","fog","hum","pip","cup","dye","lyx","jog","nun","par","wan","fey","bus","oak","bad","ats","set","qom","vat","eat","pus","rev","axe","ion","six","ila","lao","mom","mas","pro","few","opt","poe","art","ash","oar","cap","lop","may","shy","rid","bat","sum","rim","fee","bmw","sky","maj","hue","thy","ava","rap","den","fla","auk","cox","ibo","hey","saw","vim","sec","ltd","you","its","tat","dew","eva","tog","ram","let","see","zit","maw","nix","ate","gig","rep","owe","ind","hog","eve","sam","zoo","any","dow","cod","bed","vet","ham","sis","hex","via","fir","nod","mao","aug","mum","hoe","bah","hal","keg","hew","zed","tow","gog","ass","dem","who","bet","gos","son","ear","spy","kit","boy","due","sen","oaf","mix","hep","fur","ada","bin","nil","mia","ewe","hit","fix","sad","rib","eye","hop","haw","wax","mid","tad","ken","wad","rye","pap","bog","gut","ito","woe","our","ado","sin","mad","ray","hon","roy","dip","hen","iva","lug","asp","hui","yak","bay","poi","yep","bun","try","lad","elm","nat","wyo","gym","dug","toe","dee","wig","sly","rip","geo","cog","pas","zen","odd","nan","lay","pod","fit","hem","joy","bum","rio","yon","dec","leg","put","sue","dim","pet","yaw","nub","bit","bur","sid","sun","oil","red","doc","moe","caw","eel","dix","cub","end","gem","off","yew","hug","pop","tub","sgt","lid","pun","ton","sol","din","yup","jab","pea","bug","gag","mil","jig","hub","low","did","tin","get","gte","sox","lei","mig","fig","lon","use","ban","flo","nov","jut","bag","mir","sty","lap","two","ins","con","ant","net","tux","ode","stu","mug","cad","nap","gun","fop","tot","sow","sal","sic","ted","wot","del","imp","cob","way","ann","tan","mci","job","wet","ism","err","him","all","pad","hah","hie","aim","ike","jed","ego","mac","baa","min","com","ill","was","cab","ago","ina","big","ilk","gal","tap","duh","ola","ran","lab","top","gob","hot","ora","tia","kip","han","met","hut","she","sac","fed","goo","tee","ell","not","act","gil","rut","ala","ape","rig","cid","god","duo","lin","aid","gel","awl","lag","elf","liz","ref","aha","fib","oho","tho","her","nor","ace","adz","fun","ned","coo","win","tao","coy","van","man","pit","guy","foe","hid","mai","sup","jay","hob","mow","jot","are","pol","arc","lax","aft","alb","len","air","pug","pox","vow","got","meg","zoe","amp","ale","bud","gee","pin","dun","pat","ten","mob"])
//print(result2)
