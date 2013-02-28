-- file: floaterror.lua

-- this should be 0, but it's not.
num = 12.7-20+7.3
eqn = "12.7-20+7.3"

print(eqn..'==0 is '..tostring(num==0)..', but it shoule be true!')
print(eqn..'='..num)
