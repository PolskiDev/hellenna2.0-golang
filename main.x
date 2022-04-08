(import) "Hellenna.lang"
(import) "Hellenna.stdio"
(import) "Hellenna.error"
(import) "Hellenna.stdtab"
(import) "Hellenna.var"
(import) "Hellenna.arr.arr"
(import) "Hellenna.arr.oper"
(import) "Hellenna.incr"
(import) "Hellenna.loops"
(import) "Hellenna.file"
(import) "Hellenna.fn"
(import) "Hellenna.pkg"
(import) "Hellenna.os"
(import) "Hellenna.mod"


namespace "main"
    (package) "main"

    (import_go) "fmt"
    #@ (import_go) "strings"
    #@ (import_go) "bufio"
    #@ (import_go) "os"
    #@ (import_go) "io"
    

    fn("main:void") >>
        (import_module) "main"

        #@ let( |$nome:string|, "&Gabriel" )
        #@ let( |$idade:int|, 16)

        Console.WriteLine "&Hallo Welt"
        Console.WriteLine |"Hello "+"Darwin"|

    ..;

    
..?