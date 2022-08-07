print("********************条件分支语句********************")
a = 9
--if 条件 then.....end
--单分支
if a > 5 then
	print("123")
end
--双分支
if a < 5 then
print("123")
else
print("321")
end
--多分支
--if 条件 them ...elseif 条件 then...elseif 条件 then...else...end
if a < 5 then
	print("123")
--lua中 elseif 一定是连这写 否则报错
elseif a == 6 then
	print("6")
elseif a==9 then
	print("9")
else 
	print("other")
end		

--lua中没有switch 需要自己实现