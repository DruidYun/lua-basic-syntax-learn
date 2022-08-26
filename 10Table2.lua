print("********************复杂数据类型-表2********************")
print("********************字典********************")
print("********************字典的声明********************")
a= {["name"] = "唐老狮",["age"] = 14,["1"] = 5}
--访问单个变量 用中括号填键 来访问
print(a["name"])
print(a["age"])
print(a["1"])
--还可以类似 .成员变量的形式得到值
print(a.name)
print(a.age)
--虽然可以通过.成员变量的形式得到值，但是不能是数字
print(a["1"])
--修改
a["name"] = "TLS"
print(a.name)
--新增
a["sex"] = false
print(a.sex)
--删除
a["sex"] = nil
print(a.sex)
print("********************字典的遍历********************")
--如果要模拟字典 遍历一定用pairs
for k,v in pairs(a) do
	--可以传多个参数 一样可以打印出来
	print(k,v)
end

for k in pairs(a) do
	print(k)
	print(a[k])
end

for _,v in pairs(a) do
	print(_,v)
end
print("********************类和结构体********************")

--Lua中是默认没有面向对象的，需要我们自己来实现
--成员变量 成员函数 
Student = {
	--年龄
	age = 1,
	--性别
	sex = true,

	Up = function ()
		--这样写 这个age 和表中的age没有任何关系 它是一个全局变量
	    --print(age)

	    --想要在表内部函数中 调用表本身的属性或者方法
	    --一定要指定是谁的 所以要使用 表名.属性 或 表名.方法
	    print(Student.age)
		print("我成长了")
	end,
		--学习函数
	Learn = function(t)
		--第二种 能够在函数内部调用自己属性或者方法的方法
		--把自己作为一个参数传进来 在内部 访问
		print(t.sex)
		print("好好学习，天天向上 ")
	end
}
--Lua中 .和冒号的区别 
Student.Learn(Student)
--冒号调用方法 会默认把调用者 作为第一个参数传入方法中
Student:Learn()

--声明表过后 在表外去声明表有的变量和方法
Student.name = "唐老师"
Student.Speak = function()
	print("说话")
end
function Student:Speak2()
	--lua中 有一个关键字 self表示 默认传入的第一个参数
	print(self.name .. "说话2")
end
--C#要使用类 实例化对象new 静态直接点
--Lua中类的表现 更像是一个类中有很多 静态变量和函数
print(Student.age)
Student.Up()
print(Student.name)
Student.Speak()
Student:Speak2()
Student.Speak2(Student)
print("********************表的公共操作********************")