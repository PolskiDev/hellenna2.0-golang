-- @REPLACE RULES:

--from:  (v)
--to:    (func_ret, v)

--from:  return 
--to:    file:write(func_ret:sub(2).." := "..

Oper = {}

--@ New array with *size positions
--@ Oper.new(|vetor:string|, {{"Gabriel","Mike","Roberto"}} )
--@ Oper.new(|vetor:int|, {{2,4,6,8,10,12,14,16, ...}} )
function Oper.new(name,size)
    -- body
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write("var "..n.." ["..size.."]"..t)
end



--@ Add new value to an existing or new (index) in array
--@ Oper.set(|vetor:3|, "Gabriel")
function Oper.set(name, value)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    if value:sub(1,1) == "&" then
        file:write(n.."["..(pos-1).."] = \""..value:sub(2).."\"")

    elseif value:sub(1,1) == "$" then
        file:write(n.."["..(pos-1).."] = "..value:sub(2))

    else
        file:write(n.."["..(pos-1).."] = "..value)

    end
    
end

--@ Get value from an existing (index) in array
--@ Oper.get(|vetor:3|)
function Oper.get(func_ret, name)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    file:write(func_ret:sub(2).." := "..n.."["..(pos-1).."]")
end


--(NON-PORTABLE)
--@ Slice array from *begin until *final
--@ Oper.slice(|vetor|, 3,10)       --from char [3] until [10]
--@ Oper.slice(|vetor|, nil,10)     --from char (?? until [10]
--@ Oper.slice(|vetor|, 3,nil)      --from char [3] until (?)
function Oper.slice(func_ret, name,begin,final)
    if final == nil then final = "" end
    if begin == nil then begin = "" end
    file:write(func_ret:sub(2).." := "..name.."["..(begin-1)..":"..final.."]")
    
end



-- @Append at last position the element *value
--@ -> Oper.add(|vetor|, {{ 14 }} )
--@ -> Oper.add(|vetor|, {{ 0, 2, 4, 8, 16, 32, ...}} )

function Oper.add(name, value)
    -- |vetor|     (or)     |vetor:retorno|

    if value:sub(1,1) == "&" then
        file:write(name.." = append("..name..", \""..value.."\")")

    elseif value:sub(1,1) == "$" then
        file:write(name.." = append("..name..", "..value:sub(2)..")")
    else
        file:write(name.." = append("..name..", "..value..")")
    end

end