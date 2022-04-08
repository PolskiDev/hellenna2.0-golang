-- @REPLACE RULES:

--from:  (func_ret, v)
--to:    (func_ret, v)

--from:  file:write(func_ret:sub(2).." := "..
--to:    file:write(func_ret:sub(2).." := "..


String = {}

--(NON-PORTABLE) - ONLY AVAILABLE ON GOLANG IMPLEMENTATION

--@ String.let (|variable|, "Hello world")
--@ String.let (|another_variable|, "ll")
--@ Console.WriteLine( |String.count_pattern( |$variable|,|$another_variable| ) |)

--@ Console.WriteLine( |String.count_pattern("&Hello Hello","&ll")| )

--@ String.let (|variable|, "&Hello Hello")
--@ Console.WriteLine( |String.count_pattern(|$variable|,"&ll")| )

function String.count_pattern(func_ret, s, pat)
    if s:sub(1,1) == "&" then
        if pat:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Count(\""..s:sub(2).."\", \""..pat:sub(2).."\")"

        elseif pat:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Count(\""..s:sub(2).."\", "..pat:sub(2)..")"

        else
            file:write(func_ret:sub(2).." := ".."strings.Count(\""..s.."\", "..pat..")"

        end

    elseif s:sub(1,1) == "$" then
        if pat:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Count("..s:sub(2)..", \""..pat:sub(2).."\")"

        elseif pat:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Count("..s:sub(2)..", "..pat:sub(2)..")"

        else
            file:write(func_ret:sub(2).." := ".."strings.Count("..s..", "..pat..")"
        end

    else
        if pat:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Count("..s..", \""..pat:sub(2).."\")"

        elseif pat:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Count("..s..", "..pat:sub(2)..")"

        else
            file:write(func_ret:sub(2).." := ".."strings.Count("..s..", "..pat..")"
        end

    end
    
end

-- FIND CHAR IN STRING
--@ let (|$variable:string|, "&Hello world")
--@ String.find(|$variable|, "&w")

--@ let (|$variable:string|, "&Hello world")
--@ let (|$char:string|, "&w")
--@ String.find(|$variable|, |$char|)

--@ String.find("&Hello world", "&w")
function String.find(func_ret, s, substring)
    if s:sub(1, 1) == "&" then
        if substring:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Index(\""..s:sub(2).."\", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Index(\""..s:sub(2).."\", "..substring:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Index(\""..s:sub(2).."\", "..substring..")"
        end

    elseif s:sub(1, 1) == "$" then
        if substring:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Index("..s:sub(2)..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Index("..s:sub(2)..", "..substring:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Index("..s:sub(2)..", "..substring..")"
        end
    else
        if substring:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Index("..s..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Index("..s..", "..substring:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Index("..s..", "..substring..")"
        end
    end
    
end

--@ Console.WriteLine(|String.slice("Hello world", |1:3|)|)
function String.slice(func_ret, s,seq)
    local seq_begin = seq:sub(1,seq:find(":")-1)    --var (name)
    local seq_end = seq:sub(seq:find(":")+1)      --var (type)

    
    if s:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."\""..s.."\"".."["..seq_begin..":"..(seq_end+1).."]"

    elseif s:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := "..s.."["..seq_begin..":"..(seq_end+1).."]"
    else
        file:write(func_ret:sub(2).." := "..s.."["..seq_begin..":"..(seq_end+1).."]"
    end
end


--@String.let(|cadeia|, "Hello World")
function String.let(name, string)
    if name:sub(1,1) == "$" then
        file:write("var "..name:sub(2).." string = \""..string.."\""..'\n')
    else
        file:write("var "..name.." string = \""..string.."\""..'\n')
    end
end


--@ String.let(|variable|, "Hello World")
--@ Console.WriteLine(Strings.replace(|variable|, "Hello","Bye"))

function String.replace(func_ret, var, x,y)
    if x:sub(1,1) == "&" then
        if y:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", \""..x:sub(2).."\",\""..y:sub(2).."\")"
        
        elseif y:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", \""..x:sub(2).."\","..y:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", \""..x:sub(2).."\","..y..")"
        end
    
    elseif x:sub(1,1) == "$" then
       
        if y:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", "..x:sub(2)..",\""..y:sub(2).."\")"
        
        elseif y:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", "..x:sub(2)..","..y:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", "..x:sub(2)..","..y..")"
        end

    else

        if y:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", "..x..",\""..y:sub(2).."\")"
        
        elseif y:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", "..x..","..y:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Replace("..var..", "..x..","..y..")"
        end
    end
end



--@ String.let(|cadeia|, "Hello World")
--@ String.split(|replaced_var|, |cadeia|, "-")
--@ Console.WriteLine(|$replaced_var|)

function String.split(func_ret, sv,split_char)
    file:write(func_ret:sub(2).." := strings.Split("..sv:sub(2)..",\""..split_char.."\")")
end


--@ Console.WriteLine(|String.uppercase("&hello world")|)
--@ Console.WriteLine(|String.uppercase(|$variable|)|)
--@ Console.WriteLine(|String.uppercase(|variable|)|)
function String.uppercase(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."strings.ToUpper(\""..s:sub(2).."\")"
    elseif s:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."strings.ToUpper("..s:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."strings.ToUpper("..s..")"
    end
end


--@ Console.WriteLine(|String.lowercase("&HELLO WORLD")|)
--@ Console.WriteLine(|String.lowercase(|$variable|)|)
--@ Console.WriteLine(|String.lowercase(|variable|)|)

function String.lowercase(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."strings.ToLower(\""..s:sub(2).."\")"
    elseif s:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."strings.ToLower("..s:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."strings.ToLower("..s..")"
    end
end


--@ Console.WriteLine(|String.len("&HELLO WORLD")|)
--@ Console.WriteLine(|String.len(|$variable|)|)
--@ Console.WriteLine(|String.len(|variable|)|)
function String.len(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."len(\""..s:sub(2).."\")"

    elseif s:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."len("..s:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."len("..s..")"
    end
end



-- STRING.INCLUDES
--@ Console.WriteLine( |String.includes("&HELLO WORLD", "&HELLO")| )

--@ Console.WriteLine( |String.includes(|$variable|,|$another|)| )
--@ Console.WriteLine( |String.includes(|variable|,|another|)| )

--@ Console.WriteLine( |String.includes(|variable|,"&HELLO")| )
--@ Console.WriteLine( |String.includes("&HELLO", |variable|)| )
function String.includes(func_ret, s,x)
    if s:sub(1,1) == "&" then
        --(s) is string
        if x:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Contains(\""..s:sub(2).."\",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Contains(\""..s:sub(2).."\","..x:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Contains(\""..s:sub(2).."\","..x..")"
        end

    elseif s:sub(1,1) == "$" then
        --(s) is variable
        if x:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Contains("..s:sub(2)..",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Contains("..s:sub(2)..","..x:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Contains("..s:sub(2)..","..x..")"
        end


    else
        --(s) is variable
        if x:sub(1,1) == "&" then
            file:write(func_ret:sub(2).." := ".."strings.Contains("..s..",\""..x:sub(2).."\")"
        
        elseif x:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." := ".."strings.Contains("..s..","..x:sub(2)..")"
        else
            file:write(func_ret:sub(2).." := ".."strings.Contains("..s..","..x..")"
        end
    end
end
