# 第二周学习总结：哈希表、树、堆、图



### 哈希表

​    定义：也叫散列表，根据关键码值 key value来直接访问的数据结构，它通过把key value映射到表中一个位置来访问记录，以加快查找的速度。

​    散列函数：哈希表映射的函数就叫散列函数。

​    工程实践：

- ​        电话号码簿
- ​        用户信息表
- ​        缓存
- ​        键值对存储

​    hash collision  哈希碰撞：

- ​    开放定址法：现行探测再散列、二次探测再散列、伪随机探测再散列
- ​    链表法 ： 将冲突的元素放到一个链表里
- ​    再哈希法：冲突后利用一个其他的哈希函数再进行定址
- ​    建立公共溢出区

​    复杂度分析：

​        访问、插入、删除操作 都是 O(1)

​        最坏情况下 都是O(n)   如果这样就失去了散列表的意义



### 树、二叉树、二叉搜索树

链表是特殊化的树

树就是特殊的图

为什么需要树形结构？现实生活中很多类似的逻辑。

遍历：

​     前序   中序  后序

​     一般递归，没法有效的进行循环，但是递归非常简洁

二叉搜索树：

   定义：

​       又名 二叉搜索树、有序二叉树、排序二叉树

​       左子树上**所有结点**的值均小于它的根结点的值

​       右子树上**所有结点**的值均大于它的根结点的值

​       以此类推，左右子树也分别为二叉搜索树（重复性）

   它的中序遍历是升序遍历

​       递归代码示例：

​      `func preorder(_ root: TreeNode) { `

​            `guard let root = root else { return }  `           

​            `self.traverse_path.append(root.val)   `        

​             `preorder(root.left)  `

​             `preorder(root.right)}`

​       `}`

​     `func inorder(_ root: TreeNode) {`

​           `  guard let root = root else {  return }`  

​	      `self.inorder(root.left)`

​          `self.tranvers_path.append(root.val)`

​          `self.inorder(root.right)`

​     `}`

   `func postorder(_ root: TreeNode) {`

​           `  guard let root = root else {  return }`  

​	      `self.inorder(root.left)`

​          `self.inorder(root.right)`

​          `self.tranvers_path.append(root.val)`

​     `}`

   二叉搜索树常见操作：

​       插入、删除、查询     时间复杂度都是O(logn)

​      最坏时间复杂度 O(n)

​     **误区：判断是否为二叉搜索树，只判断左孩子和右孩子结点的大小，而忽略了左孩子的孩子和右孩子的孩子结点**

![image-20200531192205740](/Users/taotao/Library/Application Support/typora-user-images/image-20200531192205740.png)



   

### 堆和二叉堆

定义：可以迅速找到一堆数中的最大或者最小值的数据结构

heap是抽象的数据结构，并不是二叉堆，二叉堆和其他堆只是堆的实现

大顶堆/小顶堆

常见的堆： 二叉堆、斐波那契堆

常见操作： 

​      查找最大值 O(1)

​      删除最大值 O(logn)

​     插入（创建） O(logn) 或者 O(1) (斐波那契堆是O(1))

![image-20200531205022062](/Users/taotao/Library/Application Support/typora-user-images/image-20200531205022062.png)



堆的种类：

- ​    二叉堆
- ​    leftist
- ​    多项式堆
- ​    斐波那契堆
- ​    严格斐波那契堆
- ​    2-3堆

二叉堆是比较慢的堆，实现的效率并不高，但是实现简单

二叉堆 通过完全二叉树来实现（注意⚠️ 不是二叉搜索树）

二叉堆是堆（优先队列 priority queue）的一种常见且简单的实现；但并不是最优的实现。

二叉堆的实现逻辑：

​    1.创建堆 -- heapify   （牢记堆是一个完全二叉树，一般用一位数组来表示）

​        对一组数据创建成堆，需要堆 0到n/2的非叶子结点进行逐个堆化，堆化的过程是从第i个结点开始，查看它的孩子结点，是否符合条件，不符合条件进行交换，然后再进行查看交换后的孩子结点的孩子结点，依次类推，直到到最后一个结点

​    `func createHeap(_ nums: [Int]) {`

​		  `for i in 0..<n/2 {`

​          		`heapify(i)`

​       	`}`

​     `}`

​	  `func heapify(_ i: Int) {`

 		`var j = i`

​       	`while  2*j+1 < n {`

​          	`let lidx: Int = 2*j + 1`

​              `let ridx: Int = 2*j + 2`

​              `var maxIdx: Int = lidx`

​			 `if ridx < n && heap[maxIdx] < heap[ridx] {`

​    				`maxIdx = ridx`

​             `}`

​             `if heap[i] < heap[maxIdx]  {  // 这个是大顶堆； 如果小顶堆 就要判断是否 ">"`

​					`swap(heap[i], heap[maxIdx])`

​             `} else {`

​				`break`

​			`}`

​				`j = maxIdx`

​           `}`

​     `}`



​     2. 每次添加/删除元素后，都需要一次堆化，也就是上面的 heapify 函数

  java的堆的实现： https://shimo.im/docs/Lw86vJzOGOMpWZz2/read



### 图

图的属性

​     V - vertex 点 ： 1.出度和入度   2.点与点之间，连通与否

​     E - edge 边： 1.有向无向   2.权重（边长）

图的分类：

​     无向有权图

​     有向有权图

图的表示：

​      邻接表

​      邻接矩阵

基于图的相关算法：

​       DFS  深度优先搜索  

​       BFS  广度优先搜索

​       ⚠️ 图的遍历一定要有visited状态表，树不需要时因为树不存在环

代码模版：

​     dfs 代码模版：

`var visited: [GraphNode] = []`

`func dfs(_ node: GraphNode, _ visited: [GraphNode]) {`

  `if visited.contains(node) {`

​    `return`

  `}`

  `visited.append(node)`

  `for next_node in node.children {`

​    `if !visited.contains(next_node) {`

​      `dfs(next_node, visited)`

​    `}`

  `}`

`}`

bfs代码模版：

`func bfs(_ node: GraphNode, _ start: GraphNode, _ end: GraphNode) {`

  `var queue: [GraphNode] = [start]`

  `var visited: [GraphNode] = []`

  `while !queue.isEmpty {`

​    `let node = queue.removeFirst()`

​    `visited.append(node)`

​    `process(node)`

​    `var nodes = generated_releated_nodes(node)`

​    `queue.append(nodes)`

  `}`

`}`







   