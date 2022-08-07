print("********************循环语句********************")

print("********************While语句********************")
num = 0
--while 条件 do ... end
while num < 5 do
	print(num)
	num = num + 1
end
print("********************do while语句********************")

num = 0 
--repeat ... until 跳出条件(满足就结束)
repeat
	print(num)
	num = num + 1
until num > 5 --满足条件跳出


print("********************for语句********************")
--for 变量名=起始值,结束值 do ... end
for i = 1,5 do --默认递增 每次+1
	print(i)
end

for i = 1,5,2 do --i每次加2
	print(i)
end

for i = 5,1,-1 do 
	print(i)
end