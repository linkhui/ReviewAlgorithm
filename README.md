# ReviewAlgorithm
review algorithm for the interview

## 概述

这是一个用于面试的算法和数据结构的复习项目。参考了[andyRon/swift-algorithm-club-cn: swift-algorithm-club的翻译。使用Swift学习算法和数据结构。](https://github.com/andyRon/swift-algorithm-club-cn/tree/master?tab=readme-ov-file)。


## 目录

- [数据结构](#数据结构)
- [算法](#算法)
- [LeetCode](#LeetCode)


## 数据结构


### 栈

[Stack.swift](./Stack.swift)

### 队列

[Queue.swift](./Queue.swift)

## 算法

### 插入排序

[InsertSort.swift](./InsertSort.swift)

基本思想是将一个记录插入到已经排好序的有序表中，从而得到一个新的、记录数增1的有序表。

### 二分搜索

[BinarySearch.swift](./BinarySearch.swift)

基本思想：分而治之，将一个大的问题分解为两个小的问题，然后递归解决。
使用迭代而不是递归的原因是：递归会占用大量的栈空间，而迭代不会。

### 归并排序

[MergeSort.swift](./MergeSort.swift)

基本思想：分而治之，将一个大的问题分解为两个小的问题，然后递归解决。


### 字符串反转

[char_reverse.swift](./char_reverse.swift)

例如：

```
输入: "hello"
输出: "olleh"
```

### 反转链表

[ReverseList.swift](./ReverseList.swift)

例如：

```
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
```

### 合并两个有序数组

[MergeSortedList.swift](./MergeSortedList.swift)

例如：

```
输入: nums1 = [1,2,3], nums2 = [2,5,6]
输出: [1,2,2,3,5,6]
```

### 在一个字符串中找到第一个只出现一次的字符

[HashFind.swift](./HashFind.swift)

例如：

```
输入: "leetcode"
输出: "l"
```

### 查找两个视图的公共父视图

[CommonSuperFind.swft](./CommonSuperFind.swft)


### 快速排序

[QuickSort.swift](./QuickSort.swift)

例如：

```
输入: [3, 1, 2, 4, 5, 6, 7, 8, 9]
输出: [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

### 查找无序数组中的中间数

[MiddleFind.swift](./MiddleFind.swift)

例如：

```
输入: [3, 1, 2, 4, 5, 6, 7, 8, 9]
输出: 5
```

### B树查找

[BTreeFind.swift](./BTreeFind.swift)

## LeetCode

### 题目来源

[面试经典 150 题 - 学习计划 - 力扣（LeetCode）全球极客挚爱的技术成长平台](https://leetcode.cn/studyplan/top-interview-150/)

### 题解

[88. 合并两个有序数组](./MergeSortedList.swift)

[27. 移除元素](./RemoveElement.swift)

[26. 删除有序数组中的重复项](./RemoveDuplicate.swift)

[80. 删除有序数组中的重复项 II](./RemoveDuplicateII.swift)  

[169. 多数元素](./MajorityElement.swift)

[189. 轮转数组](./Rotate.swift)

[121. 买卖股票的最佳时机](./MaxProfit.swift)

[122. 买卖股票的最佳时机 II](./MaxProfit2.swift)

[55. 跳跃游戏](./JumpGame.swift)

[45. 跳跃游戏 II](./JumpGame2.swift)

[58. 最后一个单词的长度](./LastWordLength.swift)

[125. 验证回文串](./IsPalindrome.swift)

[392. 判断子序列](./IsSubsequence.swift)

[13. 罗马数字转整数](./RomanToInt.swift)