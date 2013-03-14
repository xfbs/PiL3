-- file: data.lua
-- reads data.txt and outputs it's contents

-- callback function
books = {}
function Entry(book)
    books[#books+1] = book
end

-- run data (with callback function)
dofile("data.txt")

for i, book in ipairs(books) do
    print(string.format("%q, written by %s, was published in %d by %s.", 
        book.title, book.author, book.year, book.publisher))
end
