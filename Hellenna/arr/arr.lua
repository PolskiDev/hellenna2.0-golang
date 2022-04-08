NumericArray = {}
StdArray = {}

--@ NumericArray.new(3, 'students:string', "Julia, Mike, Jean")
--@ (Static size of the array)
function NumericArray.new(size, name,sequence)
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write(n.." := ["..size.."]"..t.."{"..sequence.."}")
end

--@ Array.new('students:string', "Julia, Mike, Jean")
--@ (Dynamic size of the array)
function StdArray.new(name,sequence)
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write(n.." := [...]"..t.."{"..sequence.."}")
end
