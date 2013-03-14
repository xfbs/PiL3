-- file: matrix.lua
-- shows how to use matrices in lua

-- make a 2d matrix, will look like:
-- {{0, 0, 0},
--  {0, 0, 0},
--  {0, 0, 0}}
function make_2d_matrix(rows, cols, fill)
    mat = {}

    -- add one array for each row
    for i = 1, rows do
        mat[i] = {}

        -- fill that array with cols times the filler
        for j = 1, cols do
            mat[i][j] = fill
        end
    end

    return mat
end

-- print a 2d matrix
function print_2d_matrix(mat)
    -- generate a string to represent one row
    local function print_2d_matrix_row(row)
        local str = {}

        -- go thru each item of the row and
        -- turn it into a string
        for i = 1, #row-1 do
            str[#str+1] = string.format("%d,", row[i])
        end

        -- the last one needs to be handled differently
        -- since it doesn't need a comma at the end
        str[#str+1] = string.format("%d", row[#row])
        
        -- concatenate all the string and return
        -- the result
        return table.concat(str, " ")
    end

    -- print first row of matrix
    io.write(string.format("{{%s},\n", print_2d_matrix_row(mat[1])))

    -- print all the stuff in between
    for i = 2, #mat-1 do
        io.write(string.format(" {%s},\n", print_2d_matrix_row(mat[i])))
    end

    -- and now the last row
    io.write(string.format(" {%s}}\n", print_2d_matrix_row(mat[1])))
end

-- make 2d matrix
local matrix = make_2d_matrix(3, 3, 0)

-- fill it up with some values
for i = 1, 3 do
    matrix[i][i] = 1
end
for i = 1, 3 do
    matrix[4-i][i] = 1 + matrix[4-i][i]
end

-- print it ;)
print("-- 2d matrix")
print_2d_matrix(matrix)
