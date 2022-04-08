function import_module(module_name) --TA COM PROBLEMA
    local open = io.open    
    local function read_file(path)
        local file = open(path, "rb") -- r read mode and b binary mode
        if not file then return nil end
        local content = file:read "*a" -- *a or *all reads the whole file
        file:close()
        return content
    end

    local GO_MOD = read_file(module_name.."-mod.go")
    file:write(GO_MOD)
    

end
function module(module_name)
    --s:sub(s:find("%-"), #s)
    file = io.open(module_name.."-mod.go", "w")

    --# $rust = File.new(module_name+"-mod.rs",'w+')
end
function interrupt()
    file:flush()
    file:close()
end