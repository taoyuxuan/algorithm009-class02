# 第三周：递归+回溯



递归：

  本质就是一种循环

  通过函数体进行循环



代码模版：   

var recursion(level, param1, param2,…) {

​    // 递归终止条件  recursion terminator

​	if lee > MAX_LEVEL {

​     	process_result

​     }

​    // 处理当前层的逻辑  process login in current level

​    process(level, data, …)

 

​    // 下探到下一层 drill down

​    self.recursion(level+1, p1, …)



​     \#reverse the current level status if needed

​    	清理当前层

}



思维要点：

  1.不要人肉递归

  2.找到最近最简方法，将其拆解成可重复解决的问题（重复子问题）

  3.数学归纳法



二叉搜索树定义： 根结点大于左子树的所有结点，根结点小于右子树的所有结点



一般的递归：

 1.终止条件

 2.process logic

 3.下探到下一层 drill down

 4.清理当前层 clean current level

