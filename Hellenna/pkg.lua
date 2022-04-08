function define_package(name)
    file:write("package "..name.."\n")
end
function define_import(name)
    file:write("import \""..name.."\"\n")
end