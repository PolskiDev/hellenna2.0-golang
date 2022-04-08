File = {}

-- STRING REFERENCE
--@ File.CreateFile("&text.txt")

-- VARIABLE REFERENCE
--@ let(|variable|, "text.txt")
--@ File.CreateFile(|$variable|)

-- VARIABLE REFERENCE
--@ let(|variable|, "text.txt")
--@ File.CreateFile(|variable|)

function File.CreateFile(filename)
    if filename:sub(1,1) == "&" then
        file:write("file, err := os.Create(\""..filename:sub(2).."\")"..'\n')

    elseif filename:sub(1,1) == "$" then
        file:write("file, err := os.Create("..filename:sub(2)..")"..'\n')
    else
        file:write("file, err := os.Create("..filename:sub(2)..")"..'\n')   
    end
     
    file:write("if err != nil { panic(err) }\n")
    file:write("deferfile.Close()\n") 
end


function File.WriteLine(filename, text)

    --@text
    if text:sub(1,1) == "&" then
        file:write("__filebyte := []byte(\""..text:sub(2).."\")")

    elseif text:sub(1,1) == "$" then
        file:write("__filebyte := []byte("..text:sub(2)..")")
    else
        file:write("__filebyte := []byte("..text:sub(2)..")")
    end


    --@filename
    if filename:sub(1,1) == "&" then
        file:write("err := ioutil.WriteFile(\""..filename:sub(2).."\", __filebyte,0644)\n")
    
    elseif filename:sub(1,1) == "$" then
        file:write("err := ioutil.WriteFile("..filename:sub(2)..", __filebyte,0644)\n")
    else
        file:write("err := ioutil.WriteFile("..filename..", __filebyte,0644)\n")
    end
    
    --@panic if err
    file:write("if err != nil { log.Fatal(err) }")
    

end
function File.ReadLine(filename, returned_string)
    if filename:sub(1,1) == "&" then
        if returned_string:sub(1,1) == "$" then
            file:write(returned_string:sub(2)..", err := ioutil.ReadFile(\""..filename:sub(2).."\")".."\n")
        else
            file:write(returned_string..", err := ioutil.ReadFile(\""..filename:sub(2).."\")".."\n")
        end

    elseif filename:sub(1,1) == "$" then
        if returned_string:sub(1,1) == "$" then
            file:write(returned_string:sub(2)..", err := ioutil.ReadFile("..filename:sub(2)..")".."\n")
        else
            file:write(returned_string..", err := ioutil.ReadFile("..filename:sub(2)..")".."\n")
        end
    else
        if returned_string:sub(1,1) == "$" then
            file:write(returned_string:sub(2)..", err := ioutil.ReadFile("..filename:sub(2)..")".."\n")
        else
            file:write(returned_string..", err := ioutil.ReadFile("..filename:sub(2)..")".."\n")
        end

    end

    --@panic if err
    file:write("if err != nil { log.Fatal(err) }")    
    
end