# 第9周 高级动态规划 + 字符串算法



### 高级动态规划

DP 顺推模版

func DP() {

​	var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)

​	for i in 0..<m {

​		for j in 0..<n {

​			dp[i][j] = _ Function(dp[i’][j’]…)

​		}

​	}

​	return dp‘[’m‘]’‘[’n’]‘

}



复杂地方：

 1.dp状态定义 需要经验以及需要把现实问题定义成一个数组里面保存状态

 2.状态转移方程  

   简单的情况类似斐波那契数列那样

   更多的时候是： 

​     求最小值 

​    或者 累加累减 

​    或者 在这里面有一层小的循环，从之前的k个状态里面找出它的最值



关键点：

  动态规划和递归或者分治没有根本上的区别（关键看有无最优子结构）

 拥有共性：找到重复子问题



 差异性：最优子结构、中途可以淘汰次优解





https://leetcode-cn.com/problems/unique-paths-ii/

不同路径2的状态转移方程：

i == 0  dp[i][j] = obstacleGrid == 1 ? 0 : dp[i][j-1]

j == 0  dp[i][j] = obstacleGrid == 1 ? 0 : dp[i-1][j]

i > 0 && j > 0 dp[i][j] = obstacleGrid == 1 ? 0 : dp[i-1][j] + dp[i][j-1]





### 字符串算法



最长字串、子序列问题：

dp定义二维数组，外层为s1的长度 m，内层为s2的长度 n

最长子序列的dp:

  dp[i][j] = dp[i-1][j-1] + 1  (if s[i-1] == s2[j-1] )

  else { dp[i][j] = max(dp[i-1][j], dp[i][j-1])}



最长字串的dp：

  dp[i][j] = dp[i-1][j-1] + 1  if(s1[i-1] == s2[j-1])

  else { dp[i][j] = 0 }



最长回文串问题：

 dp[i][j]: [[Bool]] 代表i为回文串的起点 j为回文串的终点 它的值代表以i为起点 以j为终点的子串是否为回文串

 dp[i][j] = schars[i] == schars[j] && (j-i < 2 || dp[i+1][j-1])



字符串匹配算法

 1.暴力法

 2.Rabin-Karp算法

 3.KMP算法



Rabin-Karp算法的思想：

1.假设子串的长度为M(pat)，目标字符串的长度为N(txt)

2.计算子串的hash值 hash_pat

3.计算目标字符串txt中每个长度为M的子串的hash值（共需计算N-M+1次）

4.比较hash值，如果hash值不同，字符串必然不匹配，如果hash值相同，还需要使用朴素算法再次判断