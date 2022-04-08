--@ increment |var:3|
function increment(pattern)
    local var = pattern:sub(1,pattern:find(":")-1)
    local num = pattern:sub(pattern:find(":")+1,#pattern)
    file:write(var.." = "..var.." + "..num,'\n')
end

--@ decrement |var:3|
function decrement(pattern)
    local var = pattern:sub(1,pattern:find(":")-1)
    local num = pattern:sub(pattern:find(":")+1,#pattern)
    file:write(var.." = "..var.." - "..num,'\n')
end