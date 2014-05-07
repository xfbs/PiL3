--[[
--  Chapter 10, Exercise 2
--
--  An alternative implementation for the eight-queen problem would be to generate
--  all possible permutations of 1 to 8 and, for each permutation, to check whether it is valid.
--  Change the program to use this approach. How does the performance of the new program compare
--  with the old one? (Hint: compare the total nubmer of permutations with the number of times that
--  the original program calls funciton isplaceok.)
--
--  Solution:
--]]

local N = 8

-- permgen function from previous chapter
local function permgen(a, n)
	n = n or #a
	if n <= 1 then
		coroutine.yield(a)
	else
		for i=1,n do
			a[n], a[i] = a[i], a[n]
			permgen(a, n-1)
			a[n], a[i] = a[i], a[n]
		end
	end
end

-- permutations generator
local function permutations(a)
	local co = coroutine.create(function () permgen(a) end)
	return function ()
		local code, res = coroutine.resume(co)
		return res
	end
end


-- check whether positon (n, c) is free from attacks
local function isplaceok(a, n, c)
	for i=1,n-1 do
		if (a[i] == c) or
		   (a[i] - i == c - n) or
		   (a[i] + i == c + n) then
		   return false
	   end
	end
	return true
end

local function printsolution(a)
	for i=1,N do
		for j=1,N do
			io.write(a[i] == j and "X" or "-", " ")
		end
		io.write("\n")
	end
	io.write("\n")
end

-- generating and checking all permutations
for p in permutations{1, 2, 3, 4, 5, 6, 7, 8} do
	local is_perm_ok = true

	--check every queen in this permutation
	for i=1, N do
		if not isplaceok(p, i, p[i]) then
			is_perm_ok = false
			break -- break if a queen is attacked
		end
	end

	if is_perm_ok then -- print solution only if all queens are ok
		printsolution(p)
	end
end
