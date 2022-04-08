function declare_loop()
    file:write("for {",'\n')
end

function declare_while(condition)
    file:write("for "..condition.." {",'\n')
end
function declare_for(i,min,max,step)
    if step == nil then step = 1 end
    file:write("for "..i.." := "..min.."; "..i.." < "..max.."; "..i.."++ {",'\n')
    file:write(i.." := "..i.." + "..step..'\n')

end

function times(i, max)
    declare_for(i, 0,max, 1)
end

function declare_if(condition)
    file:write("if "..condition.." {",'\n')
end
function declare_elseif(condition)
    file:write("} else if "..condition.." {",'\n')
end
function declare_else(condition)
    file:write("} else {",'\n')
end



function declare_end()
    file:write("}",'\n')
end
function declare_break()
    file:write("break",'\n')
end