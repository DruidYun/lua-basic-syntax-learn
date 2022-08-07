print("*******************变量*******************")
--Lua中的简单变量类型
--nil number string boolean
--Lua有8种变量类型
--Lua中所有的变量申明 都不需要申明变量类型 它会自动的判断类型
--Lua中的一个变量可以随便赋值 ——自动识别类型
--通过type函数 返回值string 我们可以获得变量的类型
--nil 有点类似 C#中的null 
print(b)

a = nil
print(a)
print(type(a))
--number 所有的值都是number
a = 1
print(a)
a = 1.2
print(a)
print(type(a))
--字符串的申明 使用单引号或者双引号包裹
--Lua里 没有char

a="12312"
print(a)
a='123'
print(a)
print(type(a))
--boolean
a = true
print(a)
a = false
print(a)
print(type(a))
--函数function
--表 table
--数据结构 userdata
--协同程序 thread(线程)
