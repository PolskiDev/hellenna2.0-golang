Console = {}

-- Console.ReadLine("x:string")
-- Console.ReadLine("x:int")
function Console.ReadLine(s)
    

    local t = s:sub(s:find(":")+1)      --var (type)
    local n = s:sub(1,s:find(":")-1)    --var (name)

    file:write("var "..n.." "..t,'\n')
    file:write("fmt.Scanln(&"..n..")",'\n')


end



--@ Console.WriteLine("&Hello world")       --> String
--@ Console.WriteLine("$x")              --> Variable
--@ Console.WriteLine(|136|)                --> Numeric

function Console.WriteLine(s)
    if s:sub(1,1) == "&" then
        file:write("fmt.Println(\""..s:sub(2).."\")",'\n')
    
    elseif s:sub(1,1) == "$" or s:sub(1,1) == "@" then
        file:write("fmt.Println("..s:sub(2)..")",'\n')
    else
        file:write("fmt.Println("..s..")",'\n')
    end
    
end
function Console.Write(s)
    if s:sub(1,1) == "&" then
        file:write("fmt.Print(\""..s:sub(2).."\")",'\n')
    
    elseif s:sub(1,1) == "$" or s:sub(1,1) == "@" then
        file:write("fmt.Print("..s:sub(2)..")",'\n')
    
    else
        file:write("fmt.Print("..s..")",'\n')
    end
    
end