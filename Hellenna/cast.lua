-- @REPLACE RULES:

--from:  (v)
--to:    (func_ret, v)

--from:  return 
--to:    file:write(func_ret:sub(2).." := "..


    -- @Micro embedded parser
     t = t:gsub("int","isize")
     t = t:gsub("uint","usize")
     t = t:gsub("rune","u8")    
     
     t = t:gsub("int8","i8")
     t = t:gsub("int16","i16")
     t = t:gsub("int32","i32")
     t = t:gsub("int64","i64")
     
     t = t:gsub("uint8","u8")
     t = t:gsub("uint16","u16")
     t = t:gsub("uint32","u32")
     t = t:gsub("uint64","u64")
     t = t:gsub("uintptr","u32")
     
     
     t = t:gsub("byte","u8")
     t = t:gsub("short","u16")
     t = t:gsub("long","u32")
     
     t = t:gsub("float","f32")
     t = t:gsub("double","f64")
     
     t = t:gsub("boolean","bool")
     t = t:gsub("string","&str")


Cast = {}
function Cast.toString(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."string(\""..v:sub(2).."\")"
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."string("..v:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."string("..v..")"
    end
end
function Cast.toBoolean(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."boolean(\""..v:sub(2).."\")"
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."boolean("..v:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."boolean("..v..")"
    end
end


--@FLOAT
function Cast.toFloat(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."float32(\""..v:sub(2).."\")"
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."float32("..v:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."float32("..v..")"
    end
end
function Cast.toDouble(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."float64(\""..v:sub(2).."\")"
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."float64("..v:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."float64("..v..")"
    end
end


--@INTEGER
function Cast.toInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."int(\""..v:sub(2).."\")"
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."int("..v:sub(2)..")"
    else
        file:write(func_ret:sub(2).." := ".."int("..v..")"
    end
end
function Cast.toInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."int8(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."int8("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."int8("..v..")")
    end
end
function Cast.toInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."int16(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."int16("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."int16("..v..")")
    end
end
function Cast.toInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."int32(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."int32("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."int32("..v..")")
    end
end
function Cast.toInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."int64(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."int64("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."int64("..v..")")
    end
end

--@UNSIGNED INTEGER
function Cast.toUInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."uint(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."uint("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."uint("..v..")")
    end
end
function Cast.toUInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."uint8(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."uint8("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."uint8("..v..")")
    end
end
function Cast.toUInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."uint16(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."uint16("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."uint16("..v..")")
    end
end
function Cast.toUInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."uint32(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."uint32("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."uint32("..v..")")
    end
end
function Cast.toUInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."uint64(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."uint64("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."uint64("..v..")")
    end
end

--@ONLY AVAILABLE ON GOLANG IMPLEMENTATION
function Cast.toComplex64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."complex64(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."complex64("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."complex64("..v..")")
    end
end
function Cast.toComplex128(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." := ".."complex128(\""..v:sub(2).."\")")
    elseif v:sub(1,1) == "$" then
        file:write(func_ret:sub(2).." := ".."complex128("..v:sub(2)..")")
    else
        file:write(func_ret:sub(2).." := ".."int8("..v..")")
    end
end