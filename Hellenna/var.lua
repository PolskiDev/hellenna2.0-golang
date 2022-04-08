function var(name,value)
    if value:sub(1,1) == "&" then
        -- String:      &Arnold
        file:write(name.." = \""..value:sub(2).."\"",'\n')
    
    elseif value:sub(1,1) == "$" then
        -- Variable (or) function that returns a string
        file:write(name.." = "..value:sub(2),'\n')
    else
        -- Number:      136
        file:write(name.." = "..value,'\n')
    end
end


function let(name,value)
    value = tostring(value)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    local t = name:sub(name:find(":")+1)      --var (type)

    if name:find(":") ~= nil then
        --@exists explicit declaration
        if n:sub(1,1) == "$" then
            if value:sub(1,1) == "&" then
                file:write("var "..n:sub(2).." "..t.." = \""..value:sub(2).."\"\n")

            elseif value:sub(1,1) == "$" then
                file:write("var "..n:sub(2).." "..t.." = "..value:sub(2).."\n")
            else
                file:write("var "..n:sub(2).." "..t.." = "..value.."\n")
            end

        else
            if value:sub(1,1) == "&" then
                file:write("var "..n.." "..t.." = \""..value:sub(2).."\"\n")

            elseif value:sub(1,1) == "$" then
                file:write("var "..n.." "..t.." = "..value:sub(2).."\n")
            else
                file:write("var "..n.." "..t.." = "..value.."\n")
            end
            
        end

    else

        --@exists inference (NOT WORKING)
        if n:sub(1,1) == "$" then
            file:write(n:sub(2).." := "..t,'\n')
        else
            file:write(n.." := "..t,'\n')
        end

    end
end