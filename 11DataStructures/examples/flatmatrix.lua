-- file: flatmatrix.lua
-- shows how you can represent a flat
-- matrix in lua.

-- make slat matrix. will look like:
-- {0, 0, 0,
--  0, 0, 0,
--  0, 0, 0}
function make_flat_matrix(rows, cols, fill)
    -- easy peasy. make an array of size rows x cols
    -- that contains all of the filler ;)
    local mat = {}
    for i = 1, rows*cols do
        mat[i] = fill
    end

    -- store dimensions (will need these later)
    mat.rows = rows
    mat.cols = cols

    return mat
end

-- print such a matrix
function print_flat_matrix(mat)
    io.write("{")

    -- loop through matrix items
    for i = 1, (mat.rows*mat.cols-1) do
        -- write out matrix item
        io.write(string.format("%d, ", mat[i]))

        -- if we are going from one row to the next,
        -- insert a line break and a space
        if (i%mat.cols) == 0 then
            io.write("\n ")
        end
    end

    -- write final item (without comma at the end)
    io.write(string.format("%d}\n", mat[#mat]))
end

-- create flat matrix
local matrix = make_flat_matrix(3, 3, 0)

-- increase all items by one
for i = 0, matrix.rows-1 do
    for j = 1, matrix.cols do
        matrix[i*matrix.cols + j] = 1 + matrix[i*matrix.cols + j]
    end
end

-- increase diagonal items
for i = 0, matrix.rows-1 do
    matrix[i*matrix.cols+i+1] = 1 + matrix[i*matrix.cols+i+1]
end

-- double diagonal items
for i = 0, matrix.rows-1 do
    matrix[i*matrix.cols+3-i] = 2 * matrix[i*matrix.cols+3-i]
end

-- print matrix
print("-- flat matrix")
print_flat_matrix(matrix)
