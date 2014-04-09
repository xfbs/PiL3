#!/usr/bin/env
-- file: combinations.lua
-- Exercise 5.4: Write a function that receives an array and prints all
-- combinations of the elements in the array.


-- returns array in a format {{1,2}, {1,3} ...}
-- every element in returned array is a table with one combination
function combinations(arr, r)
	-- do noting if r is bigger then length of arr
	if(r > #arr) then
		return {}
	end

	--for r = 0 there is only one possible solution and that is a combination of lenght 0
	if(r == 0) then
		return {}
	end

	if(r == 1) then
		-- if r == 1 than retrn only table with single elements in table
		-- e.g. {{1}, {2}, {3}, {4}}

		local return_table = {}
		for i=1,#arr do
			table.insert(return_table, {arr[i]})
		end

		return return_table
	else
		-- else return table with multiple elements like this
		-- e.g {{1, 2}, {1, 3}, {1, 4}}

		local return_table = {}

		--create new array without the first element
		local arr_new = {}
		for i=2,#arr do
			table.insert(arr_new, arr[i])
		end

		--combinations of (arr-1, r-1)
		for i, val in pairs(combinations(arr_new, r-1)) do
			local curr_result = {}
			table.insert(curr_result, arr[1]);
			for j,curr_val in pairs(val) do
				table.insert(curr_result, curr_val)
			end
			table.insert(return_table, curr_result)
		end

		--combinations of (arr-1, r)
		for i, val in pairs(combinations(arr_new, r)) do
			table.insert(return_table, val)
		end

		return return_table
	end
end

function all_combinations(array)
	for i=1, #array, 1 do
		for i, val in pairs(combinations(array, i)) do
			for j, combination in pairs(val) do
				if(j==#val) then -- don't print , if last element
					io.write(combination)
				else
					io.write(combination..",")
				end
			end
			print()
		end
	end
end

print("enter array items, when done enter 'end'")
array = {}
repeat
    array[#array+1] = item or nil
    item = io.read()
until item == "end"

print("All possible combinations:")
all_combinations(array)
