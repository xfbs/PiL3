-- file: days.lua

print("What will the following print?")
print('  sunday = "monday"; monday = "sunday"')
print('  t = {sunday = "monday", [sunday] = monday}')
print('  print(t.sunday, t[sunday], t[t.sunday]')
print()
print('Answer: it should print "monday sunday sunday"')
print('It is probably better understood if we show what')
print('the constructor is really doing:')
print('  t = {sunday = "monday", monday = "sunday"}')
print()
print('By this logic, the print statement should be more clear:')
print('  print(t.sunday, t.monday, t.monday)')
print()
print('Here is the actual output:')

sunday = "monday"
monday = "sunday"
t = {sunday = "monday", [sunday] = monday}
print(t.sunday, t[sunday], t[t.sunday])
