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
--c# class 类名:继承类
--写一个继承用的方法
function Object:subClass( className )
	-- _G知识点 是总表 所有声明的全局标量 都是以键值对的形式存在其中
	_G[className] = {}
	--写相关继承规则
	--用到元表
	local obj = _G[className]
	self.__index = self
	setmetatable(obj,self)
end
--[[print(_G)
_G["a"] = 1
_G.b = 2
print(a)
print(b)--]]
Object:subClass("Person")
--[[print(Person)
print(Person.id)
Person:Test()]]--
local p1 = Person:new()
print(p1.id)
p1.id = 100
print(p1.id)
p1:Test()
Object:subClass("Monster")
local m1 = Monster:new()
print(m1.id)
m1:Test()
print("********************多态********************")
--相同行为 不同表象 就是多态
--形同方法 不同执行逻辑 就是多态
Object:subClass("GameObject")
GameObject.posX = 0;
GameObject.posY = 0;
function GameObject:Move()
	self.posX = self.posX + 1
	self.posY = self.posY + 1
	print(self.posX)
	print(self.posY)
end

GameObject:subClass("Player")
local player1 = Player:new()
--player1:Move()
 