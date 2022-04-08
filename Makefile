### Hellenna Improved

#@ Compiler
CC= helc

#@ UNIXes (built from source)
#LUA=./lua

#@ Windows/UNIX (Global)
LUA=lua


all:
	$(LUA) $(CC) main-mod.x --transpile main-mod
	$(LUA) $(CC) main.x --build main