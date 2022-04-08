Std = {}


-- Std.table("Dog")
--      Std.def(|height:float|)
--      Std.def(|age:int|)
--      Std.def(|name:string|)
--
-- ..;

--@ Create new table -> Std.table("Name")
function Std.table(name)
    file:write("type "..name.." struct {".."\n")
end
function Std.declare_end()
    file:write("}\n")
end

--@ Create new item/element inside the table -> Std.def(|name:type|)
function Std.def(name)
    local t = name:sub(name:find(":")+1)      --struct element (type)
    local n = name:sub(1,name:find(":")-1)    --struct element (name)

    file:write(n.." "..t,'\n')
end

--


--@ Create a new object -> Std.let(|object.Table|, |height, age, name|)
--@ -> Console.WriteLine |object.height|

function Std.let(name, arguments)
    local Class = name:sub(1,name:find("%.")-1)    --Object Element (name)
    local object = name:sub(name:find("%.")+1)    --Class Table
    
    if class:sub(1,1) == "&" then
        file:write(object.." := "..Class:sub(2).."{"..arguments.."}\n")
    
    elseif class:sub(1,1) == "$" then
        file:write(object.." := "..Class:sub(2).."{"..arguments.."}\n")
    else
        file:write(object.." := "..Class.."{"..arguments.."}\n")
    end
    
end