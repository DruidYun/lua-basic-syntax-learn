Lua语法学习 B站唐老狮讲的课 以C#基础的课<!--more-->

## 环境搭建

### 环境安装

- https://github.com/rjpcomputing/luaforwindows

### IDE（集成开发环境）

- 实际项目开发使用的IDE

	- VSCode
	- IDEA
	- LuaStudio
	- 等等

- 学习使用

	- Sublime Text
	- 轻便快捷

## Lua语法

### HelloWorld

- 打印

	- print()
	- Lua可以不写;（分号）

- 注释

	- 单行注释

		- \--
		- --[[

	- 多行注释

		- --[[
多行注释1
]]
		- --[[
多行注释2
]]--
		- --[[
多行注释3
--]]

### 变量

- 四种简单变量类型

	- nil

		- nil 有点类似 C#中的null 

	- number
	- string
	- boolean

- 四种复杂变量类型(目前不讨论之后分开讨论)

	- 函数function
	- 表table
	- 数据结构userdata
	- 协同程序thread(线程)

- Lua中所有的变量声明 都不需要声明变量类型 它会自动的判断类型
- Lua中的一个变量可以随便赋值 ——自动识别类型
- 通过type()函数 参数变量名 返回值string 我们可以获得变量的类型

### 字符串

- 字符串声明可以用单引号也可以用双引号
- 字符串长度

	- 在字符串变量名前加#号
	- 英文字符占1个长度，中文字符占3个长度

- 字符串多行打印

	- 转义字符\n
	- s=[[我在
学	
Lua]]

- 字符串拼接

	- ..(就是用这两个点连接)

		- print("123".."456")
		- print(s1..s2)

	- 格式控制符

		- print(string.format("我在学Lua第%d天了",3))
		- --%d :接受一个数字并将其转化为有符号的整数格式
		- --%a :与任何字符拼接
		- --%s :接受一个字符串并按照给定的参数格式化该字符串
		- 等等格式控制符

- 字符串提供的公共方法

	- 小写转大写

		- string.upper(str)

	- 大写转小写

		- string.lower(str)

	- 翻转字符串

		- string.reverse(str)

	- 字符串索引查找

		- string.find(str,"Cde")

			- Lua支持多返回值，索引从1开始

	- 截取字符串

		- string.sub(str,3)
		- string.sub(str,3,4)

	- 字符串重复

		- string.rep(str,2)

	- 字符串修改

		- string.gsub(str,"Cd","**")

			- 返回修改后的内容，和替换了几次

		- str = "abCdegGCd"
			print(string.gsub(str,"Cd","**")
		- 这里返回 “ab\*\**egG\*\**  2”
	
- 字符转ASCII码
	
	- a=string.byte("Lua",1)
	
		- a变成了76
	
- ASCII码转字符
	
	- string.char(a)
	
		- 返回"L"

### 运算符

- 算数运算符

	- \+ \- * / % ^（最后一个是幂运算符）
	- 没有自增自减 ++ \--
	- 没有复合运算符 += -= /= *= %=
	- 字符串可以进行 算数运算符操作 会自动转成number

- 条件运算符

	- < > <= >= == ~=(最后一个是不等于符号，不是!=了

- 逻辑运算符

	- && || !  这是C#中的逻辑与 逻辑或 取反
	- and or not 这是Lua中的对应逻辑与 逻辑或 取反  
	- 也支持逻辑运算的“短路”规则

		- print(false and print("123")) \--短路 已经满足为false条件 不执行后续代码
		- print(true and print("123")) 

- 位运算符

	- 不支持  & | 不支持位运算符 需要自己实现

- 三目运算符

	- 也不支持  ? : 

### 条件分支语句

- if 条件 then ... end

- if 条件 then ... else ... end

- if 条件 then ... elseif ...then ...end

  - elseif需要连在一起

- 不支持switch，可以自己实现

### 循环语句

  - while循环

    - while 条件 do ... end

  - repeat until循环

    - repeat ... until 跳出条件(满足就结束)

  - for循环

    - for 变量名=起始值,结束值 do ... end

      - 默认递增 每次+1
      - 要自己设定每次的变化就 for 变量名=起始值,结束值,增值 do ... end

###  函数

- 两种声明方式

  - 一个在function后面取名字
  - 一个不取名字 用一个变量来存储

- 函数传参时

  - 个数传多了 或者 传少了 不会报错
  - 多了会丢弃
  - 少了会补空

- 函数返回值

  - 外部用多个变量来接取
  - 接少接多不影响
  - 少了丢弃
  - 多了为nil

- 函数的类型 function
- 不支持函数重载
- 变长参数

  - ...
  - 先用 表 接 再使用

- 函数嵌套

  - 函数里面声明函数
  - 闭包：函数改变变量生命周期

### 迭代器遍历

- ipairs

	- 不能找到0和0以下的自定义索引的内容
	- 如果从1开始 索引顺序断了 后面的内容也找不到

- pairs

	- 建议使用它遍历各种不规则的表
	- 它可以得到所有信息

- for i,k in pairs(表) do 
	end
