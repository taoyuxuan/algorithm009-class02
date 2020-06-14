# 第四周： 



一：深度优先搜索、广度优先搜索、优先级优先

保证每个结点，都要访问一次，且每个节点仅仅访问一次



dfs 递归写法

`var visited: [Node] = []`

`func dfs(_ node: Node, _ visited: [Node]) {`

​	`if visited.contains(node) {`

​		`return`

​	`}`

​	`visited.append(node)`

​	`process(node)`

​	`for next_node in node.children() {`

 		`if visited.contains(next_node) {`

​			`dfs(next_node, visited)`

​		`}`

​	`}`

`}`



dfs 非递归写法:

`func dfs(_ graph: Graph) -> [Node] {`

​	`if graph == nil {`

​		`return []`

​	`}`

​	`var visited: [Node] = []`

​	`var stack: [Node] = []`

​	`while !stack.isEmpty {`

​		`let top = stack.removeLast()`

​		`visited.append(node)`

​		`process(node)`

​		`nodes = generate_releated_nodes(node)`

​		`stack.append(nodes)`

​	`}`

​	`// other processing work`

`}`



bfs 队列写法：

`func bfs(_ graph: Graph, _ start: Node, _ end: Node) {`

​	`var visited: [Node] = []`

​	`var queue: [Node] = [start]`

​	`visited.append(start)`

​	`while !queue.isEmpty {`

​		`let node = queue.removeFirst()`

 	`visited.append(node)`

​		`process(node)`

​		`nodes = generate_related_nodes(node)`

​		`queue.push(nodes)`

​	`}`



​	`#other processing work`

`}`



最关键就是找重复性



单词接龙的核心代码：

`let genechars: [Character] = gene.map { $0 }`

`for (i, c) in genechars.enumerated() {`

​	`for nc in basestr {`

​		`if c == nc {`

​			`continue`

​		`}`

​		`var ngene:[Character] = genechars`

​		`ngene[i] = nc`

​		`let ngenestr: String = String(ngene)`

​         `if let _ = hashmap[ngenestr] {`

​			`// 如果存在，那么push`

​			`queue.append(ngenestr, step+1)`

​		`}`

​	`}`

`}`



贪心算法：

​     一种在每一步选择中都采取在当前状态下最好或最优（即有利）的选择，从而希望导致结果是全局最好或最优的算法。

​    贪心算法与动态规划的不同在于它对每个子问题的结局方案都作出选择，不能回退。动态规划则会保存以前的运算结果，并根据以前的结果对当前进行选择，有回退功能。

   贪心算法可以解决一些最优化的问题，如：求途中的最小生成树、求哈夫曼编码等。



二分查找：

​     二分查找的前提： 1.目标函数单调性（单调递增或者递减） 2.存在上下界  3.能够通过索引访问    

​    代码模版：

​    var left: Int = 0

​    var right: Int = len - 1

​    while left <= right {

   		let mid = (left + right)/2

​			if array[mid] == target {

​				// find the target

​				break

​			} else if array[mid] < target {

​				left = mid + 1

​			} else {

​				right = mid-1

​			}

​    }



这周的知识有点跟不上了，以前掌握的少，题目做的也少，主要是理解题目卡住了，有些地方想不明白，尤其是在单词接龙II的时候，自己的方案超时，然后又一点一点理解官方题解，半知半解，翻写了swift版本的，发现还是超时，有点不知所措！目前还没解决单词接龙II的问题。

后续 剩下的题目还是要补上





