function fwrite(fmt, ...)
    return io.write(string.format(fmt, ...))
end

--fwrite() raises an error (since fmt can't be nil)
fwrite("a\n")
fwrite("%d %d\n", 4, 5)
