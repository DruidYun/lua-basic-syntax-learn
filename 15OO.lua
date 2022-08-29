print("********************面向对象********************")

print("********************封装********************")
--面向对象 类 其实都是基于table来实现
--元表
Object = {}
Object.id = 1
function  Object:Test()
	print(self.id)
end

--冒号 是会自动将调用这个函数的对象 作为第一个参数传入的写法
function Object:new( )
	--self 代表的是 我们默认传入的第一个参数
	--对象就是变量 返回一个新的变量
	--返回出去的内容 本质上就是表对象
	local obj  = {}
	--元表知识 __index当找自己的变量 找不到时 就会去找元表当中__index指向的内容
	self.__index = self
	setmetatable(obj,self)
	return obj
end

local myObj = Object:new()
print(myObj)
print(myObj.id)
myObj:Test()
--对空表中 声明一个新的属性 叫做id
myObj.id = 2
print(Object.id)
print("********************继承********************")

print("********************多态********************")