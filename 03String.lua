print("********************字符串********************")

str = "双引号字符串"
str2= '单引号字符串'

--获取字符串的长度
print("********************字符串长度********************")
s = "aBCDeFG字符串"
print(#s)
s = "aBCDeFG"
print(#s)
s = "串"
print(#s)
--汉字字符串的长度：一个汉字占三个长度
--英文字符占一个长度
print("********************字符串多行打印********************")
--Lua中也是支持转义字符
print("123\n456")

s=[[我在
学	
Lua]]
print(s)
print("********************字符串拼接********************")
--字符串拼接 通过 ..
print("123".."456")
print("123"..s)
s1 = "123123"
s2 = 111
print(s1..s2)

print(string.format("我在学Lua第%d天了",3))
--%d :与数字拼接
--%a ：与任何字符拼接
--%s:与字符配对
--。。。。。还有很多
print("********************别的类型转字符串********************")
a = true
print(tostring(a))--print本身自带转字符串
print("********************字符串提供的公共方法********************")
str = "abCdegG"
--小写转大写的方法
print(string.upper(str))
print(str)--不会改变原字符串
--大写转小写的方法
print(string.lower(str))
--翻转字符串
print(string.reverse(str))
--字符串索引查找
print(string.find(str,"Cde"))--Lua支持多返回值，索引从1开始
--截取字符串
print(string.sub(str,3))
print(string.sub(str,3,4))
--字符串重复
print(string.rep(str,2))
--字符串修改
print(string.gsub(str,"Cd","**"))
str = "abCdegGCd"
print(string.gsub(str,"Cd","**"))
--字符转ASCII码
a=string.byte("Lua",1)
print(a)
--ASCII码转字符
print(string.char(a))