print("********************元表********************")
print("********************元表概率********************")
--任何表变量都可以作为另一表变量的原表
--任何表变量都可以有自己的元表（爸爸）
--当我们子表中进行一些特定操作时
--会执行元表中的内容

print("********************设置元表********************")
meta = {}
myTable = {}
--__是两个下划线
--设置元表函数
--第一个参数 子表
--第二个参数 元表(爸爸)
setmetatable(myTable,meta)


print("********************元表的特定操作********************")
print("********************特定操作-__tostring********************")
meta2 = {
	--当子表要被当做字符串使用时 会默认调用这个元表中的tostring方法
	__tostring = function (t)
		return t.name
	end
}
myTable2 = {
	name = "唐老师"
}
--设置元表函数
--第一个参数 子表
--第二个参数 元表(爸爸)
setmetatable(myTable2,meta2)
print(myTable2)
print("********************特定操作-__call********************")
meta3 = {
	--当子表要被当做字符串使用时 会默认调用这个元表中的tostring方法
	__tostring = function (t)
		return t.name
	end,
	--当子表被当作一个函数来使用时 会默认调用这个__call中的内容
	--当希望传参数时 一定要记住 默认第一个参数 是调用者自己
	__call = function (a,b)
		print(a)
		print(b)
		print("在教lua")
	end
}
myTable3 = {
	name = "唐老师"
}

setmetatable(myTable3,meta3)
--当子表当作函数使用 就会调用元表的__call方法
myTable3(1)
print("********************特定操作-运算符重载********************")
meta4 = {
	--相当于运算符重载 当子表使用+运算符时 会调用该方法
	--运算符+
	__add = function(t1,t2)
 		return t1.age + t2.age
	end,
	--运算符-
	__sub = function(t1,t2)
 		return t1.age - t2.age
	end,
	--运算符*
	__mul = function(t1,t2)
 		return 0
	end,
	--运算符/
	__div = function(t1,t2)
 		return 1
	end,
	--运算符%
	__mod = function(t1,t2)
 		return 2
	end,
	--运算符*
	__pow = function(t1,t2)
 		return 3
	end,
	--运算符==
	__eq = function(t1,t2)
 		return true
	end,
	--运算符<
	__lt = function(t1,t2)
 		return true
	end,
	--运算符<=
	__le = function(t1,t2)
 		return false
	end,
	--运算符..
	__concat = function(t1,t2)
 		return "567"
	end
}
myTable4 = {age = 1}
setmetatable(myTable4,meta4)
myTable5 = {  age = 2}
setmetatable(myTable5,meta4)
print(myTable4 + myTable5)
print(myTable4 - myTable5)
print(myTable4 * myTable5)
print(myTable4 / myTable5)
print(myTable4 % myTable5)
print(myTable4 ^ myTable5)
--如果要用条件运算符 来比较两个对象
--这两个对象的元表一定要一致 才能准确调用方法
print(myTable4 == myTable5)
print(myTable4 <= myTable5)
print(myTable4 < myTable5)

print(myTable4 .. myTable5)

print("********************特定操作-__index和__newIndex********************")
meta6Father = {
	age = 1
}
meta6Father.__index = meta6Father
meta6 = {
	--age = 1
	--__index = {age = 2}
}
--__index 的 赋值 写到表外面来初始化
meta6.__index = meta6
myTable6 = {}
setmetatable(meta6,meta6Father)
setmetatable(myTable6,meta6)
print(getmetatable(myTable6 ))
--__index 当子表中 找不到某个属性时
--会到元表中 __index指定的表去找索引
print(myTable6.age)
--rawget 当我们使用它时 会去找自己身上有没有这个变量
print(rawget(myTable6,"age"))

--newindex 当赋值时，如果赋值一个不存在的索引
--那么救会把这个值赋值到newindex所指的表 不会修改自己
meta7 = {}
meta7.__newindex = {}
mytable7={}
setmetatable(mytable7,meta7)
mytable7.age = 1
print(mytable7.age)
--print(meta7.__newindex.age)
--rawset 该方法 会忽略newindex的设置 只会改自己的变量
rawset(mytable7,"age",2)
print(mytable7.age)