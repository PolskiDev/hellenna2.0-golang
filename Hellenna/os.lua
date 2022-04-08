System = {}

function System.Process(cmd)
    file:write("cmd := exec.Command(\""..cmd.."\")".."\n")
    file:write("err := cmd.Run()".."\n")
    file:write("if err != nil { log.Fatal(err) }".."\n")

end


function System.ifwindows()
    file:write("if runtime.GOOS == \"windows\" {")
    --  Close with:     ..;
end
function System.iflinux()
    file:write("if runtime.GOOS == \"linux\" {")
    --  Close with:     ..;
end
function System.ifdarwin()
    file:write("if runtime.GOOS == \"darwin\" {")
    --  Close with:     ..;
end

--@Alias
function System.ifunix()
    System.iflinux()
    --  Close with:     ..;
end