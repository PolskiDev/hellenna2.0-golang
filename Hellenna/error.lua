--@ ThrowError "System has been crashed!"
function ThrowError(s)
    file:write("panic(\""..s.."\")")
end